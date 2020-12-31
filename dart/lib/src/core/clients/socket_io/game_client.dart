import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:riverpod/all.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../core.dart';
import '../game_client.dart';
import '../providers.dart';
import 'channels.dart';

/// The socket IO implementation of [GameClient]
class IOGameClient extends GameClient {
  IOGameClient({Reader read, this.address, String gameCode, String id})
      : socket = IO.io('$address/$gameCode', socketIOOpts),
        super(id, gameCode, read);
  final String address;

  final IO.Socket socket;

  @override
  void exitGame() {
    socket.off(IOChannel.error.string);
    socket.off(IOChannel.gamestate.string);
    socket.off(IOChannel.lobby.string);
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

  void _onLobby(Map<String, dynamic> lobby) {
    socket.on(IOChannel.lobby.string, (data) {
      final gameInfo = GameInfo.fromJson(data);
      read(gameLobbyProvider(id)).state = gameInfo;
    });
  }

  void _watchState() {
    socket.on(IOChannel.gamestate.string, (data) {
      final gameState = Game.fromJson(data as Map<String, dynamic>);
      socket.off(IOChannel.lobby.string);
      print(data);
      read(gameStateProvider(id)).state = gameState;
      read(gameStatusProvider(id)).state = gameState.gameStatus;
    });
    socket.on(IOChannel.error.string, (data) {
      //TODO: Display errors
    });
    socket.on(IOChannel.lobby.string, (d) => _onLobby(d));
  }

  @override
  void sendEvent(Event event) {
    final js = event.asGameEvent.toJson();
    print('Sending event $js');
    socket.emit(IOChannel.event.string, js);
  }

  @override
  void dispose() {
    print('Disposing game client');
    socket.disconnect();
    socket.dispose();
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      IOServerLocation,
      (read, address, id, gameCode) => IOGameClient(
          address: address, read: read, id: id, gameCode: gameCode),
    );
  }
}
