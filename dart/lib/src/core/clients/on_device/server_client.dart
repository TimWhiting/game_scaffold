import 'package:riverpod/riverpod.dart';

import '../../backend.dart';
import '../../core.dart';
import '../clients.dart';

/// An on device implementation of [ServerClient]
///
/// Warning implementation not complete or tested yet
class NoServerClient extends ServerClient {
  NoServerClient({required Reader read, required PlayerID playerID})
      : super(read, playerID);
  static final games = <GameCode>[];
  BackendGameReader get backend => read.backendGame(game.gameCode);
  @override
  Future<void> createGame() async {
    final gameCode = generateGameID([]);
    game.gameCode = gameCode;
    backend.gameConfig = game.gameConfig;
  }

  @override
  Future<bool> deleteGame() async => games.remove(game.gameCode);

  @override
  void dispose() {}

  @override
  Future<void> getGameInfo(GameCode gameId) async {
    // return read.backendGame(gameId).game
  }

  @override
  Future<IList<GameInfo>> getGames() async => <GameInfo>[].lock;

  static void registerImplementation() {
    ServerClient.registerImplementation(
      OnDeviceLocation,
      (read, address, id) => NoServerClient(read: read, playerID: id),
    );
  }
}
