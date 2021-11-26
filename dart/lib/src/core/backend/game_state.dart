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

  static final lobby = StateNotifierProvider<LobbyNotifier, Lobby>(
    (ref) => LobbyNotifier(
      Lobby(
        gameStatus: GameStatus.Lobby,
        code: '',
        players: <Player>{}.lock,
        config: const GameConfig(gameType: ''),
      ),
    ),
    name: 'BackendLobby',
  );

  static final playerLobby = StreamProvider.family<GameInfo, PlayerID>(
    (ref, player) async* {
      final l = ref.watch(lobby);
      final pls = l.players;
      if (pls.any((p) => p.id == player)) {
        yield GameInfo(
          gameId: l.code,
          status: l.gameStatus,
          player: pls.firstWhere((p) => p.id == player).name,
          creator: player == l.config.adminID,
          players: pls.map((p) => p.name).toIList(),
          gameType: l.config.gameType,
        );
      }
    },
    name: 'BackendPlayerLobby',
    dependencies: [lobby],
  );

  /// Provides the [GameStateNotifier] based on the [GameConfig] from [lobby]'s config
  static final StateNotifierProvider<GameStateNotifier, GameOrError> state =
      StateNotifierProvider<GameStateNotifier, GameOrError>(
    (ref) {
      final l = ref.watch(lobby);
      return GameStateNotifier(
        l.config,
        l.code,
        Game.getInitialState(l.config, l.players.toIList()),
      );
    },
    name: 'BackendGameNotifier',
    dependencies: [lobby],
  );

  /// Provides the [GameErrorNotifier] to keep track of errors of a game
  static final error = Provider<GameError?>(
    (ref) => ref.watch(state.select((s) => s.error)),
    name: 'BackendGameError',
    dependencies: [state],
  );
}

class LobbyNotifier extends StateNotifier<Lobby> {
  LobbyNotifier(Lobby lobby) : super(lobby);

  void addPlayer(Player player) {
    state = state.copyWith(players: state.players.add(player));
  }

  void setConfig(GameConfig config) {
    state = state.copyWith(config: config);
  }

  void setCode(GameCode code) {
    state = state.copyWith(code: code);
  }

  void start() {
    state = state.copyWith(gameStatus: GameStatus.Started);
  }
}

/// A [StateNotifier] that handles events for a particular game, delegating to the game's implementation for non generic events
class GameStateNotifier<E extends Event, G extends Game<E>>
    extends StateNotifier<GameOrError<G>> {
  GameStateNotifier(this.gameConfig, this.code, G initialState)
      : _gameStateLogger = Logger('GameStateNotifier $code'),
        _previousStates = [initialState],
        super(initialState.gameValue());

  final Logger _gameStateLogger;

  /// The [code] of this game
  final GameCode code;

  /// The [GameConfig] that was used to create this [GameStateNotifier]
  final GameConfig gameConfig;

  /// A list of previous states
  final List<G> _previousStates;

  /// Returns the [state] of the game
  ///
  /// Remember to watch / listen to the state of the [GameStateNotifier]
  /// rather than just watching changes in the notifier itself, otherwise changes
  /// in the [gameState] will not trigger updates of the ui
  G get gameState => _previousStates.last;

  /// Handles a [GameEvent] and updates the state accordingly
  ///
  /// Delegates to the game implementation for a game specific event [E]
  ///
  /// In case of a [GenericEvent] this handles the implementation of handling the event
  bool handleEvent(GameEvent event) {
    // print('${event.toJson()}');
    try {
      final game = gameState;

      state = event.when(
        general: (e) => e.maybeWhen(
          undo: () {
            // Remove the current state
            _previousStates.removeLast();
            final lastState = _previousStates.removeLast();
            return lastState as GameOrError<G>;
          },
          readyNextRound: (e) {
            if (game.readyPlayers.length > 1) {
              _previousStates.remove(game);
            }
            final newState = game.copyWithGeneric((g) => g.addReadyPlayer(e));
            if (newState.readyPlayers.length == game.players.length) {
              return game
                  .moveNextRound(gameConfig)
                  .copyWithGeneric((g) => g.clearReadyPlayers())
                  .gameValue();
            }
            return newState.gameValue();
          },
          message: (_, __, ___) => game
              .copyWithGeneric(
                  (g) => g.addMessage(e as GameMessage).updateTime())
              .gameValue(),
          orElse: () =>
              GameError('General Event not implemented yet $e', 'programmer'),
        ),
        game: (e) => game.next(e as E) as GameOrError<G>,
      );

      if (state.isError) {
        return false;
      } else {
        _previousStates.add(state.value!);
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
