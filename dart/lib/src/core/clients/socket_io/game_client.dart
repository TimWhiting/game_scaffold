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
  IOGameClient({Reader read, this.address, String id}) : super(id, read) {
    Future.delayed(100.milliseconds, _ensureConnected);
  }
  final String address;

  IO.Socket _socket;
  String _lastGameCode;

  void _ensureConnected() {
    if (gameCode != _lastGameCode || (_socket?.disconnected ?? true)) {
      _socket?.disconnect();
      _socket?.dispose();
      _socket = IO.io('$address/$gameCode', socketIOOpts);
      logger.info('Created Game Client Socket $gameCode');
      _lastGameCode = gameCode;
      read.gameFor(id).gameStatus = GameStatus.NotJoined;
    }
  }

  @override
  void exitGame() {
    _socket.off(IOChannel.error.string);
    _socket.off(IOChannel.gamestate.string);
    _socket.off(IOChannel.lobby.string);
    read.gameFor(id).gameStatus = GameStatus.NotJoined;
    _socket.disconnect();
  }

  @override
  Future<void> register() async {
    _ensureConnected();
    read.gameFor(id).gameStatus = GameStatus.NotJoined;
    _watchState();
    final assignedName = await _socket.call(
        IOChannel.register, {'name': read.gameFor(id).playerName, 'id': id});
    read.gameFor(id).playerName = assignedName as String;
  }

  void _onLobby(Map<String, dynamic> lobby) {
    final gameInfo = GameInfo.fromJson(lobby);
    read.gameFor(id).gameStatus = GameStatus.NotStarted;
    print('Lobby $gameInfo');
    read.gameFor(id).lobbyInfo = gameInfo;
  }

  void _watchState() {
    _socket.on(IOChannel.gamestate.string, (data) {
      _socket.off(IOChannel.lobby.string);
      final gameState = Game.fromJson(data as Map<String, dynamic>);
      logger.fine(data);
      read.gameFor(id).gameState = gameState;
      read.gameFor(id).gameStatus = gameState.gameStatus;
    });
    _socket.on(IOChannel.error.string, (data) {
      read.gameFor(id).gameError = GameError.fromJson(data);
    });
    _socket.on(IOChannel.lobby.string, (d) => _onLobby(d));
  }

  @override
  void sendEvent(Event event) {
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    _socket.emit(IOChannel.event.string, js);
  }

  @override
  void dispose() {
    logger.info('Dispose');
    _socket.disconnect();
    _socket.dispose();
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      IOServerLocation,
      (read, address, id) => IOGameClient(address: address, read: read, id: id),
    );
  }
}
