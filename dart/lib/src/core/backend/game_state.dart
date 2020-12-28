import 'dart:io';

import 'package:kt_dart/kt.dart';
import 'package:riverpod/all.dart';
import '../client.dart';
import '../core.dart';

/// Gets the home path based on the operating system, should only be used in server contexts
String get homeDir {
  if (Platform.isMacOS) {
    return Platform.environment['HOME'];
  } else if (Platform.isLinux) {
    return Platform.environment['HOME'];
  } else if (Platform.isWindows) {
    return Platform.environment['UserProfile'];
  }
  return Platform.environment['HOME'];
}

/// Keeps track of the players involved in the game on the server (or on the client) in the case of a local game
final serverPlayersProvider = StateProvider(
  (ref) => listFrom(
    const [
      Player(P1, name: 'John'),
      Player(P2, name: 'Mary'),
    ],
  ),
);

/// Provides the initial state of the game based on the [GameConfig] from [gameConfigProvider] and list of players from [serverPlayersProvider]
final gameInitialStateProvider = Provider<Game>((ref) {
  final gameConfig = ref.watch(gameConfigProvider).state;
  final players = ref.read(serverPlayersProvider).state;
  return Game.getInitialState(gameConfig, players, ref.read);
});

/// Provides the [GameStateNotifier] based on the [GameConfig] from [gameConfigProvider]
final gameProvider = StateNotifierProvider<GameStateNotifier>((ref) {
  final gameConfig = ref.watch(gameConfigProvider).state;
  return GameStateNotifier(gameConfig, ref.read);
});

/// Providers the [GameErrorNotifier] to keep track of errors of a game
final gameErrorProvider = StateNotifierProvider((ref) => GameErrorNotifier());

/// A companion [StateNotifier] to the [GameStateNotifier] that keeps track of the most recent error, and lets the client clear the error
class GameErrorNotifier extends StateNotifier<GameError> {
  GameErrorNotifier() : super(null);

  /// Sets the error [state]
  set error(GameError err) {
    state = err;
  }

  /// Gets the error that was set
  GameError get error => state;

  /// Clears any error that was set
  void clearError() {
    state = null;
  }
}

/// A [StateNotifier] that handles events for a particular game, delegating to the game's implementation for non generic events
class GameStateNotifier<E extends Event, T extends Game<E>>
    extends StateNotifier<T> {
  GameStateNotifier(this.gameConfig, this.read) : super(null);
  final Reader read;

  /// The [GameConfig] that was used to create this [GameStateNotifier]
  final GameConfig gameConfig;

  /// The players that are ready for the next round
  final Set<String> _readyPlayers = {};

  /// A list of previous states
  final List<T> _previousStates = [];

  /// Returns the [state] of the game
  ///
  /// Remember to watch / listen to the state of the [GameStateNotifier]
  /// rather than just watching changes in the notifier itself, otherwise changes
  /// in the [gameState] will not trigger updates of the ui
  T get gameState => state;

  /// Handles a [GameEvent] and updates the state accordingly
  ///
  /// Delegates to the game implementation for a game specific event [E]
  ///
  /// In case of a [GenericEvent] this handles the implementation of handling the event
  void handleEvent(GameEvent event) {
    _previousStates.add(state);
    final nextState = event.when(
      general: (e) => e.maybeWhen(
        undo: () {
          _previousStates.removeLast();
          return _previousStates.removeLast().gameValue;
        },
        start: () => read(gameInitialStateProvider).gameValue,
        readyNextRound: (e) {
          if (_readyPlayers.length > 1) {
            _previousStates.remove(state);
          }
          _readyPlayers.add(e);
          if (_readyPlayers.length == state.players.size) {
            _readyPlayers.clear();
            return state.moveNextRound(read).gameValue;
          }
          return state.gameValue;
        },
        message: (_, __, ___) => state
            .copyWithGeneric((g) => g.addMessage(e as GameMessage).updateTime())
            .gameValue,
        orElse: () =>
            GameError('General Event not implemented yet $e', 'programmer'),
      ),
      game: (e) => state.next(e, read),
    );
    if (nextState.isError) {
      read(gameErrorProvider).error = nextState.error;
      _previousStates.removeLast();
    } else {
      state = nextState.value;
    }
  }
}
