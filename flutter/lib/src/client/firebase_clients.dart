import 'package:game_scaffold/game_scaffold.dart';
import 'package:riverpod/all.dart';

const firebaseLocation = 'firebase-server';

class FirebaseServerClient extends ServerClient {
  FirebaseServerClient(Reader read, String id) : super(read, id);

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
      firebaseLocation,
      (reader, address, id) => FirebaseServerClient(reader, id),
    );
  }
}

class FirebaseGameClient extends GameClient {
  FirebaseGameClient(String id, String gameCode, Reader read)
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
  void sendEvent(Event event) {
    // TODO: implement sendEvent
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      firebaseLocation,
      (read, address, id, gameCode) => FirebaseGameClient(id, gameCode, read),
    );
  }
}

void registerFirebaseServerClients() {
  FirebaseServerClient.registerImplementation();
  FirebaseGameClient.registerImplementation();
}
