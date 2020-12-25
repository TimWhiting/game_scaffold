import 'package:riverpod/all.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../game.dart';
import '../game_client.dart';
import '../providers.dart';
import 'channels.dart';

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

  static void registerImplementation() {
    GameClient.registerImplementation(
      GameLocation.IOServer,
      (read, address, id, gameCode) => IOGameClient(
          address: address, read: read, id: id, gameCode: gameCode),
    );
  }
}
