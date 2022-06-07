import 'dart:async';

import 'package:logging/logging.dart';
import '../../../game_scaffold_dart.dart';
import '../core.dart';

/// A client for a particular game
abstract class RoundClient {
  RoundClient() : logger = Logger('RoundClient');

  final Logger logger;

  /// Causes the client to exit the game
  Future<bool> exitGame(PlayerID playerID, GameCode code);

  /// Registers the client with the game server
  Future<PlayerName?> joinGame(
    PlayerID playerID,
    GameCode code,
    PlayerName name,
  );

  /// Sends [event] to the game server
  Future<bool> sendEvent(PlayerID playerID, GameCode code, Event event);

  /// Sends a start event to the game server
  Future<bool> startGame(PlayerID playerID, GameCode code);

  /// Sends an undo event to the game server
  Future<bool> undo(PlayerID playerID, GameCode code) => sendEvent(
        playerID,
        code,
        const GenericEvent.undo().asGameEvent,
      );

  /// Sends a new round event to the game server
  Future<bool> newRound(PlayerID playerID, GameCode code) => sendEvent(
        playerID,
        code,
        GenericEvent.readyNextRound(playerID).asGameEvent,
      );

  /// Sends a message event to the game server
  Future<bool> sendMessage(PlayerID playerID, GameCode code, String message) =>
      sendEvent(
        playerID,
        code,
        GenericEvent.message(message, from: playerID, to: null).asGameEvent,
      );

  /// Disposes of the game client
  void dispose();

  Stream<GameOrError> gameStream(PlayerID playerID, GameCode code);

  Stream<GameInfo> gameLobby(PlayerID playerID, GameCode code);
}
