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
  Future<bool> sendEvent<E extends Event>(
      PlayerID playerID, GameCode code, E event);

  /// Sends a new round event to the game server
  Future<bool> newRound(PlayerID playerID, GameCode code) => sendEvent(
        playerID,
        code,
        GenericEvent.readyNextRound(playerID),
      );

  Stream<GameState> gameStream(PlayerID playerID, GameCode code);
  Stream<GameError> errorStream(PlayerID playerID, GameCode code);
  Stream<GameInfo> gameLobby(PlayerID playerID, GameCode code);

  /// Sends a start request to the game server
  Future<bool> startGame(PlayerID playerID, GameCode code);

  /// Disposes of the [RoundService] (i.e. disconnects from the server)
  void dispose() {
    sc.close();
  }

  /// Connects to the backend
  ///
  /// Default implementation does nothing
  Stream<bool> connect() async* {
    yield true;
    yield* sc.stream;
  }

  StreamController<bool> sc = StreamController<bool>.broadcast();

  /// Disconnect from the backend
  ///
  /// Default implementation does nothing
  Future<void> disconnect() async {
    sc.add(false);
  }
}
