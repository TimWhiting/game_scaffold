# Mutations Strategy for Game Scaffold

## Mutations API Overview

Riverpod 3.0 introduces `Mutation<T>()` for handling side-effects like button clicks, form submissions, etc.

```dart
// Declare at top-level
final addTodoMutation = Mutation<void>();

// In UI, trigger with a callback
addTodoMutation.run(ref, (tsx) async {
  // Your async side-effect here
  await tsx.get(todoListProvider.notifier).addTodo('New Todo');
});

// Watch the mutation state
final state = ref.watch(addTodoMutation);
switch (state) {
  case MutationIdle() => Text('Ready'),
  case MutationPending() => CircularProgressIndicator(),
  case MutationError() => Text('Error: ${state.error}'),
  case MutationSuccess() => Text('Success!'),
}
```

Key points:
- `mutation.run(ref, callback)` triggers the side-effect
- `tsx.get()` keeps providers alive during async (unlike `ref.read()`)
- State is `MutationIdle/Pending/Error/Success`

## Problem: Shared State Across Players

In your multi-player architecture with scoped `playerIDProvider`:

```dart
// Each player has their own client
multiplayerGameClientProvider.family<PlayerID>
```

But mutations are global:
```dart
final joinGameMutation = Mutation<PlayerName>();
```

When Player A joins and Player B joins simultaneously, they share the same mutation state. This means:
- Both players see the same loading spinner
- If Player A's join succeeds, the success state overwrites Player B's pending state
- You lose per-player operation tracking

## Solution: Use Keys for Separate State

Riverpod mutations support a `call()` method to pass a key, creating separate state instances:

```dart
final deleteTodoMutation = Mutation<void>();

// Watch with a key to get separate state
final deleteState = ref.watch(deleteTodoMutation(todo.id));

// Run with the same key
deleteState.run(ref, (tsx) async {
  // Delete the todo
});
```

For your game scaffold:

```dart
// Shared mutations - all players can safely share state
final createGameMutation = Mutation<GameCode>();
final deleteGameMutation = Mutation<bool>();
final fetchGamesMutation = Mutation<IList<GameInfo>?>();

// Player-specific mutations - use keys for separate state
final joinGameMutation = Mutation<PlayerName>();

// In UI with scoped playerIDProvider:
final playerID = ref.watch(playerIDProvider);
final joinState = ref.watch(joinGameMutation(playerID));

// Trigger for this player
ElevatedButton(
  onPressed: () {
    joinGameMutation(playerID).run(ref, (tsx) async {
      final playerID = tsx.get(playerIDProvider);
      final client = tsx.get(multiplayerGameClientProvider(playerID).notifier);
      return await client.joinGame();
    });
  },
  child: switch (joinState) {
    MutationIdle() => Text('Join Game'),
    MutationPending() => CircularProgressIndicator(),
    MutationError() => Text('Error: ${joinState.error}'),
    MutationSuccess(:final value) => Text('Joined as: $value'),
  },
);
```

The `.call(playerID)` combined with scoped `playerIDProvider` ensures:
- Each player gets isolated mutation state
- Player A joining doesn't interfere with Player B joining
- Each player sees their own loading/error/success state

## Important: Scoped Providers and Mutations Need Investigation

**Before implementation, we need to verify**: Can mutations safely use `tsx.get()` with scoped providers?

### The Question

Scoped providers like `playerIDProvider` are overridden in a `ProviderScope` widget higher up the tree. But mutations run in a callback context that might not have access to those scope overrides:

```dart
// This pattern needs testing:
joinGameMutation(playerID).run(ref, (tsx) async {
  // Problem: Does tsx.get(playerIDProvider) resolve to the scope override?
  final playerID = tsx.get(playerIDProvider);
  final client = tsx.get(multiplayerGameClientProvider(playerID).notifier);
  return await client.joinGame();
});
```

### Conservative Pattern: Pass Values, Not Scope

Until verified, use this safer pattern - **watch scoped providers in the widget, then pass their values**:

```dart
class JoinGameButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch scoped provider where scope is available
    final playerID = ref.watch(playerIDProvider);
    final joinState = ref.watch(joinGameMutation(playerID));
    
    return ElevatedButton(
      onPressed: () {
        joinGameMutation(playerID).run(ref, (tsx) async {
          // playerID is already available from widget scope - don't re-get it
          final client = tsx.get(
            multiplayerGameClientProvider(playerID).notifier
          );
          return await client.joinGame();
        });
      },
      child: switch (joinState) {
        MutationIdle() => Text('Join Game'),
        MutationPending() => CircularProgressIndicator(),
        MutationError() => Text('Error: ${joinState.error}'),
        MutationSuccess(:final value) => Text('Joined as: $value'),
      },
    );
  }
}
```

This works because:
- `playerID` is watched in the widget context where scopes are active
- We use the concrete `playerID` value as the mutation key
- We only use `tsx.get()` for non-scoped providers
- No reliance on scope being available inside the mutation callback

### Next Steps

1. Create mutations in `dart/lib/src/core/clients/mutations.dart`
2. Test with simple examples to verify scoped provider behavior in `tsx.get()`
3. Document the findings and update implementation patterns accordingly

## Implementation Strategy

### 1. All Mutations Are Keyed by PlayerID

Since each player maintains their own `MultiplayerGameClient` state via scoped/family providers, **every mutation must be keyed by `playerID`** to avoid state collision between concurrent players:

```dart
// ALL mutations use .call(playerID) for per-player state isolation
final fetchGamesMutation = Mutation<IList<GameInfo>?>();
final createGameMutation = Mutation<GameCode>();
final deleteGameMutation = Mutation<bool>();
final joinGameMutation = Mutation<PlayerName>();
final startGameMutation = Mutation<bool>();
final sendEventMutation = Mutation<bool>();
final readyNextRoundMutation = Mutation<bool>();
final exitGameMutation = Mutation<bool>();
```

Each player sees only the games they're part of because:
- `playerIDProvider` is scoped - each widget subtree has its own playerID
- `multiplayerGameClientProvider(playerID)` is family-based - each player has their own client instance
- Game lists, joins, events, etc. all operate on that player's isolated client

### 2. Use in UI (Per-Player Pattern)

Each player's operations are isolated using keyed mutations with `playerID`:

```dart
class GameOperationsExample extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerID = ref.watch(playerIDProvider);
    
    // Watch per-player mutation states
    final joinState = ref.watch(joinGameMutation(playerID));
    final sendEventState = ref.watch(sendEventMutation(playerID));
    final readyState = ref.watch(readyNextRoundMutation(playerID));
    final exitState = ref.watch(exitGameMutation(playerID));
    
    return Column(
      children: [
        // Join game
        ElevatedButton(
          onPressed: () => joinGameMutation(playerID).run(ref, (tsx) async {
            final client = tsx.get(gameClientProvider);
            return await client.joinGame();
          }),
          child: switch (joinState) {
            MutationIdle() => Text('Join Game'),
            MutationPending() => CircularProgressIndicator(),
            MutationError() => Text('Join Error'),
            MutationSuccess() => Text('Joined!'),
          },
        ),
        
        // Send event
        ElevatedButton(
          onPressed: () => sendEventMutation(playerID).run(ref, (tsx) async {
            final client = tsx.get(gameClientProvider);
            // Player sends their event
            final event = GameEvent(playerID, /* ... */);
            return await client.sendEvent(event);
          }),
          child: switch (sendEventState) {
            MutationIdle() => Text('Send Move'),
            MutationPending() => CircularProgressIndicator(),
            MutationError() => Text('Send Error'),
            MutationSuccess() => Text('Sent!'),
          },
        ),
        
        // Ready for next round
        ElevatedButton(
          onPressed: () => readyNextRoundMutation(playerID).run(ref, (tsx) async {
            final client = tsx.get(gameClientProvider);
            return await client.readyNextRound();
          }),
          child: switch (readyState) {
            MutationIdle() => Text('Ready'),
            MutationPending() => CircularProgressIndicator(),
            MutationError() => Text('Error'),
            MutationSuccess() => Text('Ready!'),
          },
        ),
        
        // Exit game
        ElevatedButton(
          onPressed: () => exitGameMutation(playerID).run(ref, (tsx) async {
            final client = tsx.get(gameClientProvider);
            return await client.exitGame();
          }),
          child: switch (exitState) {
            MutationIdle() => Text('Exit'),
            MutationPending() => CircularProgressIndicator(),
            MutationError() => Text('Error'),
            MutationSuccess() => Text('Exited'),
          },
        ),
      ],
    );
  }
}
```

This ensures:
- Each player's mutation state is independent: `mutation(playerID1)` and `mutation(playerID2)` don't interfere
- Multiple players in same app can each show their own loading/success/error state
- No manual state management needed



## How Per-Player Mutations Work with Scopes

The pattern works by using `playerID` from scoped context as the mutation key:

```dart
// Player A's scoped context
ProviderScope(
  overrides: [playerIDProvider.overrideWithValue('alice')],
  child: Builder(builder: (context) {
    // ref.watch(playerIDProvider) returns 'alice' in this scope
    return GameWidget(); // Uses sendEventMutation('alice') as key
  }),
)

// Player B's scoped context  
ProviderScope(
  overrides: [playerIDProvider.overrideWithValue('bob')],
  child: Builder(builder: (context) {
    // ref.watch(playerIDProvider) returns 'bob' in this scope
    return GameWidget(); // Uses sendEventMutation('bob') as key - DIFFERENT state!
  }),
)
```

In `GameWidget`:
```dart
final playerID = ref.watch(playerIDProvider); // 'alice' or 'bob' depending on scope
final sendState = ref.watch(sendEventMutation(playerID)); // Different state per key

// playerID is captured in closure for mutation callback
sendEventMutation(playerID).run(ref, (tsx) async {
  // playerID available from closure - player's own game client
  final client = tsx.get(gameClientProvider); // Gets player's own MultiplayerGameClient
  return await client.sendEvent(event);
});
```

This achieves:
1. **Per-player isolation** - Each `playerID` key gets its own mutation state
2. **No state collision** - Alice's "sending event" state doesn't affect Bob's
3. **Automatic sync** - `playerID` from scope automatically becomes the mutation key
4. **UI reactivity** - Each player's UI shows their own loading/error/success state
5. **Safe provider resolution** - Only call `tsx.get()` on non-scoped providers like `gameClientProvider`



## Benefits

- ✅ No manual state management for async operations
- ✅ Built-in loading/error/success states
- ✅ Automatic disposal safety via `tsx.get()`
- ✅ Per-player isolation without architectural changes
- ✅ Simple API - just `mutation.run(ref, callback)`
