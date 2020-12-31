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
  static final List<Player> _players = [];
  @override
  void exitGame() {
    read(gameStatusProvider(id)).state = GameStatus.NotJoined;
  }

  @override
  Future<void> register() async {
    _players.add(Player(id));
    print(_players);
    read(backendPlayersProvider).state = _players.toImmutableList();
    read(gameStatusProvider(id)).state = GameStatus.NotJoined;
    read(playerNameProvider(id)).state = '';
    read(gameStatusProvider(id)).state = GameStatus.NotStarted;
    _watchState();
    final config = read(backendGameConfigProvider).state;
    if (_players.length == config.maxPlayers && config.autoStart) {
      sendEvent(GenericEvent.start());
    }
  }

  void _watchState() {
    _ss = read(gameProvider).stream.listen((gameState) {
      read(gameStateProvider(id)).state = gameState;
      read(gameStatusProvider(id)).state = gameState.gameStatus;
    }, onError: (e) {
      print(e);
      // TODO: Do something on error
    });
  }

  @override
  void sendEvent(Event event) {
    final js = event.asGameEvent.toJson();
    print('Sending event $js');
    read(gameProvider).handleEvent(event.asGameEvent);
  }

  @override
  void dispose() {
    _ss.cancel();
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
