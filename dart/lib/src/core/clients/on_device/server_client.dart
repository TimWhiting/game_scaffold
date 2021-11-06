import 'package:riverpod/riverpod.dart';

import '../../backend.dart';
import '../../core.dart';
import '../clients.dart';

/// An on device implementation of [ServerClient]
///
/// Warning implementation not complete or tested yet
class NoServerClient extends ServerClient {
  NoServerClient() : super();
  static final games = <GameCode, LocalGame>{};
  @override
  Future<String> createGame(PlayerID playerID, GameConfig config) async {
    final gameCode = generateGameID([]);
    final backendRead = ProviderContainer(overrides: []);
    final lobby = backendRead.read(BackendProviders.lobby.notifier);
    lobby.setCode(gameCode);
    lobby.setConfig(config);
    games[gameCode] = LocalGame(gameCode, playerID, backendRead);
    return gameCode;
  }

  @override
  Future<bool> deleteGame(PlayerID playerID, GameCode gameCode) async {
    final game = games.remove(gameCode);
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
    final gms = games.values.where((g) =>
        g.read(BackendProviders.lobby).players.any((p) => p.id == playerID));
    return [
      for (final g in gms)
        GameInfo(
          gameId: g.gameCode,
          player: g
              .read(BackendProviders.lobby)
              .players
              .firstWhere((p) => p.id == playerID)
              .name,
          players: g
              .read(BackendProviders.lobby)
              .players
              .map((p) => p.name)
              .toIList(),
          gameType: g.read(BackendProviders.lobby).config.gameType,
          creator: g.creator == playerID,
        )
    ].lock;
  }
}

final onDeviceGameServerClient = Provider((ref) => NoServerClient());

/// Keeps track of some metadata about a game for an [OnDeviceClient] game
class LocalGame {
  LocalGame(this.gameCode, this.creator, this.container);
  final GameCode gameCode;
  final PlayerID creator;
  final ProviderContainer container;
  Reader get read => container.read;
}
