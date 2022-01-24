import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import '../../core.dart';
import '../core.dart';
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

  /// Gets a list of games on the server
  Future<ApiResponse<ListGamesResponse>> listGames(ListGamesRequest request);

  /// Causes the client to exit the game
  Future<ApiResponse<ExitGameResponse>> exitGame(ExitGameRequest request);

  /// Registers the client with the game server
  Future<ApiResponse<JoinGameResponse>> joinGame(JoinGameRequest request);

  /// Sends a start event to the game server
  Future<ApiResponse<StartGameResponse>> startGame(StartGameRequest request);

  /// Watches for changes to the overall game metadata which is valid also before the game starts
  Stream<ApiResponse<WatchLobbyResponse>> gameLobby(WatchLobbyRequest request);

  /// Disposes of the [GameClient] (i.e. disconnects from the server)
  void dispose();

  /// Connects to the backend
  ///
  /// Default implementation does nothing
  Future<void> connect() async {}

  /// Disconnect from the backend
  ///
  /// Default implementation does nothing
  Future<void> disconnect() async {}
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
  const factory GameServiceRequest.deleteGame(
      {required PlayerID playerID, required AuthID authID, required GameCode code}) = DeleteGameRequest;
  const factory GameServiceRequest.listGames({required AuthID authID}) = ListGamesRequest;
  const factory GameServiceRequest.exitGame(
      {required PlayerID playerID, required AuthID authID, required GameCode code}) = ExitGameRequest;
  const factory GameServiceRequest.joinGame({required AuthID authID, required GameCode code}) = JoinGameRequest;

  const factory GameServiceRequest.startGame({required PlayerID playerID, required GameCode code}) = StartGameRequest;
  const factory GameServiceRequest.watchLobby(
      {required PlayerID playerID, required AuthID authID, required GameCode code}) = WatchLobbyRequest;

  factory GameServiceRequest.fromJson(Map<String, dynamic> map) => _$GameServiceRequestFromJson(map);
}

@Freezed(maybeMap: false, maybeWhen: false)
class GameServiceResponse with _$GameServiceResponse {
  const factory GameServiceResponse.createGame({required PlayerID playerID, required GameCode code}) =
      CreateGameResponse;
  const factory GameServiceResponse.deleteGame() = DeleteGameResponse;
  const factory GameServiceResponse.listGames({required IList<GameInfo> games}) = ListGamesResponse;
  const factory GameServiceResponse.exitGame() = ExitGameResponse;
  const factory GameServiceResponse.joinGame({required PlayerID playerID}) = JoinGameResponse;
  const factory GameServiceResponse.startGame() = StartGameResponse;
  const factory GameServiceResponse.watchLobby({required GameInfo gameInfo}) = WatchLobbyResponse;
  factory GameServiceResponse.fromJson(Map<String, dynamic> map) => _$GameServiceResponseFromJson(map);
}
