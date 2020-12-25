import 'dart:convert';

import 'package:riverpod/all.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../game.dart';
import '../providers.dart';
import '../server_client.dart';
import 'channels.dart';

class IOServerClient extends ServerClient {
  IOServerClient({
    Reader read,
    this.address,
    String id,
  }) : super(read, id);

  @override
  void connect() {
    socket = IO.io(address, socketIOOpts);
    socket.on(IOChannel.connection.string,
        (_) => read(gameStatusProvider(id)).state = GameStatus.NotJoined);
    socket.on(IOChannel.disconnect.string,
        (_) => read(gameStatusProvider(id)).state = GameStatus.NotConnected);
    Future.delayed(
        100.milliseconds,
        () => read(gameStatusProvider(id)).state =
            socket.connected ? GameStatus.NotJoined : GameStatus.NotConnected);
  }

  final String address;
  IO.Socket socket;

  @override
  Future<void> createGame() async {
    final gameConfig = read(gameConfigProvider).state;
    print('Creating game $gameConfig');
    final gameCode = await _createGame(gameConfig);
    read(gameCodeProvider(id)).state = gameCode;
  }

  Future<String> _createGame(GameConfig config) async {
    final result = await socket.call(IOChannel.creategame, config.toJson());
    return result as String;
  }

  @override
  Future<bool> deleteGame() async {
    final result = await socket.call(
        IOChannel.deletegame, read(gameCodeProvider(id)).state);
    return result as bool;
  }

  @override
  Future<List<GameInfo>> getGames() async {
    final result = await socket.call(IOChannel.getgames, id);
    return (json.decode(result as String) as List<dynamic>)
        .map((v) => GameInfo.fromJson(v as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> getGameInfo(String gameId) async {
    final result = await socket.call(IOChannel.getgameinfo, gameId);
    read(gameInfoProvider).state = result == '404'
        ? null
        : GameInfo.fromJson(result as Map<String, dynamic>);
  }

  @override
  void dispose() {
    print('Disposing server client');
    socket.disconnect();
    socket.dispose();
  }

  @override
  void disconnect() {
    socket.disconnect();
  }

  static void registerImplementation() {
    ServerClient.registerImplementation(
      GameLocation.IOServer,
      (read, address, id) =>
          IOServerClient(read: read, address: address, id: id),
    );
  }
}
