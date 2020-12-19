import 'dart:convert';

import 'package:riverpod/all.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'comms.dart';
import 'game.dart';
import 'providers.dart';

abstract class ServerClient {
  ServerClient(this.read, this.id);
  final PlayerID id;
  String gameCode;
  final Reader read;
  void connect();
  Future<void> createGame();
  Future<bool> deleteGame();
  Future<List<GameInfo>> getGames();
  Future<void> getGameInfo(String gameId);
  void dispose();
  void disconnect();

  static void registerImplementation<T extends ServerClient>(
    GameLocation loc,
    T Function(Reader, String, PlayerID) impl,
  ) {
    clientImplementations[loc] = impl;
  }

  static Map<GameLocation, ServerClient Function(Reader, String, PlayerID)>
      clientImplementations = {};

  static ServerClient fromParams({
    GameLocation location,
    Reader read,
    String address,
    PlayerID id,
  }) {
    final impl = clientImplementations[location];
    if (impl == null) {
      throw UnimplementedError(
          'No ServerClient implementation for $location defined');
    }
    return impl(read, address, id);
  }
}

class IOServerClient extends ServerClient {
  IOServerClient({
    Reader read,
    this.address,
    PlayerID id,
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
}

class NoServerClient extends ServerClient {
  NoServerClient({Reader read, PlayerID id}) : super(read, id);

  @override
  void connect() {}

  @override
  Future<void> createGame() async {}

  @override
  Future<bool> deleteGame() async => true;

  @override
  void disconnect() {}

  @override
  void dispose() {}

  @override
  Future<void> getGameInfo(String gameId) async {}

  @override
  Future<List<GameInfo>> getGames() async => [];
}
