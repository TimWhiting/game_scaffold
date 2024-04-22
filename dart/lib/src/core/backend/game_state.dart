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

@Riverpod(dependencies: [BackendLobby])
GameInfo? backendPlayerLobby(BackendPlayerLobbyRef ref, PlayerID player) {
  final l = ref.watch(BackendProviders.lobby);
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

/// Provides the [GameError] to keep track of errors of a game
@Riverpod(keepAlive: true, dependencies: [BackendGameEngine])
final class BackendError extends _$BackendError {
  @override
  GameError? build() => ref.watch(BackendProviders.engine).error;
  void clear() {
    state = null;
  }
}

/// Provides the [GameState] to keep track of the state of a game
@Riverpod(keepAlive: true, dependencies: [BackendGameEngine])
final class BackendGameState extends _$BackendGameState {
  @override
  GameState build() => ref.watch(BackendProviders.engine).state;
}

abstract final class BackendProviders {
  static BackendLobbyProvider lobby = backendLobbyProvider;
  static BackendErrorProvider error = backendErrorProvider;
  static BackendGameEngineProvider engine = backendGameEngineProvider;
  static BackendGameStateProvider state = backendGameStateProvider;
  static BackendPlayerLobbyProvider playerLobby(PlayerID p) =>
      backendPlayerLobbyProvider(p);
}

@Riverpod(keepAlive: true)
final class BackendLobby extends _$BackendLobby {
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

/// Provides the [BackendGameEngine] based on the [GameConfig] from [Lobby]'s config
/// A [Notifier] that handles events for a particular game, delegating to the game's implementation for non generic events
@Riverpod(keepAlive: true, dependencies: [BackendLobby])
final class BackendGameEngine extends _$BackendGameEngine {
  @override
  NextStateOrError build() {
    final l = ref.watch(BackendProviders.lobby);
    code = l.code;
    gameConfig = l.config;
    return NextStateOrError(
        state: GameRegistry.initialState(l.config, l.players.toIList()),
        error: null);
  }

  late final Logger _gameStateLogger = Logger('GameState $code');

  /// The [code] of this game
  late GameCode code;

  /// The [GameConfig] that was used to create this [GameEngine]
  late GameConfig gameConfig;

  /// Handles a [PlayerEvent] and updates the state accordingly
  ///
  /// Delegates to the game implementation for a game specific event
  ///
  /// In case of a [GenericEvent] this handles the implementation of handling the event
  // ignore: type_annotate_public_apis
  bool handleEvent(PlayerEvent event) {
    try {
      final game = state.state;
      final e = event.event;
      if (e is GenericEvent) {
        state = e.maybeWhen(
            readyNextRound: (e, _) {
              final newState = game.updateGeneric((g) => g.addReadyPlayer(e));
              if (newState.readyPlayers.length == game.players.length) {
                return game
                    .nextRound(gameConfig)
                    .map((g) => g.updateGeneric((g) => g.clearReadyPlayers()));
              }
              return NextStateOrError(state: newState, error: null);
            },
            orElse: () => NextStateOrError(
                state: game,
                error: GameError(
                  message: 'General Event not implemented yet $event',
                  player: 'Player',
                )));
      } else {
        state = game.next(event, gameConfig);
      }

      if (state.error != null) {
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
