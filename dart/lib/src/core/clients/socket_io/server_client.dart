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
    socket = IO.io(address, socketIOOpts);
    socket.on(IOChannel.connection.string,
        (_) => read.gameFor(playerID).gameStatus = GameStatus.NotJoined);
    socket.on(IOChannel.disconnect.string,
        (_) => read.gameFor(playerID).gameStatus = GameStatus.NotConnected);
    Future.delayed(
        100.milliseconds,
        () => read.gameFor(playerID).gameStatus =
            socket.connected ? GameStatus.NotJoined : GameStatus.NotConnected);
    logger.info('Created ServerClient');
  }

  final String address;
  IO.Socket socket;

  @override
  Future<void> createGame() async {
    final gameConfig = read.gameFor(playerID).gameConfig;
    logger.fine('Creating game $gameConfig');
    final gameCode = await _createGame(gameConfig);
    read.gameFor(playerID).gameCode = gameCode;
  }

  Future<String> _createGame(GameConfig config) async {
    final result = await socket.call(IOChannel.creategame, config.toJson());
    return result as String;
  }

  @override
  Future<bool> deleteGame() async {
    final result = await socket.call(
        IOChannel.deletegame, read.gameFor(playerID).gameCode);
    return result as bool;
  }

  @override
  Future<List<GameInfo>> getGames() async {
    final result = await socket.call(IOChannel.getgames, playerID);
    return (json.decode(result as String) as List<dynamic>)
        .map((v) => GameInfo.fromJson(v as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> getGameInfo(String gameId) async {
    final result = await socket.call(IOChannel.getgameinfo, gameId);
    read.gameFor(playerID).currentGameInfo = result == '404'
        ? null
        : GameInfo.fromJson(result as Map<String, dynamic>);
  }

  @override
  void dispose() {
    logger.info('Dispose');
    socket.disconnect();
    socket.dispose();
  }

  static void registerImplementation() {
    ServerClient.registerImplementation(
      IOServerLocation,
      (read, address, id) =>
          IOServerClient(read: read, address: address, playerID: id),
    );
  }
}
