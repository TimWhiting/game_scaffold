import 'dart:async';

import '../../../server.dart';

/// Location that corresponds to running the game on-device
// ignore: constant_identifier_names
const OnDeviceService = 'on-device';

/// An implementation of a [RoundService] for a local game on device with no server connection
///
/// Warning implementation not complete or tested yet
class OnDeviceRoundService extends RoundService {
  OnDeviceRoundService();
  @override
  Future<bool> exitGame(PlayerID playerID, GameCode code) async => true;

  @override
  Stream<GameState<T>> gameStream<T extends Object>(
      PlayerID playerID, GameCode code) async* {
    logger.info('Watching backend');
    final ss = StreamController<GameState<T>>();
    final backendReader = OnDeviceGameService.games[code]?.container;
    backendReader?.listen<GameState>(
      fireImmediately: true,
      BackendProviders.state,
      (prev, curr) async {
        ss.add(curr as GameState<T>);
      },
    );

    yield* ss.stream;
    await ss.close();
  }

  @override
  Future<bool> sendEvent<E extends Object>(
      PlayerID playerID, GameCode code, E event) async {
    final js = Game.toEventJson(event);
    logger.info('Sending event $js');
    final backendReader = OnDeviceGameService.games[code]!.container;
    // If the gameClient is initializing
    // we cannot edit the backend provider synchronously
    await Future.delayed(const Duration(microseconds: 1));
    final result =
        backendReader.read(BackendProviders.state.notifier).handleEvent(event);
    return result;
  }

  @override
  Stream<GameError> errorStream(PlayerID playerID, GameCode code) async* {
    final ss = StreamController<GameError>();

    final backendReader = OnDeviceGameService.games[code]?.container;

    backendReader?.listen<GameError?>(
      fireImmediately: true,
      BackendProviders.error,
      (prev, curr) async {
        if (curr != null) {
          ss.add(curr);
        }
      },
    );
    yield* ss.stream;
    await ss.close();
  }

  @override
  Future<bool> startGame(PlayerID playerID, GameCode code) async {
    final backendReader = OnDeviceGameService.games[code]!.container.read;
    final notifier = backendReader(BackendProviders.lobby.notifier);
    await Future.delayed(const Duration(microseconds: 1));
    notifier.start();
    return true;
  }

  @override
  Stream<GameInfo> gameLobby(PlayerID playerID, GameCode code) async* {
    final backend = OnDeviceGameService.games[code]?.container;
    final ss = StreamController<GameInfo>();
    if (backend == null) {
      return;
    }

    backend.listen<Stream<GameInfo>>(
      fireImmediately: true,
      BackendProviders.playerLobby(playerID).stream,
      (prev, curr) async {
        // ignore: prefer_foreach
        await for (final e in curr) {
          ss.add(e);
        }
      },
    );
    yield* ss.stream;
    await ss.close();
  }
}

final onDeviceRoundService = Provider<RoundService>((ref) {
  final client = OnDeviceRoundService();
  ref.onDispose(client.dispose);
  return client;
}, dependencies: [playerIDProvider]);

/// An on device implementation of [GameService]
///
/// Warning implementation not complete or tested yet
class OnDeviceGameService extends GameService {
  OnDeviceGameService() : super();
  static final games = <GameCode, LocalGame>{};
  @override
  Future<String> createGame(PlayerID playerID, GameConfig config) async {
    final gameCode = generateGameID([]);
    final backendRead = ProviderContainer(overrides: []);
    final lobby = backendRead.read(BackendProviders.lobby.notifier);
    // await Future.delayed(const Duration(microseconds: 1));
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
    final backendReader = OnDeviceGameService.games[code]!.container.read;

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
  Future<IList<GameInfo>> getGames(PlayerID playerID) async {
    final gms = games.values.where(
      (g) => g.container
          .read(BackendProviders.lobby)
          .players
          .any((p) => p.id == playerID),
    );
    return [
      for (final g in gms)
        GameInfo(
          config: g.container.read(BackendProviders.lobby).config,
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

final onDeviceGameService = Provider<GameService>(
  (ref) {
    final client = OnDeviceGameService();
    ref.onDispose(client.dispose);
    return client;
  },
  name: 'onDeviceGameServerClient',
  dependencies: const [],
);

/// Keeps track of some metadata about a game for an [OnDeviceService] game
class LocalGame {
  LocalGame(this.gameCode, this.creator, this.container);
  final GameCode gameCode;
  final PlayerID creator;
  final ProviderContainer container;
}
