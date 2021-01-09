import 'dart:async';

import 'package:riverpod/all.dart';

import '../../backend.dart';
import '../../client.dart';
import '../../core.dart';
import '../clients.dart';

/// An implementation of a [GameClient] for a local game on device with no server connection
///
/// Warning implementation not complete or tested yet
class NoServerGameClient extends GameClient {
  NoServerGameClient({Reader read, String id, String gameCode})
      : super(id, gameCode, read);
  StreamSubscription<Game> _ss;
  StreamSubscription<GameError> _se;
  @override
  void exitGame() {
    read.gameFor(id).gameStatus = GameStatus.NotJoined;
  }

  KtList<Player> get _players => read.backendGame(gameCode).players;
  @override
  Future<void> register() async {
    read.backendGame(gameCode).players =
        _players.plusElement(Player(id, name: id));
    read.gameFor(id).gameStatus = GameStatus.NotJoined;
    read.gameFor(id).playerName = id;
    read.gameFor(id).gameStatus = GameStatus.NotStarted;
    _watchState();
    final config = read.backendGame(gameCode).gameConfig;
    if (_players.size == config.maxPlayers && config.autoStart) {
      sendEvent(GenericEvent.start());
    }
    for (final pID in _players.iter) {
      read.gameFor(pID.id).lobbyInfo = GameInfo(
        gameCode,
        _players.map((p) => p.name).asList(),
        pID.name,
        false,
        config.gameType,
      );
    }
  }

  void _watchState() {
    _ss = read.backendGame(gameCode).gameNotifier.stream.listen((gameState) {
      read.gameFor(id).gameState = gameState;
      read.gameFor(id).gameStatus = gameState.gameStatus;
    }, onError: (e) {
      print(e);
      // TODO: Do something on error
    });
    _se = read.backendGame(gameCode).errorNotifier.stream.listen((gameError) {
      read.gameFor(id).gameError = gameError;
    });
  }

  @override
  void sendEvent(Event event) {
    final js = event.asGameEvent.toJson();
    print('Sending event $js');
    read.backendGame(gameCode).handleEvent(event.asGameEvent);
  }

  @override
  void dispose() {
    _ss?.cancel();
    _se?.cancel();
    print('Disposing game client');
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      OnDeviceLocation,
      (read, address, id, gameCode) =>
          NoServerGameClient(read: read, id: id, gameCode: gameCode),
    );
  }
}
