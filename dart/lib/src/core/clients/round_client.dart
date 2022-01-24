import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import '../../../game_scaffold_dart.dart';
part 'round_client.freezed.dart';
part 'round_client.g.dart';

/// A client for a particular game
abstract class RoundClient {
  RoundClient() : logger = Logger('GameClient');

  final Logger logger;

  /// Sends [event] to the game server
  Future<ApiResponse<SendEventResponse>> sendEvent(SendEventRequest event);

  /// Watches the game state
  Stream<ApiResponse<WatchGameResponse>> gameStream(WatchGameRequest request);

  /// Sends an undo event to the game server
  Future<ApiResponse<SendEventResponse>> undo(PlayerID playerID, GameCode code) =>
      sendEvent(SendEventRequest(playerID: playerID, code: code, event: const GenericEvent.undo().asGameEvent));

  /// Sends a new round event to the game server
  Future<ApiResponse<SendEventResponse>> newRound(PlayerID playerID, GameCode code) => sendEvent(
      SendEventRequest(playerID: playerID, code: code, event: GenericEvent.readyNextRound(playerID).asGameEvent));

  /// Sends a message event to the game server
  Future<ApiResponse<SendEventResponse>> sendMessage(PlayerID playerID, GameCode code, String message) =>
      sendEvent(SendEventRequest(
          playerID: playerID, code: code, event: GenericEvent.message(message, from: playerID, to: null).asGameEvent));

  /// Disposes of the game client
  void dispose();
}

@Freezed(genericArgumentFactories: true)
class RoundServiceRequest<T extends Event> with _$RoundServiceRequest<T> {
  const factory RoundServiceRequest.sendEvent({
    required PlayerID playerID,
    required GameCode code,
    required T event,
  }) = SendEventRequest<T>;
  const factory RoundServiceRequest.watchGame({
    required PlayerID playerID,
    required GameCode code,
  }) = WatchGameRequest;
  factory RoundServiceRequest.fromJson(Map<String, dynamic> map, T Function(Object?) fromJsonT) =>
      _$RoundServiceRequestFromJson(map, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
class RoundServiceResponse<T extends Game> with _$RoundServiceResponse {
  const factory RoundServiceResponse.sendEvent() = SendEventResponse;
  const factory RoundServiceResponse.watchGame({required T game}) = WatchGameResponse<T>;

  factory RoundServiceResponse.fromJson(Map<String, dynamic> map, T Function(Object?) fromJsonT) =>
      _$RoundServiceResponseFromJson(map, fromJsonT);
}
