import 'dart:async';

import 'package:riverpod/all.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'comms.dart';
import 'game.dart';
import 'game_server.dart';
import 'providers.dart';

abstract class GameClient {
  GameClient(this.id, this.gameCode, this.read);
  final PlayerID id;
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
    T Function(Reader read, String address, PlayerID id, String gameCode) impl,
  ) {
    clientImplementations[loc] = impl;
  }

  static Map<GameLocation,
          GameClient Function(Reader, String, PlayerID, String)>
      clientImplementations = {};

  static GameClient fromParams({
    GameLocation location,
    Reader read,
    String address,
    PlayerID id,
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

// Clients
class IOGameClient extends GameClient {
  IOGameClient({Reader read, this.address, String gameCode, PlayerID id})
      : socket = IO.io('$address/$gameCode', socketIOOpts),
        super(id, gameCode, read);
  final String address;

  final IO.Socket socket;

  @override
  void exitGame() {
    socket.off(IOChannel.error.string);
    socket.off(IOChannel.gamestate.string);
    read(gameStatusProvider(id)).state = GameStatus.NotJoined;
  }

  @override
  Future<void> register() async {
    read(gameStatusProvider(id)).state = GameStatus.NotJoined;
    final assignedName = await socket.call(IOChannel.register,
        {'name': read(playerNameProvider(id)).state, 'id': id});
    read(playerNameProvider(id)).state = assignedName as String;
    read(gameStatusProvider(id)).state = GameStatus.NotStarted;
    _watchState();
  }

  void _watchState() {
    socket.on(IOChannel.gamestate.string, (data) {
      final gameState = Game.fromJson(data as Map<String, dynamic>);
      print(data);
      read(gameStateProvider(id)).state = gameState;
      read(gameStatusProvider(id)).state = gameState.gameStatus;
    });
    socket.on(IOChannel.error.string, (data) {
      //TODO: Display errors
    });
  }

  @override
  void sendEvent(GameEvent event) {
    final js = event.toJson();
    print('Sending event $js');
    socket.emit(IOChannel.event.string, js);
  }

  @override
  void dispose() {
    print('Disposing game client');
    socket.disconnect();
    socket.dispose();
  }
}

class NoServerGameClient extends GameClient {
  NoServerGameClient({Reader read, PlayerID id, String gameCode})
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
}
