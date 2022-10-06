import 'dart:async';

import '../../../server.dart';

/// Location that corresponds to running the game on-device
const OnDeviceClient = 'on-device';

/// An implementation of a [RoundClient] for a local game on device with no server connection
///
/// Warning implementation not complete or tested yet
class NoServerRoundClient extends RoundClient {
  NoServerRoundClient();
  @override
  Future<bool> exitGame(PlayerID playerID, GameCode code) async => true;

  @override
  Future<String?> joinGame(
      PlayerID playerID, GameCode code, PlayerName name) async {
    final backendReader = NoGameClient.games[code]!.container.read;

    final notifier = backendReader(BackendProviders.lobby.notifier);
    await Future.delayed(const Duration(microseconds: 1));
    notifier.addPlayer(Player(playerID, name: name));
    await Future.delayed(const Duration(microseconds: 1));

    final lobby = backendReader(BackendProviders.lobby);
    final config = lobby.config;
    final players = lobby.players;
    if (players.length == config.maxPlayers && config.autoStart) {
      notifier.start();
    }

    return name;
  }

  @override
  Future<bool> startGame(PlayerID playerID, GameCode code) async {
    final backendReader = NoGameClient.games[code]!.container.read;
    final notifier = backendReader(BackendProviders.lobby.notifier);
    await Future.delayed(const Duration(microseconds: 1));
    notifier.start();
    return true;
  }

  @override
  Stream<GameInfo> gameLobby(PlayerID playerID, GameCode code) async* {
    final backend = NoGameClient.games[code]?.container;
    final ss = StreamController<GameInfo>();
    if (backend == null) {
      return;
    }

    backend.listen<Stream<GameInfo>>(
        BackendProviders.playerLobby(playerID).stream, (prev, curr) async {
      // ignore: prefer_foreach
      await for (final e in curr) {
        ss.add(e);
      }
    }, fireImmediately: true);
    yield* ss.stream;
    await ss.close();
  }

  @override
  Stream<NextStateOrError> gameStream(PlayerID playerID, GameCode code) async* {
    logger.info('Watching backend');
    final ss = StreamController<NextStateOrError>();
    final backendReader = NoGameClient.games[code]?.container;
    backendReader?.listen<GameStateNotifier>(
      BackendProviders.state.notifier,
      (prev, curr) async {
        ss.add(curr.gameState.gameValue());
        // ignore: prefer_foreach
        await for (final e in curr.stream) {
          ss.add(e);
        }
      },
      fireImmediately: true,
    );

    yield* ss.stream;
    await ss.close();
  }

  @override
  Future<bool> sendEvent(PlayerID playerID, GameCode code, Event event) async {
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    final backendReader = NoGameClient.games[code]!.container;
    // If the gameClient is initializing
    // we cannot edit the backend provider synchronously
    await Future.delayed(const Duration(microseconds: 1));
    final result = backendReader
        .read(BackendProviders.state.notifier)
        .handleEvent(event.asGameEvent);
    return result;
  }

  @override
  void dispose() {
    logger.info('Disposing game client');
  }
}

final onDeviceGameClient = Provider<RoundClient>((ref) {
  final client = NoServerRoundClient();
  ref.onDispose(client.dispose);
  return client;
}, dependencies: [GameProviders.playerID]);

/// An on device implementation of [GameClient]
///
/// Warning implementation not complete or tested yet
class NoGameClient extends GameClient {
  NoGameClient() : super();
  static final games = <GameCode, LocalGame>{};
  @override
  Future<String> createGame(PlayerID playerID, GameConfig config) async {
    final gameCode = generateGameID([]);
    final backendRead = ProviderContainer(overrides: []);
    final lobby = backendRead.read(BackendProviders.lobby.notifier);
    await Future.delayed(const Duration(microseconds: 1));
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
  void dispose() {}

  @override
  Future<IList<GameInfo>> getGames(PlayerID playerID) async {
    final gms = games.values.where((g) => g.container
        .read(BackendProviders.lobby)
        .players
        .any((p) => p.id == playerID));
    return [
      for (final g in gms)
        GameInfo(
          status: g.container.read(BackendProviders.lobby).gameStatus,
          gameID: g.gameCode,
          player: g.container
              .read(BackendProviders.lobby)
              .players
              .firstWhere((p) => p.id == playerID)
              .name,
          players: g.container
              .read(BackendProviders.lobby)
              .players
              .map((p) => p.name)
              .toIList(),
          gameType: g.container.read(BackendProviders.lobby).config.gameType,
          creator: g.creator == playerID,
        )
    ].lock;
  }
}

final onDeviceGameServerClient = Provider<GameClient>(
  (ref) {
    final client = NoGameClient();
    ref.onDispose(client.dispose);
    scheduleMicrotask(() {
      ref.read(GameProviders.connected.notifier).state = true;
    });
    return client;
  },
  name: 'onDeviceGameServerClient',
  dependencies: [GameProviders.connected],
);

/// Keeps track of some metadata about a game for an [OnDeviceClient] game
class LocalGame {
  LocalGame(this.gameCode, this.creator, this.container);
  final GameCode gameCode;
  final PlayerID creator;
  final ProviderContainer container;
}
