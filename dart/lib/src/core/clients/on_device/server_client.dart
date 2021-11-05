import 'package:riverpod/riverpod.dart';

import '../../backend.dart';
import '../../core.dart';
import '../clients.dart';

/// An on device implementation of [ServerClient]
///
/// Warning implementation not complete or tested yet
class NoServerClient extends ServerClient {
  NoServerClient(
      {required ProviderRef<ServerClient> ref, required PlayerID playerID})
      : super(ref, playerID);
  static final games = <GameCode, LocalGame>{};
  @override
  Future<String> createGame() async {
    final gameCode = generateGameID([]);
    read(GameProviders.code.notifier).state = gameCode;
    final backendRead = ProviderContainer(overrides: [
      GameProviders.code.overrideWithValue(StateController(gameCode))
    ]).read;
    backendRead(BackendProviders.config.notifier).state =
        read(GameProviders.config);
    games[gameCode] = LocalGame(gameCode, playerID, backendRead);

    return gameCode;
  }

  @override
  Future<bool> deleteGame() async {
    if (games.remove(read(GameProviders.code)) != null) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {}

  @override
  Future<IList<GameInfo>> getGames() async {
    final gms = games.values.where(
        (g) => g.read(BackendProviders.players).any((p) => p.id == playerID));
    return [
      for (final g in gms)
        GameInfo(
          gameId: g.gameCode,
          player: g
              .read(BackendProviders.players)
              .firstWhere((p) => p.id == playerID)
              .name,
          players:
              g.read(BackendProviders.players).map((p) => p.name).toIList(),
          gameType: g.read(BackendProviders.config).gameType,
          creator: g.creator == playerID,
        )
    ].lock;
  }

  static void registerImplementation() {
    ServerClient.registerImplementation(
      OnDeviceClient,
      (ref, address, id) => NoServerClient(ref: ref, playerID: id),
    );
  }
}

/// Keeps track of some metadata about a game for an [OnDeviceClient] game
class LocalGame {
  LocalGame(this.gameCode, this.creator, this.read);
  final GameCode gameCode;
  final PlayerID creator;
  final Reader read;
}
