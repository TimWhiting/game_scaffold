import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../../backend.dart';
import '../../client.dart';
import '../../core.dart';
import '../clients.dart';

/// An implementation of a [GameClient] for a local game on device with no server connection
///
/// Warning implementation not complete or tested yet
class NoServerGameClient extends GameClient {
  NoServerGameClient({Reader read, String playerID}) : super(playerID, read);
  StreamSubscription<Game> _ss;
  StreamSubscription<GameError> _se;
  BackendGameReader get backend => read.backendGame(game.gameCode);
  @override
  void exitGame() {
    game.gameStatus = GameStatus.NotJoined;
  }

  List<Player> get _players => backend.players;
  @override
  Future<void> register() async {
    backend.players =
        [..._players, Player(playerID, name: game.playerName ?? playerID)].toUnmodifiable();
    game.gameStatus = GameStatus.NotJoined;
    game.playerName = game.playerName ?? playerID;
    game.gameStatus = GameStatus.NotStarted;
    _watchState();
    final config = backend.gameConfig;
    if (_players.length == config.maxPlayers && config.autoStart) {
      sendEvent(GenericEvent.start());
    }
    for (final pID in _players) {
      read.gameFor(pID.id).lobbyInfo = GameInfo(
        gameCode,
        _players.map((p) => p.name).toUnmodifiable(),
        pID.name,
        pID.id == backend.players.first.id,
        config.gameType,
      );
    }
  }

  void _watchState() {
    _ss = backend.gameNotifier.stream.listen((gameState) {
      game.gameState = gameState;
      game.gameStatus = gameState.gameStatus;
    }, onError: (e) {
      game.gameError = GameError(e, playerID);
    });
    _se = backend.errorNotifier.stream.listen((gameError) {
      if (gameError == null || gameError.person == playerID) {
        game.gameError = gameError;
      }
    });
  }

  @override
  void sendEvent(Event event) {
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    backend.handleEvent(event.asGameEvent);
  }

  @override
  void dispose() {
    _ss?.cancel();
    _se?.cancel();
    logger.info('Disposing game client');
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      OnDeviceLocation,
      (read, address, id) => NoServerGameClient(read: read, playerID: id),
    );
  }
}
