import 'dart:async';

import '../../../game_scaffold_dart.dart';

/// Location that corresponds to using an io-server for the backend
const NetworkClient = 'network';

/// The socket IO implementation of [GameClient]
class IOGameClient extends GameClient {
  IOGameClient({
    required this.address,
    required this.ref,
  });
  final ProviderRef<GameClient> ref;

  final GameAddress address;

  /// Disconnect from the backend
  ///
  /// Default implementation does nothing
  @override
  Future<void> disconnect() async {
    ref.read(GameProviders.connected.notifier).state = false;
  }

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
  Future<ApiResponse<ExitGameResponse>> exitGame(ExitGameRequest request) {
    // TODO: implement exitGame
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
}

final socketIOGameServerClient = Provider<GameClient>(
  (ref) {
    final client = IOGameClient(
      address: ref.watch(GameProviders.remoteUri),
      ref: ref,
    );
    return client;
  },
  name: 'socketIOGameServerClient',
  dependencies: [GameProviders.remoteUri],
);
