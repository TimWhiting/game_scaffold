# Game Scaffold Riverpod v3 Simplification Analysis

## Architecture Overview

The game_scaffold library has three abstraction layers:

1. **App Level** (Scoped Providers)
   - `playerIDProvider`: Which client is active
   - `serviceType`: Which backend (on-device, Firebase, WebSocket)
   - `gameService`: Backend-agnostic service interface

2. **Backend Instances** (Manual ProviderContainers)
   - Each game gets an isolated container with its own `LobbyNotifier`, `GameStateNotifier`
   - Logically models each game as an independent backend instance
   - Supports runtime backend switching per-game

3. **Streaming Layer** (StreamController)
   - `RoundService` normalizes different backend APIs into unified `Stream<GameState>` interface
   - Works with on-device, Firebase, WebSocket implementations

4. **Side-Effects Layer** (NEW: Mutations)
   - Game operations (`create`, `join`, `delete`, `start`)
   - Provides loading/error/success states to UI

---

## Riverpod v3 Key Improvements

| Feature | Current | v3 | Benefit |
|---------|---------|----|---------| 
| Notifier API | `StateNotifier`, `FamilyNotifier`, `AutoDisposeNotifier` | Single `Notifier` class | Fewer abstractions |
| Side-Effects | Manual async + error handling | `Mutation` providers | Built-in loading/error/success states |
| Async Safety | Manual `mounted` checks | `Ref.mounted` | Cleaner disposal handling |
| Ref Types | Different types per provider | Single `Ref` class | Simpler signatures |

---

## Error Handling Architecture

### Current Design: Separated Concerns

Your backend splits error handling into two streams:

1. **Game State** (`gameStream()`): Deterministic, shared state for all players
2. **Error Stream** (`errorStream()`): Player-specific errors, doesn't mutate shared state

**Why this is correct**:
- Game state must be identical across all clients for consistency
- A player making an invalid move shouldn't affect other players' state
- Error handling is inherently client-specific (different players get different errors)
- Prevents cascade failures from one client affecting others

**Current Implementation**:
- `BackendProviders.error`: `StateProvider<GameError?>`
- `GameStateNotifier.handleEvent()`: Sets error but doesn't change `gameState`
- `OnDeviceRoundService.errorStream()`: Filters errors by `playerID`

### Could This Be Simplified?

**Analysis**: No clear simplification without losing important properties.

Potential approaches and their problems:

1. **Merge errors into GameState** 
   - ✗ Would require all clients to filter for their own errors anyway
   - ✗ Adds unrelated data to game state snapshots
   - ✗ No cleaner API

2. **Use AsyncValue for errors**
   - ✗ Game state is not "loading" when an error occurs (game is running fine)
   - ✗ Conflates operation state with game state

3. **Error as a side-effect (Mutation)**
   - ✓ Could work for client-initiated operations (create game, join game)
   - ✗ Doesn't help for in-game errors (invalid move, disconnection)
   - ✗ Still need server→client error stream for non-operation errors

### Recommendation

**Keep the current split** but improve documentation:

1. Document why errors are separate (code comments on `BackendProviders.error`)
2. Add doc comments to `RoundService.errorStream()` explaining player-ID filtering
3. Consider if mutation-based errors make sense for setup phase (`createGame`, `joinGame`, `startGame`)

The separation is an architectural strength, not a problem.

---

---

## Client API Simplification Analysis

### Current Client Layer Complexity

**Files**: `game_client.dart`, `providers.dart`, `on_device.dart`

**Main Issues**:

1. **MultiplayerGameClient (StateNotifier)** - Mixing concerns:
   - Game service selection logic (via `T service<T>(T Function(GameService) service)`)
   - State management (playerName, code, config, games, service)
   - Async operations (createGame, joinGame, deleteGame, fetchOldGames)
   - Async result handling and state updates (manual)

2. **Service Selection Pattern** - Scattered logic:
   - Switch in `gameServiceFamily` provider
   - Switch in `roundServiceFamily` provider
   - Switch repeated for each backend type
   - New backends require edits in multiple places

3. **Streams in OnDeviceRoundService** - Verbose patterns:
   - Manual `StreamController` creation for each stream method
   - Explicit `listen()` + `add()` loops in 4 methods
   - Direct `ProviderContainer` access from public service class
   - No cleanup guarantee if consumer disposes early

4. **Async State Management** - Manual handling:
   - Manual try-catch patterns would be needed (not visible in current code)
   - Manual loading state tracking (not implemented, UI would need workarounds)
   - Manual error state tracking (not implemented, UI would need workarounds)
   - Manual race condition prevention (not implemented)

### Simplification Opportunities

#### 1. Service Selection - Keep Current Approach

**Current**:
```dart
// In providers.dart - duplicate switch logic
final gameServiceFamily = Provider.autoDispose.family<GameService, ServiceType>(
  (ref, serviceType) => switch (serviceType) {
    OnDeviceService => ref.watch(onDeviceGameService),
    _ => throw UnsupportedError('Unsupported service type'),
  },
  ...
);

final roundServiceFamily = Provider.autoDispose.family<RoundService, ServiceType>(
  (ref, serviceType) => switch (serviceType) {
    OnDeviceService => ref.watch(onDeviceRoundService),
    _ => throw UnsupportedError('Unsupported service type'),
  },
  ...
);
```

**Why a ServiceRegistry won't work**:

While a registry would reduce duplication, it creates a fundamental constraint: the `RoundService` providers can have different dependencies per implementation, and those dependencies are dynamic.

For example:
- `OnDeviceRoundService` depends on: `OnDeviceGameService` + backend container
- `FirebaseRoundService` might depend on: `FirebaseGameService` + Firestore instance + auth
- `WebSocketRoundService` might depend on: `WebSocketGameService` + connection instance

A registry would need to hold `Provider<RoundService>` values, but you can't construct a single `Provider<RoundService>` that represents all possible implementations with their varying dependencies. Each implementation needs its own provider because the dependencies are different and dynamic per type.

The `gameService` provider passed to the registry would also have dynamic dependencies, creating a circular problem: you'd need to know all the service providers upfront to register them, but you can't wrap them in a registry provider without losing the ability to express their individual dependencies.

**Conclusion**: Keep the current `switch` statements in both `gameServiceFamily` and `roundServiceFamily`. This pattern correctly expresses that each service type has distinct, implementation-specific dependencies that must be resolved dynamically at runtime.

---

#### 2. Extract Operations Into Mutations

**Current** (in `MultiplayerGameClient`):
```dart
Future<GameCode> createGame() async {
  final code = await service((c) => c.createGame(multiplayerID, state.config!));
  setGameCode(code);
  return code;
}
```

Problems:
- No loading state for UI
- No built-in error state
- Manual disposal safety needed
- Async patterns duplicated 4× (createGame, joinGame, deleteGame, startGame)

**Simplified** (Phase 1):
Create a `Mutation` for each operation in providers:

```dart
final createGameMutation = Mutation<GameCode>();

// In UI, trigger via:
createGameMutation.run(ref, (tsx) async {
  final client = tsx.get(gameClientProvider.notifier);
  final config = client.state.config;
  if (config == null) throw StateError('No config set');
  
  final code = await tsx.get(gameService).createGame(client.multiplayerID, config);
  client.setGameCode(code);
  return code;
});

// UI watches the mutation state:
final mutation = ref.watch(createGameMutation);
switch (mutation) {
  MutationIdle() => ElevatedButton(onPressed: () { 
    createGameMutation.run(ref, ...) 
  }, child: Text('Create')),
  MutationPending() => CircularProgressIndicator(),
  MutationError() => Text('Error: ${mutation.error}'),
  MutationSuccess() => Text('Created: ${mutation.value}'),
}
```

Key point: `tsx.get()` keeps providers alive during the async operation (unlike `ref.read()` which could dispose them).

**Benefits**:
- Eliminates manual async state tracking
- Automatic loading/error/success states in UI
- Built-in disposal safety via `tsx.get()`
- One mutation per operation simplifies testing

---

#### 3. Simplify OnDeviceRoundService Streams

**Current** (verbose pattern repeated 4×):
```dart
@override
Stream<GameError> errorStream(PlayerID playerID, GameCode code) async* {
  final ss = StreamController<GameError>();
  final backendReader = OnDeviceGameService.games[code]?.container;
  
  backendReader?.listen<GameError?>(
    fireImmediately: true, 
    BackendProviders.error, 
    (prev, curr) async {
      if (curr != null && curr.player == playerID) {
        ss.add(curr);
      }
    },
  );
  
  yield* ss.stream;
  await ss.close();
}
```

Problems:
- Verbose `StreamController` boilerplate
- Easy to forget cleanup
- Hard to read filtering logic mixed with streaming

**Simplified** (using `StreamTransformer`):
```dart
@override
Stream<GameError> errorStream(PlayerID playerID, GameCode code) {
  final backend = OnDeviceGameService.games[code]?.container;
  if (backend == null) return const Stream.empty();
  
  return backend.watch<GameError?>(BackendProviders.error)
    .whereType<GameError>()
    .where((err) => err.player == playerID);
}
```

Alternative (if watch not available):
```dart
@override
Stream<GameError> errorStream(PlayerID playerID, GameCode code) async* {
  final backend = OnDeviceGameService.games[code]?.container;
  if (backend == null) return;
  
  yield* _listenToProvider<GameError?>(
    backend, 
    BackendProviders.error,
  )
    .whereType<GameError>()
    .where((err) => err.player == playerID);
}

// Helper to reduce boilerplate
Stream<T> _listenToProvider<T>(
  ProviderContainer container,
  ProviderListenable<T> provider,
) async* {
  final sub = container.listen(provider, (_, value) {});
  yield container.read(provider) as T;
  yield* // ... rest of stream
}
```

**Benefits**:
- 50% fewer lines per stream method
- Filtering logic clearer
- Automatic cleanup with stream disposal
- Less room for bugs

---

#### 4. Reduce MultiplayerGameClient Responsibility

**Current** (doing too much):
- Service connection management
- State updates and computed getters
- Async operation coordination
- Service lookup logic

**Simplified**:
Split into:

1. **GameClientState** - Pure state container (immutable, freezed)
   - Current: Already exists as `GameClientInfo`

2. **GameClientProvider** - State management (Notifier in v3)
   - Manage state updates
   - Watch upstream providers
   - **Remove**: Async operations, service selection

3. **GameOperations** - Mutations (Phase 1)
   - `createGameMutation`
   - `joinGameMutation`
   - `deleteGameMutation`
   - `startGameMutation`

**Benefits**:
- Each class has one responsibility
- Easier to test each part
- Mutations provide loading/error UX automatically
- Service selection logic centralized in registry

---

### Recommended Simplification Roadmap

| Step | What | Impact | Effort |
|------|------|--------|--------|
| **Phase 1** | Add Mutations for operations | Better async UX, fixes disposal safety | 1-2 hours |
| **Phase 2** | Simplify streams with helpers | 50% less boilerplate, fewer bugs | 30 mins |
| **Phase 3** | Split MultiplayerGameClient concerns | Each class has single responsibility | 1 hour |

### Don't Change

- `GameService`/`RoundService` interfaces (good abstraction)
- Service selection switch statements (necessary for Riverpod dependency tracking)
- Manual ProviderContainers (needed for backend isolation)
- StreamController at RoundService level (correct for multi-backend support)
- Separated error handling architecture

---

### Phase 1: Mutations First ⭐ (2-3 hours)

**Goal**: Add reactive side-effect handling for game operations.

**What to do**:
1. Create `dart/lib/src/core/clients/mutations.dart` with `Mutation<T>()` declarations for: `createGame`, `joinGame`, `deleteGame`, `startGame`
2. In UI/consumers, trigger mutations with `mutation.run(ref, (tsx) async { ... })`
3. Use `tsx.get()` instead of `ref.read()` to keep dependencies alive during async operations
4. Watch mutation state to show loading/error/success UI: `switch (ref.watch(createGameMutation)) { ... }`

**Why**: 
- Replaces manual async/error handling with built-in loading/error/success states
- Fixes disposal safety with `tsx.get()` (keeps providers alive until mutation completes)
- UI can react to operation status without custom notifier logic
- Mutations are declared once, triggered from multiple places

**How it works**:
- `Mutation<T>()` is a top-level variable that stores the state of a side-effect
- `.run(ref, callback)` executes the callback, updating the mutation state to `MutationPending` → `MutationSuccess`/`MutationError`
- `ref.watch(mutation)` returns the current state for UI to display

**Example**: See [Riverpod mutations docs](https://riverpod.dev/docs/whats_new#mutations)

### Phase 2: Notifier Conversion (When ready)

**Goal**: Modernize provider declarations.

**What to do**:
1. Update `pubspec.yaml` to Riverpod v3
2. Remove `riverpod/legacy.dart` imports
3. Convert `StateNotifier` → `Notifier` with `build()` method in:
   - `LobbyNotifier`
   - `GameStateNotifier`
   - `MultiplayerGameClient`

**Why**: 
- Unified API (single `Notifier` class)
- Better lifecycle management
- Cleaner code patterns

**Example**: See [Riverpod notifier docs](https://riverpod.dev/docs/basics/notifiers)

### Phase 3: Optional Improvements

- Service registry refactoring for extensibility
- Update tests to use `ProviderContainer.test()`
- Add retry configuration for network operations
- **Document error handling architecture** in code comments (see Error Handling Architecture section below)

---

## What to Keep As-Is

### StreamController Pattern ✅
Stream normalization in `RoundService` is correct. Keep it for multi-backend flexibility.

### Manual ProviderContainers ✅
Each game instance gets its own container for isolation and runtime flexibility. This is architecturally sound.

### Scoped Providers ✅
Continue using `playerIDProvider` for multi-client support.

---

## Expected Impact

**Code**: ~50-70 lines of mutation setup replaces ~150 lines of manual async/error handling

**Complexity**: 
- Eliminated manual error state tracking
- Eliminated manual loading state tracking  
- Cleaner async patterns with `tsx.get()` and `Ref.mounted`
- UI can react to operation states without custom notifier logic

**Reliability**:
- Automatic "use after dispose" protection
- Built-in loading/error/success states prevent race conditions

---

## Multi-Backend Architecture

Your architecture is well-designed with clear separation of concerns:

**App Level** → **Backend Instances** → **Streaming Layer** → **Side-Effects Layer** → **UI**

Each layer can be upgraded independently. Mutations add a cleaner side-effect layer without disrupting the backend abstraction or manual container management below it.

---

## Potential Risks

| Risk | Mitigation |
|------|-----------|
| Mutation API is experimental | Use custom fallbacks if needed |
| Lifecycle behavior changes in v3 | Test async + auto-dispose combinations thoroughly |
| Stream equality changes | Override `updateShouldNotify` if needed |
