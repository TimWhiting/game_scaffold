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
        super(id, gameCode, read) {
    logger.info('Created Game Client $gameCode');
  }
  final String address;

  final IO.Socket socket;

  @override
  void exitGame() {
    socket.off(IOChannel.error.string);
    socket.off(IOChannel.gamestate.string);
    socket.off(IOChannel.lobby.string);
    read.game(id).gameStatus = GameStatus.NotJoined;
    socket.disconnect();
  }

  @override
  Future<void> register() async {
    read.game(id).gameStatus = GameStatus.NotJoined;
    final assignedName = await socket
        .call(IOChannel.register, {'name': read.game(id).playerName, 'id': id});

    read.game(id).playerName = assignedName as String;
    read.game(id).gameStatus = GameStatus.NotStarted;
    _watchState();
  }

  void _onLobby(Map<String, dynamic> lobby) {
    socket.on(IOChannel.lobby.string, (data) {
      final gameInfo = GameInfo.fromJson(data);
      read.game(id).lobbyInfo = gameInfo;
    });
  }

  void _watchState() {
    socket.on(IOChannel.gamestate.string, (data) {
      final gameState = Game.fromJson(data as Map<String, dynamic>);
      socket.off(IOChannel.lobby.string);
      logger.fine(data);
      read.game(id).gameState = gameState;
      read.game(id).gameStatus = gameState.gameStatus;
    });
    socket.on(IOChannel.error.string, (data) {
      read.game(id).gameError = GameError.fromJson(data);
    });
    socket.on(IOChannel.lobby.string, (d) => _onLobby(d));
  }

  @override
  void sendEvent(Event event) {
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    socket.emit(IOChannel.event.string, js);
  }

  @override
  void dispose() {
    logger.info('Dispose');
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
