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
  BackendReader get backend => BackendReader(read);
  @override
  Future<void> createGame() async {
    final gameCode = generateGameID([]);
    read.gameCode = gameCode;
    backend.gameConfig = read.gameConfig;
    games[gameCode] = LocalGame(gameCode, playerID, backend);
  }

  @override
  Future<bool> deleteGame() async {
    if (games.remove(read.gameCode) != null) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {}

  @override
  Future<IList<GameInfo>> getGames() async {
    final gms =
        games.values.where((g) => g.read.players.any((p) => p.id == playerID));
    return [
      for (final g in gms)
        GameInfo(
          gameId: g.gameCode,
          player: g.read.players.firstWhere((p) => p.id == playerID).name,
          players: g.read.players.map((p) => p.name).toIList(),
          gameType: g.read.gameConfig.gameType,
          creator: g.creator == playerID,
        )
    ].lock;
  }

  static void registerImplementation() {
    ServerClient.registerImplementation(
      OnDeviceLocation,
      (ref, address, id) => NoServerClient(ref: ref, playerID: id),
    );
  }
}

/// Keeps track of some metadata about a game for an [OnDeviceLocation] game
class LocalGame {
  LocalGame(this.gameCode, this.creator, this.read);
  final GameCode gameCode;
  final PlayerID creator;
  final BackendReader read;
}
