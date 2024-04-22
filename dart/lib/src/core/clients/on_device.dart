import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../game_scaffold_dart.dart';

part 'on_device.g.dart';

/// Location that corresponds to running the game on-device
// ignore: constant_identifier_names
const OnDeviceService = 'on-device';

/// An implementation of a [RoundService] for a local game on device with no server connection
///
/// Warning implementation not complete or tested yet
@Riverpod(dependencies: [CurrentPlayerID])
final class OnDeviceRoundService extends RoundService {
  @override
  void build() {}
  @override
  Future<bool> exitGame(PlayerID playerID, GameCode code) async => true;

  @override
  Stream<GameState> gameStream(PlayerID playerID, GameCode code) async* {
    logger.info('Watching backend $playerID $code');
    final reader = backendReader(code);
    if (reader == null ||
        reader.read(BackendProviders.lobby).gameStatus == GameStatus.lobby) {
      // The first read of the gameStateNotifier initializes with the currently connected players
      // so we need to wait while we are still in the lobby
      return;
    }
    final ss = StreamController<GameState>();
    reader.listen<GameState>(
      BackendProviders.state,
      (prev, curr) => ss.add(curr),
    );
    yield reader.read(BackendProviders.state);
    yield* ss.stream;
    await ss.close();
  }

  @override
  Future<bool> sendEvent<E extends Event>(
      PlayerID playerID, GameCode code, E event) async {
    final reader = backendReader(code);
    if (reader == null) {
      return false;
    }
    // If the gameClient is initializing
    // we cannot edit the backend provider synchronously
    await Future.delayed(const Duration(microseconds: 1));
    final result = reader
        .read(BackendProviders.engine.notifier)
        .handleEvent(event.player(playerID));
    return result;
  }

  @override
  Stream<GameError> errorStream(PlayerID playerID, GameCode code) async* {
    final reader = backendReader(code);
    if (reader == null) {
      return;
    }

    final ss = StreamController<GameError>();
    reader.listen<GameError?>(
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

  @override
  Future<bool> startGame(PlayerID playerID, GameCode code) async {
    final reader = backendReader(code);
    if (reader == null) {
      return false;
    }
    final notifier = reader.read(BackendProviders.lobby.notifier);
    await Future.delayed(const Duration(microseconds: 1));
    notifier.start();
    return true;
  }

  @override
  Stream<GameInfo> gameLobby(PlayerID playerID, GameCode code) async* {
    final reader = backendReader(code);
    if (reader == null) {
      return;
    }
    final ss = StreamController<GameInfo>();

    reader.listen<GameInfo?>(
      BackendProviders.playerLobby(playerID),
      (prev, curr) async {
        // ignore: prefer_foreach
        if (curr != null) {
          ss.add(curr);
        }
      },
    );
    final curr = reader.read(BackendProviders.playerLobby(playerID));
    if (curr != null) {
      yield curr;
    }
    yield* ss.stream;
    await ss.close();
  }
}

ProviderContainer? backendReader(GameCode code) =>
    OnDeviceGameService.games[code]?.container;

/// An on device implementation of [GameService]
///
/// Warning implementation not complete or tested yet
@Riverpod(dependencies: [])
final class OnDeviceGameService extends _$OnDeviceGameService with GameService {
  @override
  void build() {}
  static final games = <GameCode, LocalGame>{};
  @override
  Future<String> createGame(PlayerID playerID, GameConfig config) async {
    final gameCode = generateGameID([]);
    final backendRead = ProviderContainer(parent: ref.container, overrides: []);
    final lobby = backendRead.read(BackendProviders.lobby.notifier);
    lobby.setCode(gameCode);
    lobby.setConfig(config);
    games[gameCode] = LocalGame(gameCode, playerID, backendRead);
    return gameCode;
  }

  @override
  Future<bool> deleteGame(PlayerID playerID, GameCode code) async {
    final game = games.remove(code);
    game?.container.dispose();
    if (game != null) {
      return true;
    }
    return false;
  }

  @override
  Future<String?> joinGame(
      PlayerID playerID, GameCode code, PlayerName name) async {
    final reader = backendReader(code);
    if (reader == null) {
      return null;
    }

    final notifier = reader.read(BackendProviders.lobby.notifier);
    // Await to ensure that the lobby is initialized
    await Future.delayed(const Duration(microseconds: 1));
    notifier.addPlayer(Player(playerID, name: name));
    await Future.delayed(const Duration(microseconds: 1));

    final lobby = reader.read(BackendProviders.lobby);
    final config = lobby.config;
    final players = lobby.players;
    if (players.length == config.maxPlayers && config.autoStart) {
      notifier.start();
    }

    return name;
  }

  @override
  Future<IList<GameInfo>> getGames(PlayerID playerID) async {
    final gms = games.values
        .map((g) => (g.creator, g.container.read(BackendProviders.lobby)));
    return [
      for (final (creatorId, g) in gms)
        if (g.players.any((p) => p.id == playerID))
          GameInfo(
            config: g.config,
            status: g.gameStatus,
            gameID: g.code,
            player: g.players.firstWhere((p) => p.id == playerID).name,
            players: g.players.map((p) => p.name).toIList(),
            creator: creatorId == playerID,
          )
    ].lock;
  }
}

/// Keeps track of some metadata about a game for an [OnDeviceService] game
final class LocalGame {
  LocalGame(this.gameCode, this.creator, this.container);
  final GameCode gameCode;
  final PlayerID creator;
  final ProviderContainer container;
}
