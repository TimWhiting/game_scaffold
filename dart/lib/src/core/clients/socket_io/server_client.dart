import 'dart:convert';

import 'package:riverpod/all.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../client.dart';
import '../../core.dart';
import '../providers.dart';
import '../server_client.dart';
import 'channels.dart';

/// The socket IO implementation of [ServerClient]
class IOServerClient extends ServerClient {
  IOServerClient({
    Reader read,
    this.address,
    String playerID,
  }) : super(read, playerID) {
    Future.delayed(10.milliseconds, () {
      connect();
    });
  }

  final String address;
  IO.Socket socket;

  @override
  Future<void> createGame() async {
    final gameConfig = game.gameConfig;
    logger.fine('Creating game $gameConfig');
    final gameCode = await _createGame(gameConfig);
    game.gameCode = gameCode;
  }

  Future<String> _createGame(GameConfig config) async {
    await _ensureInitialized();
    final result = await socket.call(IOChannel.creategame, config.toJson());
    return result as String;
  }

  @override
  Future<bool> deleteGame() async {
    await _ensureInitialized();
    final result = await socket.call(IOChannel.deletegame, game.gameCode);
    return result as bool;
  }

  @override
  Future<List<GameInfo>> getGames() async {
    await _ensureInitialized();
    final result = await socket.call(IOChannel.getgames, playerID);
    return (json.decode(result as String) as List<dynamic>)
        .map((v) => GameInfo.fromJson(v as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> getGameInfo(String gameId) async {
    await _ensureInitialized();
    final result = await socket.call(IOChannel.getgameinfo, gameId);
    game.currentGameInfo = result == '404'
        ? null
        : GameInfo.fromJson(result as Map<String, dynamic>);
  }

  @override
  void dispose() {
    logger.info('Dispose');
    socket.dispose();
  }

  Future<void> _ensureInitialized() async {
    if (socket == null) {
      await connect();
    }
  }

  /// Connects to the backend
  @override
  Future<void> connect() async {
    if (socket != null) {
      await disconnect();
    }
    socket = IO.io(address, socketIOOpts);
    socket.on(IOChannel.connection.string,
        (_) => game.gameStatus = GameStatus.NotJoined);
    socket.on(IOChannel.disconnect.string,
        (_) => game.gameStatus = GameStatus.NotConnected);

    final currentStatus = game.gameStatus;
    await Future.delayed(20.milliseconds);
    if (currentStatus == GameStatus.NotConnected ||
        currentStatus == GameStatus.NotJoined) {
      game.gameStatus =
          socket.connected ? GameStatus.NotJoined : GameStatus.NotConnected;
    }
    logger.info('Created ServerClient');
  }

  /// Disconnect from the backend
  ///
  /// Default implementation does nothing
  @override
  Future<void> disconnect() async {
    socket.dispose();
    socket = null;
    game.gameStatus = GameStatus.NotConnected;
  }

  static void registerImplementation() {
    ServerClient.registerImplementation(
      IOServerLocation,
      (read, address, id) =>
          IOServerClient(read: read, address: address, playerID: id),
    );
  }
}
