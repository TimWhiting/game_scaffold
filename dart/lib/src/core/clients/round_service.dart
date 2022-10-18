import 'dart:async';

import 'package:logging/logging.dart';
import '../../../game_scaffold_dart.dart';
import '../core.dart';

/// A client for a particular game
abstract class RoundService {
  RoundService() : logger = Logger('RoundClient');

  final Logger logger;

  /// Causes the client to exit the game
  Future<bool> exitGame(PlayerID playerID, GameCode code);

  /// Sends [event] to the game server
  Future<bool> sendEvent<E extends Object>(
      PlayerID playerID, GameCode code, E event);

  /// Sends an undo event to the game server
  Future<bool> undo(PlayerID playerID, GameCode code) => sendEvent(
        playerID,
        code,
        const GenericEvent.undo(),
      );

  /// Sends a new round event to the game server
  Future<bool> newRound(PlayerID playerID, GameCode code) => sendEvent(
        playerID,
        code,
        GenericEvent.readyNextRound(playerID),
      );

  /// Sends a message event to the game server
  Future<bool> sendMessage(PlayerID playerID, GameCode code, String message) =>
      sendEvent(
        playerID,
        code,
        GenericEvent.message(message, from: playerID, to: null),
      );

  /// Disposes of the game client
  void dispose();

  Stream<GameState<T>> gameStream<T extends Object>(
      PlayerID playerID, GameCode code);
  Stream<GameError> errorStream(PlayerID playerID, GameCode code);
}
