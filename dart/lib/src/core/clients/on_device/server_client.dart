import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:riverpod/all.dart';

import '../../core.dart';
import '../clients.dart';

/// An on device implementation of [ServerClient]
///
/// Warning implementation not complete or tested yet
class NoServerClient extends ServerClient {
  NoServerClient({Reader read, String playerID}) : super(read, playerID);
  static final games = <String>[];
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
  Future<void> getGameInfo(String gameId) async {
    // return read.backendGame(gameId).game
  }

  @override
  Future<List<GameInfo>> getGames() async => [];

  static void registerImplementation() {
    ServerClient.registerImplementation(
      OnDeviceLocation,
      (read, address, id) => NoServerClient(read: read, playerID: id),
    );
  }
}
