import 'dart:async';

import 'package:logging/logging.dart';

import '../../core.dart';

typedef ServiceType = String;

typedef GameAddress = Uri;

/// A Client that can contact the server to manage games
///
/// The client can
/// * Start
/// * Delete
/// * Get Game Info
/// * Get List of Games
mixin GameService {
  final Logger logger = Logger('GameClient');

  /// Creates a game on the server
  Future<GameCode> createGame(PlayerID playerID, GameConfig config);

  /// Deletes the game on the server
  Future<bool> deleteGame(PlayerID playerID, GameCode code);

  /// Gets a list of games on the server
  Future<IList<GameInfo>> getGames(PlayerID playerID);

  /// Registers the client with the game server
  Future<PlayerName?> joinGame(
    PlayerID playerID,
    GameCode code,
    PlayerName name,
  );

  /// Disposes of the [GameService] (i.e. disconnects from the server)
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
