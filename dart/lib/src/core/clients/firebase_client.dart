import 'package:firebase_dart/firebase_dart.dart';

import '../../../game_scaffold_dart.dart';

const String FirebaseClient = 'firebase';

class FirebaseGameClient extends NetworkGameClient {
  FirebaseGameClient({required GameAddress address}) : super(address: address);

  @override
  Future<ApiResponse<CreateGameResponse>> createGame(CreateGameRequest request) {
    // TODO: implement createGame
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<DeleteGameResponse>> deleteGame(DeleteGameRequest request) {
    // TODO: implement deleteGame
    throw UnimplementedError();
  }

  @override
  Stream<ApiResponse<WatchLobbyResponse>> gameLobby(WatchLobbyRequest request) {
    // TODO: implement gameLobby
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<JoinGameResponse>> joinGame(JoinGameRequest request) {
    // TODO: implement joinGame
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<ListGamesResponse>> listGames(ListGamesRequest request) {
    // TODO: implement listGames
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<StartGameResponse>> startGame(StartGameRequest request) {
    // TODO: implement startGame
    throw UnimplementedError();
  }

  @override
  Stream<ApiResponse<WatchGameResponse>> gameStream(WatchGameRequest request) {
    // TODO: implement gameStream
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<SendEventResponse>> sendEvent(SendEventRequest event) {
    // TODO: implement sendEvent
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<UpdateConfigResponse>> updateConfig(UpdateConfigRequest request) {
    // TODO: implement updateConfig
    throw UnimplementedError();
  }
}

final firebaseCacheLocationProvider = Provider<String?>((ref) => null);
final firebaseOptionsProvider = Provider<FirebaseOptions>((ref) => throw Exception('firebaseOptions not set'));
final firebaseAppProvider = FutureProvider<FirebaseApp>(
  (ref) {
    FirebaseDart.setup(storagePath: ref.watch(firebaseCacheLocationProvider));
    return Firebase.initializeApp(options: ref.watch(firebaseOptionsProvider));
  },
  dependencies: [firebaseOptionsProvider, firebaseCacheLocationProvider],
);
final firebaseGameClient = Provider.autoDispose(
  (ref) => FirebaseGameClient(address: ref.watch(GameProviders.remoteUri)),
  name: 'firebaseGameClient',
  dependencies: [GameProviders.remoteUri],
);
