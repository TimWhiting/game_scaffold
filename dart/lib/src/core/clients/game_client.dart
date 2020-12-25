import 'dart:async';

import 'package:riverpod/all.dart';

import '../game.dart';
import '../game_server.dart';
import 'providers.dart';

abstract class GameClient {
  GameClient(this.id, this.gameCode, this.read);
  final String id;
  final String gameCode;
  final Reader read;
  void exitGame();
  Future<void> register();
  void sendEvent(GameEvent event);
  void startGame() => sendEvent(const GeneralEvent.start().asGameEvent);
  void undo() => sendEvent(const GeneralEvent.undo().asGameEvent);
  void newRound() => sendEvent(GeneralEvent.readyNextRound(id).asGameEvent);
  void sendMessage(String message) =>
      sendEvent(GeneralEvent.message(message, from: id, to: null).asGameEvent);
  void dispose();

  static void registerImplementation<T extends GameClient>(
    GameLocation loc,
    T Function(Reader read, String address, String id, String gameCode) impl,
  ) {
    clientImplementations[loc] = impl;
  }

  static Map<GameLocation, GameClient Function(Reader, String, String, String)>
      clientImplementations = {};

  static GameClient fromParams({
    GameLocation location,
    Reader read,
    String address,
    String id,
    String gameCode,
  }) {
    final impl = clientImplementations[location];
    if (impl == null) {
      throw UnimplementedError(
          'No ServerClient implementation for $location defined');
    }
    return impl(read, address, id, gameCode);
  }
}

class NoServerGameClient extends GameClient {
  NoServerGameClient({Reader read, String id, String gameCode})
      : super(id, gameCode, read);
  StreamSubscription<Game> _ss;
  static List<Player> players;
  @override
  void exitGame() {
    read(gameStatusProvider(id)).state = GameStatus.NotJoined;
  }

  @override
  Future<void> register() async {
    players.add(Player(id));
    read(serverPlayersProvider).state = players.toImmutableList();
    read(gameStatusProvider(id)).state = GameStatus.NotJoined;
    read(playerNameProvider(id)).state = '';
    read(gameStatusProvider(id)).state = GameStatus.NotStarted;
    _watchState();
  }

  void _watchState() {
    _ss = read(gameProvider).stream.listen((gameState) {
      read(gameStateProvider(id)).state = gameState;
      read(gameStatusProvider(id)).state = gameState.gameStatus;
    }, onError: () {
      // TODO: Do something on error
    });
  }

  @override
  void sendEvent(GameEvent event) {
    final js = event.toJson();
    print('Sending event $js');
    read(gameProvider).handleEvent(event);
  }

  @override
  void dispose() {
    _ss.cancel();
    print('Disposing game client');
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      GameLocation.Local,
      (read, address, id, gameCode) =>
          NoServerGameClient(read: read, id: id, gameCode: gameCode),
    );
  }
}
