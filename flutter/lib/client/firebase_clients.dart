import 'package:game_scaffold/game_scaffold.dart';
import 'package:riverpod/all.dart';

class FirebaseServerClient extends ServerClient {
  FirebaseServerClient(Reader read, PlayerID id) : super(read, id);
  @override
  void connect() {
    // TODO: implement connect
  }

  @override
  Future<void> createGame() {
    // TODO: implement createGame
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteGame() {
    // TODO: implement deleteGame
    throw UnimplementedError();
  }

  @override
  void disconnect() {
    // TODO: implement disconnect
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<void> getGameInfo(String gameId) {
    // TODO: implement getGameInfo
    throw UnimplementedError();
  }

  @override
  Future<List<GameInfo>> getGames() {
    // TODO: implement getGames
    throw UnimplementedError();
  }

  static void registerImplementation() {
    ServerClient.registerImplementation(
      GameLocation.Firebase,
      (reader, address, id) => FirebaseServerClient(reader, id),
    );
  }
}

class FirebaseGameClient extends GameClient {
  FirebaseGameClient(PlayerID id, String gameCode, Reader read)
      : super(id, gameCode, read);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void exitGame() {
    // TODO: implement exitGame
  }

  @override
  Future<void> register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  void sendEvent(GameEvent event) {
    // TODO: implement sendEvent
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      GameLocation.Firebase,
      (read, address, id, gameCode) => FirebaseGameClient(id, gameCode, read),
    );
  }
}

void registerFirebaseServerClients() {
  FirebaseServerClient.registerImplementation();
  FirebaseGameClient.registerImplementation();
}
