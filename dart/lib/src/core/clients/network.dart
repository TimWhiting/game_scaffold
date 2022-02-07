import 'dart:async';

import '../../../game_scaffold_dart.dart';

/// Location that corresponds to using an io-server for the backend
const NetworkClient = 'network';

/// The socket IO implementation of [GameClient]
class NetworkGameClient extends GameClient {
  NetworkGameClient({
    required this.address,
  });

  final GameAddress address;

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

final networkGameClient = Provider<GameClient>(
  (ref) => NetworkGameClient(address: ref.watch(GameProviders.remoteUri)),
  name: 'networkGameClient',
  dependencies: [GameProviders.remoteUri],
);
