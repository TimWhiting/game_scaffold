import 'dart:async';

import '../../../server.dart';

/// Location that corresponds to running the game on-device
const OnDeviceClient = 'on-device';

/// An on device implementation of [GameClient]
///
/// Warning implementation not complete or tested yet
class NoGameClient extends GameClient {
  NoGameClient() : super();

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
  Stream<ApiResponse<WatchGameResponse>> gameStream(WatchGameRequest request) {
    // TODO: implement gameStream
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
  Future<ApiResponse<SendEventResponse>> sendEvent(SendEventRequest event) {
    // TODO: implement sendEvent
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<StartGameResponse>> startGame(StartGameRequest request) {
    // TODO: implement startGame
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<UpdateConfigResponse>> updateConfig(UpdateConfigRequest request) {
    // TODO: implement updateConfig
    throw UnimplementedError();
  }
}

final onDeviceGameClient = Provider<GameClient>(
  (ref) {
    final client = NoGameClient();

    return client;
  },
  name: 'onDeviceGameClient',
  dependencies: const [],
);

/// Keeps track of some metadata about a game for an [OnDeviceClient] game
class LocalGame {
  LocalGame(this.gameCode, this.creator);
  final GameCode gameCode;
  final PlayerID creator;
}
