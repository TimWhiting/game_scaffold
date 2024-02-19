// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:io';

import 'package:characters/characters.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core.dart';

part 'game_state.g.dart';

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

@Riverpod(dependencies: [LobbyNotifier])
GameInfo? playerLobby(PlayerLobbyRef ref, PlayerID player) {
  final l = ref.watch(lobbyNotifierProvider);
  final pls = l.players;
  if (pls.any((p) => p.id == player)) {
    return GameInfo(
      config: l.config,
      gameID: l.code,
      status: l.gameStatus,
      player: pls.firstWhere((p) => p.id == player).name,
      creator: player == l.config.adminID,
      players: pls.map((p) => p.name).toIList(),
    );
  }
  return null;
}

/// Provides the [GameErrorNotifier] to keep track of errors of a game
@Riverpod(keepAlive: true)
class ErrorNotifier extends _$ErrorNotifier with GameErrorNotifier {
  @override
  GameError? build() => null;
}

@Riverpod(keepAlive: true)
class LobbyNotifier extends _$LobbyNotifier {
  @override
  Lobby build() => Lobby(
        gameStatus: GameStatus.lobby,
        code: '',
        players: <Player>{}.lock,
        config: const GameConfig(gameType: ''),
      );

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

/// Provides the [GameStateNotifier] based on the [GameConfig] from [lobby]'s config
/// A [Notifier] that handles events for a particular game, delegating to the game's implementation for non generic events
@Riverpod(keepAlive: true, dependencies: [LobbyNotifier, ErrorNotifier])
class GameStateNotifier extends _$GameStateNotifier {
  @override
  GameState build() {
    final l = ref.watch(lobbyNotifierProvider);
    code = l.code;
    gameConfig = l.config;
    return GameRegistry.initialState(l.config, l.players.toIList());
  }

  late final Logger _gameStateLogger = Logger('GameStateNotifier $code');

  /// The [code] of this game
  late GameCode code;

  /// The [GameConfig] that was used to create this [GameStateNotifier]
  late GameConfig gameConfig;

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
      if (e is GenericEvent) {
        state = e.maybeWhen(readyNextRound: (e, _) {
          final newState = game.updateGeneric((g) => g.addReadyPlayer(e));
          if (newState.readyPlayers.length == game.players.length) {
            return game
                .nextRound(gameConfig)
                .state
                .updateGeneric((g) => g.clearReadyPlayers());
          }
          return newState;
        }, orElse: () {
          ref.read(errorNotifierProvider.notifier).error = GameError(
            message: 'General Event not implemented yet $event',
            player: 'Player',
          );
          return game;
        });
      } else {
        final next = game.next(event, gameConfig);
        if (next.error != null) {
          ref.read(errorNotifierProvider.notifier).error = next.error;
          error = true;
        }
        state = next.state;
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
