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
        gameStatus: GameStatus.lobby,
        code: '',
        players: <Player>{}.lock,
        config: const GameConfig(gameType: ''),
      ),
    ),
    name: 'BackendLobby',
  );

  static final playerLobby =
      Provider.family<GameInfo?, PlayerID>(
    (ref, player) {
      final l = ref.watch(lobby);
      final pls = l.players;
      if (pls.any((p) => p.id == player)) {
        return GameInfo(
          config: l.config,
          gameID: l.code,
          status: l.gameStatus,
          player: pls.firstWhere((p) => p.id == player).name,
          creator: player == l.config.adminID,
          players: pls.map((p) => p.name).toIList(),
          gameType: l.config.gameType,
        );
      }
      return null;
    },
    name: 'BackendPlayerLobby',
    dependencies: [lobby],
  );

  /// Provides the [GameStateNotifier] based on the [GameConfig] from [lobby]'s config
  static final state =
      StateNotifierProvider<GameStateNotifier, GameState>(
    (ref) {
      final l = ref.watch(lobby);
      return GameStateNotifier(
        l.config,
        l.code,
        GameRegistry.initialState(l.config.gameType, l.config, l.players.toIList()),
        ref.read(error.notifier),
      );
    },
    name: 'BackendGameNotifier',
    dependencies: [lobby, error],
  );

  /// Provides the [GameErrorNotifier] to keep track of errors of a game
  static final error = StateProvider<GameError?>(
    (ref) => null,
    name: 'BackendGameError',
    dependencies: const [],
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
    state = state.copyWith(gameStatus: GameStatus.started);
  }
}

/// A [StateNotifier] that handles events for a particular game, delegating to the game's implementation for non generic events
class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier(
      this.gameConfig, this.code, GameState initialState, this.errorNotifier)
      : _gameStateLogger = Logger('GameStateNotifier $code'),
        super(initialState);

  final StateController<GameError?> errorNotifier;

  final Logger _gameStateLogger;

  /// The [code] of this game
  final GameCode code;

  /// The [GameConfig] that was used to create this [GameStateNotifier]
  final GameConfig gameConfig;

  /// Returns the [state] of the game
  ///
  /// Remember to watch / listen to the state of the [GameStateNotifier]
  /// rather than just watching changes in the notifier itself, otherwise changes
  /// in the [gameState] will not trigger updates of the ui
  GameState get gameState => state;

  /// Handles a [GameEvent] and updates the state accordingly
  ///
  /// Delegates to the game implementation for a game specific event [E]
  ///
  /// In case of a [GenericEvent] this handles the implementation of handling the event
  // ignore: type_annotate_public_apis
  bool handleEvent(PlayerEvent event) {
    var error = false;
    try {
      final game = gameState;
      final e = event.event;
      if (e is GenericEvent){
        state = e.maybeWhen(
          readyNextRound: (e) {
            final newState = game.updateGeneric((g) => g.addReadyPlayer(e));
            if (newState.readyPlayers.length == game.players.length) {
              return game
                  .nextRound(gameConfig)
                  .state
                  .updateGeneric((g) => g.clearReadyPlayers());
            }
            return newState;
          },
          orElse: () {
            errorNotifier.state = (message: 'General Event not implemented yet $event', player: 'Player');
            return game;
          });
      } else {
         final next = game.next(event, gameConfig);
          if (next.error != null) {
            errorNotifier.state = next.error;
            error = true;
          }
          state =  next.state;
      }
      
      if (error) {
        return false;
      }
      return true;
      // ignore: avoid_catches_without_on_clauses
    } catch (err, st) {
      _gameStateLogger.severe('$err $st');
    }
    return false;
  }
}

GameCode generateGameID(List<String> avoidList) {
  var gameID = '';
  while (gameID.length != 4 || avoidList.contains(gameID)) {
    gameID = ('BCDFGHJKLMNPQRSTVWXZ'.characters.toList()..shuffle())
        .join()
        .substring(0, 4);
  }
  return gameID;
}
