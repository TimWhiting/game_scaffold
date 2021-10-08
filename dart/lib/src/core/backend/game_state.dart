// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:io';

import 'package:characters/characters.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';

import '../core.dart';

/// Gets the home path based on the operating system, should only be used in server contexts
String get homeDir {
  if (Platform.isMacOS) {
    return Platform.environment['HOME']!;
  } else if (Platform.isLinux) {
    return Platform.environment['HOME']!;
  } else if (Platform.isWindows) {
    return Platform.environment['UserProfile']!;
  }
  return Platform.environment['HOME']!;
}

class BackendProviders {
  BackendProviders._();
  static final code = Provider((ref) => '0000');

  /// Provides the [GameStateNotifier] based on the [GameConfig] from [config]
  static final StateNotifierProvider<GameStateNotifier, Game?> state =
      StateNotifierProvider<GameStateNotifier, Game?>(
    (ref) {
      final gameConfig = ref.watch(config).state;
      return GameStateNotifier(
        gameConfig,
        ref.read,
        ref.watch(code),
      );
    },
    dependencies: [code],
  );

  /// Keeps track of the players involved in the game on the server (or on the client) in the case of a local game
  static final players = StateProvider<IList<Player>>(
    (ref) => <Player>[].lock,
    dependencies: [code],
  );

  /// Keeps track
  static final config = StateProvider<GameConfig>(
    (ref) => const GameConfig(gameType: ''),
    dependencies: [code],
  );

  /// Provides the [GameErrorNotifier] to keep track of errors of a game
  static final error = StateNotifierProvider<GameErrorNotifier, GameError?>(
    (ref) => GameErrorNotifier(),
    dependencies: [code],
  );

  static final initialState = Provider<Game>(
    (ref) => Game.getInitialState(
        ref.watch(config).state, ref.watch(players).state, ref.read),
    dependencies: [code],
  );
}

/// A [StateNotifier] that handles events for a particular game, delegating to the game's implementation for non generic events
class GameStateNotifier<E extends Event, T extends Game<E>>
    extends StateNotifier<T> {
  GameStateNotifier(this.gameConfig, this.read, this.code)
      : _gameStateLogger = Logger('GameStateNotifier $code'),
        super(Game.getInitialState(
            gameConfig, read(BackendProviders.players).state, read) as T);
  final Logger _gameStateLogger;
  final Reader read;

  /// The [code] of this game
  final GameCode code;

  /// The [GameConfig] that was used to create this [GameStateNotifier]
  final GameConfig gameConfig;

  /// A list of previous states
  final _previousStates = <T>[];

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
  bool handleEvent(GameEvent event) {
    // print('${event.toJson()}');
    try {
      _previousStates.add(state);
      final nextState = event.when(
        general: (e) => e.maybeWhen(
          undo: () {
            _previousStates.removeLast();
            return _previousStates.removeLast().gameValue();
          },
          start: () => Game.getInitialState(
                  gameConfig, read(BackendProviders.players).state, read)
              .gameValue(),
          readyNextRound: (e) {
            if (state.readyPlayers.length > 1) {
              _previousStates.remove(state);
            }
            final newState = state.copyWithGeneric((g) => g.addReadyPlayer(e));
            if (newState.readyPlayers.length == state.players.length) {
              return state
                  .moveNextRound(gameConfig, read)
                  .copyWithGeneric((g) => g.clearReadyPlayers())
                  .gameValue();
            }
            return newState.gameValue();
          },
          message: (_, __, ___) => state
              .copyWithGeneric(
                  (g) => g.addMessage(e as GameMessage).updateTime())
              .gameValue(),
          orElse: () =>
              GameError('General Event not implemented yet $e', 'programmer'),
        ),
        game: (e) => state.next(e as E, read),
      );
      if (nextState.isError) {
        read(BackendProviders.error.notifier).error = nextState.error;
        _previousStates.removeLast();
      } else {
        // ignore: cast_nullable_to_non_nullable
        state = nextState.value as T;
        read(BackendProviders.error.notifier).clearError();
        return true;
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (error, st) {
      _gameStateLogger.severe('$error $st');
    }
    return false;
  }
}

GameCode generateGameID(List<String> avoidList) {
  var gameid = '';
  while (gameid.length != 4 || avoidList.contains(gameid)) {
    gameid = ('BCDFGHJKLMNPQRSTVWXZ'.characters.toList()..shuffle())
        .join()
        .substring(0, 4);
  }
  return gameid;
}
