import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import '../../core.dart';
part 'game_client.freezed.dart';
part 'game_client.g.dart';

typedef ClientType = String;

typedef GameAddress = Uri;

/// A Client that can contact the server to manage games
///
/// The client can
/// * Start
/// * Delete
/// * Get Game Info
/// * Get List of Games that [playerID] is a part of
abstract class GameClient {
  GameClient() : logger = Logger('ServerClient');

  final Logger logger;

  /// Creates a game on the server
  Future<ApiResponse<CreateGameResponse>> createGame(CreateGameRequest request);

  /// Deletes the game on the server
  Future<ApiResponse<DeleteGameResponse>> deleteGame(DeleteGameRequest request);

  /// Updates the game parameters
  Future<ApiResponse<UpdateConfigResponse>> updateConfig(UpdateConfigRequest request);

  /// Gets a list of games on the server
  Future<ApiResponse<ListGamesResponse>> listGames(ListGamesRequest request);

  /// Registers the client with the game server
  Future<ApiResponse<JoinGameResponse>> joinGame(JoinGameRequest request);

  /// Sends a start event to the game server
  Future<ApiResponse<StartGameResponse>> startGame(StartGameRequest request);

  /// Watches for changes to the overall game metadata which is valid also before the game starts
  Stream<ApiResponse<WatchLobbyResponse>> gameLobby(WatchLobbyRequest request);

  /// Sends [event] to the game server
  Future<ApiResponse<SendEventResponse>> sendEvent(SendEventRequest event);

  /// Watches the game state
  Stream<ApiResponse<WatchGameResponse>> gameStream(WatchGameRequest request);

  /// Sends an undo event to the game server
  Future<ApiResponse<SendEventResponse>> undo(PlayerID playerID, GameCode code) =>
      sendEvent(SendEventRequest(playerID: playerID, code: code, event: const Event.undo()));

  /// Sends a new round event to the game server
  Future<ApiResponse<SendEventResponse>> newRound(PlayerID playerID, GameCode code) =>
      sendEvent(SendEventRequest(playerID: playerID, code: code, event: Event.readyNextRound(playerID)));

  /// Sends a message event to the game server
  Future<ApiResponse<SendEventResponse>> sendMessage(PlayerID playerID, GameCode code, String message) => sendEvent(
      SendEventRequest(playerID: playerID, code: code, event: Event.message(message, from: playerID, to: null)));
}

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  // ignore: invalid_annotation_target
  const factory ApiResponse.success(T success) = _ApiResponse<T>;
  // ignore: invalid_annotation_target
  const factory ApiResponse.error(String error) = _Error<T>;
  factory ApiResponse.fromJson(Map<String, dynamic> map, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(map, fromJsonT);
}

@Freezed(maybeMap: false, maybeWhen: false)
class GameServiceRequest with _$GameServiceRequest {
  const factory GameServiceRequest.createGame({required AuthID authID, required GameConfig config}) = CreateGameRequest;
  const factory GameServiceRequest.updateConfig({required PlayerID playerID, required GameConfig config}) =
      UpdateConfigRequest;
  const factory GameServiceRequest.deleteGame({required PlayerID playerID, required GameCode code}) = DeleteGameRequest;
  const factory GameServiceRequest.listGames({required AuthID authID}) = ListGamesRequest;
  const factory GameServiceRequest.joinGame({required AuthID authID, required GameCode code}) = JoinGameRequest;
  const factory GameServiceRequest.startGame({required PlayerID playerID, required GameCode code}) = StartGameRequest;
  const factory GameServiceRequest.watchLobby({required PlayerID playerID, required GameCode code}) = WatchLobbyRequest;
  const factory GameServiceRequest.sendEvent({
    required PlayerID playerID,
    required GameCode code,
    required Event event,
  }) = SendEventRequest;
  const factory GameServiceRequest.watchGame({
    required PlayerID playerID,
    required GameCode code,
  }) = WatchGameRequest;

  factory GameServiceRequest.fromJson(Map<String, dynamic> map) => _$GameServiceRequestFromJson(map);
}

@Freezed(maybeMap: false, maybeWhen: false)
class GameServiceResponse with _$GameServiceResponse {
  const factory GameServiceResponse.createGame({required PlayerID playerID, required GameCode code}) =
      CreateGameResponse;
  const factory GameServiceResponse.updateConfig() = UpdateConfigResponse;
  const factory GameServiceResponse.deleteGame() = DeleteGameResponse;
  const factory GameServiceResponse.listGames({required IList<GameInfo> games}) = ListGamesResponse;
  const factory GameServiceResponse.joinGame({required PlayerID playerID}) = JoinGameResponse;
  const factory GameServiceResponse.startGame() = StartGameResponse;
  const factory GameServiceResponse.watchLobby({required GameInfo gameInfo}) = WatchLobbyResponse;
  const factory GameServiceResponse.sendEvent() = SendEventResponse;
  const factory GameServiceResponse.watchGame({required Game game}) = WatchGameResponse;

  factory GameServiceResponse.fromJson(Map<String, dynamic> map) => _$GameServiceResponseFromJson(map);
}
