# Game Phase Architecture Analysis

## Current Design: Game Status Enum

**Status values**:
- `lobby` - Waiting for start
- `started` - Round active
- `betweenRounds` - Waiting for players to signal readiness
- `finished` - Game over

**Current strengths**:
- ✅ GameService/RoundService split is conceptually sound (games vs. in-game updates)
- ✅ Data and status separate (easier for game logic to drive phase)
- ✅ Generic - works for any game type

**Recommendation**: Keep the enum. Add documentation and phase query helpers to make phase intent explicit.

---

## Implementation: Phase Queries with Documentation

### Step 1: Add Extension Methods to GameStatus

Add to `lib/src/core/core/generic.dart`:

```dart
/// Extensions to make game phases explicit and self-documenting.
/// 
/// These helpers clarify which operations are valid in each phase,
/// making the codebase more maintainable and preventing phase-related bugs.
extension GamePhaseQueries on GameStatus {
  /// Whether the game is in lobby phase - waiting for players or game start.
  /// 
  /// **In this phase:**
  /// - Players can join the game via [RoundService.joinGame]
  /// - Game configuration can be set up
  /// - Game has not started yet
  /// 
  /// **Valid operations:**
  /// - [GameService.joinGame] - Join the game
  /// - [GameService.getGames] - List available games
  /// 
  /// **Invalid operations:**
  /// - [RoundService.sendEvent] - Game not started
  /// - [RoundService.newRound] - No rounds active
  bool get isLobby => this == GameStatus.lobby;
  
  /// Whether the game is actively playing - rounds are happening.
  /// 
  /// **In this phase:**
  /// - Players can send events/moves via [RoundService.sendEvent]
  /// - Game state is advancing
  /// - New players cannot join
  /// 
  /// **Valid operations:**
  /// - [RoundService.sendEvent] - Send game events/moves
  /// - [RoundService.gameStream] - Watch game state
  /// - [RoundService.startGame] - Not needed (already started)
  /// 
  /// **Invalid operations:**
  /// - [GameService.joinGame] - Game already started
  /// - [RoundService.newRound] - Rounds proceed automatically
  bool get isPlaying => this == GameStatus.started;
  
  /// Whether the game is between rounds - waiting for players to signal readiness.
  /// 
  /// **In this phase:**
  /// - All players must call [RoundService.newRound] to proceed
  /// - Game state is paused, waiting for confirmation
  /// - No game events are processed
  /// 
  /// **Valid operations:**
  /// - [RoundService.newRound] - Signal readiness for next round
  /// - [RoundService.gameStream] - Watch game state
  /// 
  /// **Invalid operations:**
  /// - [RoundService.sendEvent] - Round not active
  /// - [GameService.joinGame] - Game already started
  bool get isBetweenRounds => this == GameStatus.betweenRounds;
  
  /// Whether the game is finished - no more rounds will occur.
  /// 
  /// **In this phase:**
  /// - No events can be sent
  /// - Players can view final results
  /// - Game is ready to be deleted or archived
  /// 
  /// **Valid operations:**
  /// - [RoundService.gameStream] - View final state (rewards, results)
  /// - [GameService.deleteGame] - Clean up the game
  /// 
  /// **Invalid operations:**
  /// - [RoundService.sendEvent] - Game over
  /// - [RoundService.newRound] - No more rounds
  /// - [GameService.joinGame] - Game already finished
  bool get isFinished => this == GameStatus.finished;
  
  // --- Convenience predicates ---
  
  /// Returns true if players can join this game in the current phase.
  /// 
  /// Only true in [isLobby].
  bool get canJoinGame => isLobby;
  
  /// Returns true if players can send game events (moves, actions, etc) in the current phase.
  /// 
  /// Only true in [isPlaying].
  bool get canSendEvents => isPlaying;
  
  /// Returns true if players can signal readiness for the next round in the current phase.
  /// 
  /// Only true in [isBetweenRounds].
  bool get canReadyUp => isBetweenRounds;
  
  /// Returns true if the game has ended and no more play will occur.
  /// 
  /// True in [isFinished].
  bool get isGameOver => isFinished;
  
  /// Returns a human-readable name for this phase.
  /// 
  /// Useful for error messages and logging.
  String get phaseName => switch (this) {
    GameStatus.lobby => 'Lobby',
    GameStatus.started => 'Playing',
    GameStatus.betweenRounds => 'Between Rounds',
    GameStatus.finished => 'Finished',
  };
}
```

---

## Step 2: Document Phase Transitions in Backend

Update `lib/src/core/backend/game_state.dart`:

```dart
/// Handles a [GameEvent] and updates the state accordingly.
/// 
/// **Game event processing flow:**
/// 1. Guard: Verify event is appropriate for current phase
/// 2. Delegate: Pass to game-specific implementation
/// 3. Update: Apply state changes
/// 4. Detect: Check for phase transitions
/// 5. Signal: Update phase if needed
/// 
/// **Phase transitions are implicit** - detected when [GameState.status] changes.
/// The game logic (via [GameRegistry.functions]) drives transitions naturally
/// when it determines the game is over or a round is complete.
/// 
/// **Transition diagram:**
/// ```
/// lobby → (on startGame) → started ↔ betweenRounds ↔ started
///                            ↓ (on gameOver)
///                          finished
/// ```
bool handleEvent(PlayerEvent event) {
  var error = false;
  try {
    final game = gameState;
    final e = event.event;
    
    // GUARD: Reject events inappropriate for current phase
    if (!state.status.canSendEvents && e is! GenericEvent) {
      errorNotifier.state = GameError(
        message: 'Cannot send events during ${state.status.phaseName} phase',
        player: event.playerId,
      );
      return false;
    }
    
    if (e is GenericEvent) {
      switch (e) {
        case ReadyNextRound(:final player):
          final newState = game.updateGeneric((g) => g.addReadyPlayer(player));
          if (newState.readyPlayers.length == game.players.length) {
            // TRANSITION: All players ready → Proceed to next round
            // betweenRounds → started
            state = game.nextRound(gameConfig).state.updateGeneric((g) => g.clearReadyPlayers());
            break;
          }
          state = newState;
          break;
      }
    } else {
      final next = game.next(event, gameConfig);
      if (next.error != null) {
        errorNotifier.state = next.error;
        error = true;
      }
      state = next.state;
    }
    
    // DETECT: Check if game logic indicates phase transition
    final updatedState = state.updateStatus();
    
    // TRANSITION: Game logic signals round over
    // started → betweenRounds
    if (updatedState.status.isBetweenRounds && !state.status.isBetweenRounds) {
      _gameStateLogger.info('$code: Round ${updatedState.round} complete, waiting for ready');
    }
    
    // TRANSITION: Game logic signals game over
    // started → finished (or betweenRounds → finished)
    if (updatedState.status.isFinished && !state.status.isFinished) {
      _gameStateLogger.info('$code: Game finished after ${updatedState.round} rounds');
    }
    
    state = updatedState;

    if (error) {
      return false;
    }
    return true;
  } catch (err, st) {
    _gameStateLogger.severe('$err $st');
  }
  return false;
}
```

---

## Step 3: Use Phase Queries in Client Code

### Safe Event Sending

```dart
// Guard against sending events in invalid phases
Future<bool> sendEventSafely<E extends Event>(
  PlayerID playerID,
  GameCode code,
  E event,
) async {
  final currentState = ref.read(gameStateProvider);
  
  if (!currentState.status.canSendEvents) {
    throw StateError(
      'Cannot send events during ${currentState.status.phaseName} phase'
    );
  }
  
  return roundService.sendEvent(playerID, code, event);
}
```

### Phase-Appropriate UI Rendering

```dart
// Build UI based on current phase, with compile-time safety
Widget buildGameScreen(GameState gameState) {
  return switch (gameState.status) {
    GameStatus.lobby => LobbyScreen(
      gameState: gameState,
      onStart: () => startGame(),
      onJoin: (name) => joinGame(name),
    ),
    
    GameStatus.started => GameBoard(
      gameState: gameState,
      onMove: (move) => sendEvent(move),
      onConcede: () => exitGame(),
    ),
    
    GameStatus.betweenRounds => BetweenRoundsScreen(
      round: gameState.round,
      players: gameState.players,
      readyPlayers: gameState.readyPlayers,
      onReady: () => readyForNextRound(),
    ),
    
    GameStatus.finished => ResultsScreen(
      gameState: gameState,
      onNewGame: () => createGame(),
      onExit: () => exitGame(),
    ),
  };
}
```

### Reusable UI Widgets for Cross-Phase Display

**Pattern**: Build reusable widget components that work across multiple phases, with phase-specific overlays or sidebars.

For example, showing the game board during `started` and `betweenRounds`, but with different interaction states:

```dart
/// Displays the current game board - reused across multiple phases
class GameBoardWidget extends StatelessWidget {
  final GameState gameState;
  final bool interactive;  // Whether players can take actions
  final VoidCallback? onMove;
  
  const GameBoardWidget({
    required this.gameState,
    required this.interactive,
    this.onMove,
  });
  
  @override
  Widget build(BuildContext context) {
    return GameBoard(
      game: gameState.game,
      players: gameState.players,
      onMove: interactive ? onMove : null,  // Disabled if not interactive
    );
  }
}

/// Top-level screen that composes the reusable board with phase-specific overlays
Widget buildGameScreen(GameState gameState) {
  return switch (gameState.status) {
    // Playing phase: interactive board
    GameStatus.started => Scaffold(
      body: GameBoardWidget(
        gameState: gameState,
        interactive: true,
        onMove: (move) => sendEvent(move),
      ),
    ),
    
    // Between rounds: same board, but show overlay with round results
    GameStatus.betweenRounds => Scaffold(
      body: Stack(
        children: [
          // Reuse the same board widget (non-interactive)
          GameBoardWidget(
            gameState: gameState,
            interactive: false,
          ),
          // Overlay with round info
          RoundResultsOverlay(
            round: gameState.round,
            roundWinner: gameState.game.roundWinner,  // Game-specific data
            players: gameState.players,
            readyPlayers: gameState.readyPlayers,
            onReady: () => readyForNextRound(),
          ),
        ],
      ),
    ),
    
    // Finished phase: same board, show final results
    GameStatus.finished => Scaffold(
      body: Stack(
        children: [
          GameBoardWidget(
            gameState: gameState,
            interactive: false,
          ),
          FinalResultsOverlay(
            gameState: gameState,
            rewards: gameState.rewards,
            onExit: () => exitGame(),
          ),
        ],
      ),
    ),
    
    _ => LobbyScreen(...),
  };
}

/// Overlay showing round results (winner, scores, etc)
/// Reusable for any game type that has round transitions
class RoundResultsOverlay extends StatelessWidget {
  final int round;
  final Player? roundWinner;
  final IList<Player> players;
  final IList<PlayerID> readyPlayers;
  final VoidCallback onReady;
  
  const RoundResultsOverlay({
    required this.round,
    required this.roundWinner,
    required this.players,
    required this.readyPlayers,
    required this.onReady,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Round $round Results'),
            if (roundWinner != null) ...[
              SizedBox(height: 16),
              Text('${roundWinner!.name} wins this round!'),
            ],
            SizedBox(height: 16),
            Text('Ready up to continue'),
            ...players.map((p) => PlayerReadyIndicator(
              player: p,
              isReady: readyPlayers.contains(p.id),
            )),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onReady,
              child: Text('Ready for next round'),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Benefits of this pattern**:
- ✅ Game board rendered consistently across phases
- ✅ Phase transitions only change overlays/sidebars, not core components
- ✅ Easy to show intermediate information (round winner) between phases
- ✅ Reduces widget duplication
- ✅ UI logic stays separate from phase state management

### Mutation Integration (Phase 1)

```dart
// Use phase queries in mutation callbacks
final sendEventMutation = Mutation<bool>();

sendEventMutation.run(ref, (tsx) async {
  final gameState = tsx.get(gameStateProvider);
  
  // Guard: Only valid during playing phase
  if (!gameState.status.canSendEvents) {
    throw StateError(
      'Invalid phase for game event: ${gameState.status.phaseName}'
    );
  }
  
  return tsx.get(roundService).sendEvent(playerID, code, event);
});
```

---

## Explicit Phase Transitions with `updateStatus()`

**Best Practice**: Separate the action (game logic) from the phase transition (status update).

Always call `updateStatus()` explicitly at the end of game logic processing. This makes phase transitions visible and debuggable.

### Backend Implementation

```dart
/// Handles a [GameEvent] and updates the state accordingly.
/// 
/// **Game event processing flow:**
/// 1. Guard: Verify event is appropriate for current phase
/// 2. Delegate: Pass to game-specific implementation
/// 3. Update: Apply state changes
/// 4. Detect: Check for phase transitions (EXPLICIT via updateStatus)
/// 5. Signal: Update phase if needed
bool handleEvent(PlayerEvent event) {
  var error = false;
  try {
    final game = gameState;
    final e = event.event;
    
    // GUARD: Reject events inappropriate for current phase
    if (!state.status.canSendEvents && e is! GenericEvent) {
      errorNotifier.state = GameError(
        message: 'Cannot send events during ${state.status.phaseName} phase',
        player: event.playerId,
      );
      return false;
    }
    
    if (e is GenericEvent) {
      switch (e) {
        case ReadyNextRound(:final player):
          final newState = game.updateGeneric((g) => g.addReadyPlayer(player));
          if (newState.readyPlayers.length == game.players.length) {
            // All players ready: proceed to next round
            state = game.nextRound(gameConfig).state.updateGeneric((g) => g.clearReadyPlayers());
            // Note: Do NOT update status here - let it flow to explicit updateStatus() below
            break;
          }
          state = newState;
          break;
      }
    } else {
      // Game-specific event processing
      final next = game.next(event, gameConfig);
      if (next.error != null) {
        errorNotifier.state = next.error;
        error = true;
      }
      state = next.state;
    }
    
    // EXPLICIT: Always call updateStatus() at the end to detect and signal phase transitions
    // This separates "what happened" (state.game changed) from "what phase are we in" (status)
    // 
    // updateStatus() checks:
    // - If game is over → status becomes finished
    // - If round is over → status becomes betweenRounds
    // - Otherwise → status stays as started
    final updatedState = state.updateStatus();
    
    // LOGGING: Document transitions for debugging
    if (updatedState.status.isBetweenRounds && !state.status.isBetweenRounds) {
      // TRANSITION: started → betweenRounds (round ended)
      _gameStateLogger.info('$code: Round ${updatedState.round} complete, waiting for players to ready');
    }
    
    if (updatedState.status.isFinished && !state.status.isFinished) {
      // TRANSITION: started/betweenRounds → finished (game over)
      _gameStateLogger.info('$code: Game finished after ${updatedState.round} rounds, final rewards: ${updatedState.rewards}');
    }
    
    state = updatedState;

    if (error) {
      return false;
    }
    return true;
  } catch (err, st) {
    _gameStateLogger.severe('$err $st');
  }
  return false;
}
```

### Why Explicit `updateStatus()` Is Better

**Problem with implicit transitions**:
```dart
// BAD: Hidden logic - when does phase change?
state = state.copyWith(game: newGame);
```

**Solution with explicit `updateStatus()`**:
```dart
// GOOD: Clear transition point
final updated = state.updateStatus();  // ← Explicit phase detection
state = updated;
```

**Benefits**:
- ✅ Phase transitions are **visible** in the code
- ✅ Easy to **trace** when debugging phase issues
- ✅ Consistent place to **log** transitions
- ✅ Makes **game logic independent** from phase management
- ✅ Easier to **test** - can verify transitions separately from game logic

### Implementation in GameState

```dart
// In lib/src/core/core/game.dart - add explicit updateStatus method

class GameState<E extends Event, T extends Game> {
  // ... existing code ...
  
  /// Detects and applies phase transitions based on game state.
  /// 
  /// This is the **single place** where status transitions occur.
  /// Call this after any game logic update to ensure phase is synchronized.
  /// 
  /// **Transition rules** (game logic drives these):
  /// - If [game.gameOver] returns true → status = finished
  /// - Else if [game.roundOver] returns true → status = betweenRounds
  /// - Else → status = started (active play)
  GameState<E, T> updateStatus() => copyWith(
    generic: generic.copyWith(
      status: game.gameOver(generic)
          ? GameStatus.finished
          : game.roundOver
          ? GameStatus.betweenRounds
          : GameStatus.started,
    ),
  );
  
  // ... rest of code ...
}
```

This method already exists, but documenting it emphasizes its role as the **single source of truth** for phase transitions.

---

## Documentation Strategy for Team

### For Backend Developers

1. **Always call `updateStatus()` explicitly** after game logic processing
   - Never update status inline with game state changes
   - Log the transition for debugging

2. **Document phase transitions** with clear comments
   ```dart
   // TRANSITION: started → betweenRounds (when round ends)
   ```

3. **Guard against invalid operations** for current phase
   ```dart
   if (!state.status.canSendEvents && e is! GenericEvent) {
     errorNotifier.state = GameError(...);
     return false;
   }
   ```

4. **Use `status.phaseName`** in error messages for clarity
   ```dart
   throw 'Cannot send events in ${state.status.phaseName} phase';
   ```

### For Game Implementation Authors

1. **Implement game-over and round-over detection** correctly
   ```dart
   bool get gameOver => /* your logic */;
   bool get roundOver => /* your logic */;
   ```

2. **Declare phase requirements** in documentation
   ```dart
   /// Processes a player event during the [GameStatus.started] phase.
   /// GameStateNotifier guards against calling this in wrong phases.
   NextState<E, T> next(GameState state, GameConfig config, PlayerEvent event);
   ```

3. **Test with all phases**
   - Verify setup works (lobby → started)
   - Verify round transitions (started → betweenRounds → started)
   - Verify game over (any phase → finished)

### For UI Developers

1. **Use switch statements** - Pattern matching on phase is natural
   ```dart
   switch (gameState.status) {
     case GameStatus.started => GameBoardWidget(...),
     case GameStatus.betweenRounds => OverlayWidget(...),
     case _ => OtherUI(...),
   }
   ```

2. **Build reusable widget components** that work across phases
   - Core game display widgets (board, cards, players)
   - Overlay widgets (results, ready indicators, final standings)
   - Compose them differently per phase

3. **Use phase queries** for clarity and safety
   ```dart
   if (gameState.status.canSendEvents) {
     // Safe to send game events
   }
   ```

4. **Always check status** before accessing phase-specific data
   ```dart
   if (gameState.status.isPlaying) {
     return board.render(gameState.game);  // game field is guaranteed valid
   }
   ```

---

## Documentation Strategy for Team

### For Backend Developers

1. **Document phase transitions** with clear comments in `GameStateNotifier.handleEvent()`
   - Mark `TRANSITION` comments where phase changes occur
   - Note old → new status for clarity
   - Explain why the transition happened (e.g., "all players ready", "game over")

2. **Use `status.phaseName` in error messages** for clarity
   ```dart
   if (!state.status.canSendEvents) {
     throw 'Cannot send events in ${state.status.phaseName} phase';
   }
   ```

3. **Add guards before phase-sensitive operations**
   ```dart
   if (state.status.isPlaying) {
     // Process game event
   }
   ```

### For Game Implementation Authors

1. **Declare phase preconditions** in `GameRegistry.functions` implementation
   ```dart
   /// Processes a player event during the [GameStatus.started] phase.
   /// 
   /// Called by [GameStateNotifier.handleEvent] only when the game is actively playing.
   NextState<E, T> next(GameState state, GameConfig config, PlayerEvent event) {
     // Game logic implementation
   }
   ```

2. **Signal phase transitions** implicitly through `GameState.status`
   ```dart
   GameState gameOver(GenericGame g) {
     return copyWith(
       status: GameStatus.finished,  // Signals phase transition
     );
   }
   ```

3. **Test with all phases**
   ```dart
   // Test setup phase (lobby)
   // Test playing phase
   // Test between rounds phase
   // Test finished phase
   ```

### For UI Developers

1. **Use `switch` statements** - Pattern matching naturally encodes all phases
   ```dart
   switch (gameState.status) {
     case GameStatus.lobby => ...,
     case GameStatus.started => ...,
     case GameStatus.betweenRounds => ...,
     case GameStatus.finished => ...,
   }
   ```

2. **Use phase queries** for clarity and safety
   ```dart
   if (gameState.status.canSendEvents) {
     // Safe to send
   }
   ```

3. **Always check status** before accessing phase-specific data
   ```dart
   if (gameState.status.isPlaying) {
     return board.render(gameState.game);  // Safe - game is available
   }
   ```

---

## Adding a New Phase (If Needed)

If you need to add a new phase (e.g., `preparing` for initial setup before lobby):

**1. Add to enum**:
```dart
enum GameStatus {
  preparing,    // ← New phase
  lobby,
  started,
  betweenRounds,
  finished,
}
```

**2. Add query helpers**:
```dart
extension GamePhaseQueries on GameStatus {
  bool get isPreparing => this == GameStatus.preparing;
  
  // Update phaseName
  String get phaseName => switch (this) {
    GameStatus.preparing => 'Preparing',
    // ... rest
  };
}
```

**3. Document transition**:
```dart
// Backend: Add transition logic where needed
if (someCondition) {
  // TRANSITION: Setup complete → Ready for lobby
  // preparing → lobby
  state = state.updateStatus(GameStatus.lobby);
}
```

**4. Update UI**:
```dart
// UI: Add new case to switch
switch (gameState.status) {
  case GameStatus.preparing => PreparingScreen(),
  // ... rest
}
```

---

## Why This Approach

**Strengths**:
- ✅ **No refactoring required** - Works with current GameStatus enum
- ✅ **Can implement today** - No Riverpod v3 migration needed
- ✅ **Self-documenting** - Extension methods explicitly state phase requirements
- ✅ **Type-safe queries** - `canSendEvents`, `isPlaying` prevent common mistakes
- ✅ **Game logic remains central** - Game implementations drive transitions naturally
- ✅ **Keeps service split** - GameService/RoundService separation untouched
- ✅ **Improves readability** - Developers see intent at a glance
- ✅ **Minimal cognitive overhead** - No new abstractions to learn
- ✅ **Reusable UI widgets** - Build once, display differently per phase
- ✅ **Explicit phase transitions** - `updateStatus()` makes transitions visible and debuggable

**Trade-offs**:
- ⚠ Helper methods provide guidance, not enforcement (runtime errors still possible)
- ⚠ Not as type-safe as sealed classes (but pragmatic for a generic framework)

---

## Summary

**Current status enum is sufficient** - just add documentation and helper methods.

**Four simple steps to implement**:

1. Add `GamePhaseQueries` extension to `GameStatus` enum
2. Always call `updateStatus()` explicitly at the end of game logic processing
3. Document phase transitions with clear comments in `GameStateNotifier.handleEvent()`
4. Use phase queries in guards, error messages, and UI rendering
5. Build reusable widget components that work across multiple phases

**Result**: Clear, self-documenting phase system with:
- Visible, debuggable phase transitions
- Reusable UI components across phases
- No refactoring required
- Works perfectly with your current architecture, GameService/RoundService split, and game-logic-driven design
