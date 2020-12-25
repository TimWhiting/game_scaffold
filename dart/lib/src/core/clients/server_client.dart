import 'package:riverpod/all.dart';

import '../game.dart';

import 'providers.dart';

abstract class ServerClient {
  ServerClient(this.read, this.id);
  final String id;
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
    T Function(Reader, String, String) impl,
  ) {
    clientImplementations[loc] = impl;
  }

  static Map<GameLocation, ServerClient Function(Reader, String, String)>
      clientImplementations = {};

  static ServerClient fromParams({
    GameLocation location,
    Reader read,
    String address,
    String id,
  }) {
    final impl = clientImplementations[location];
    if (impl == null) {
      throw UnimplementedError(
          'No ServerClient implementation for $location defined');
    }
    return impl(read, address, id);
  }
}

class NoServerClient extends ServerClient {
  NoServerClient({Reader read, String id}) : super(read, id);

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

  static void registerImplementation() {
    ServerClient.registerImplementation(
      GameLocation.Local,
      (read, address, id) => NoServerClient(read: read, id: id),
    );
  }
}
