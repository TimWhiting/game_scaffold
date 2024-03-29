import 'package:logging/logging.dart';

import '../../core.dart';
import '../core.dart';

typedef ClientType = String;

typedef GameAddress = Uri;

/// A Client that can contact the server to manage games
///
/// The client can
/// * Start
/// * Delete
/// * Get Game Info
/// * Get List of Games
abstract class GameClient {
  GameClient() : logger = Logger('GameClient');

  final Logger logger;

  /// Creates a game on the server
  Future<GameCode> createGame(PlayerID playerID, GameConfig config);

  /// Deletes the game on the server
  Future<bool> deleteGame(PlayerID playerID, GameCode code);

  /// Gets a list of games on the server
  Future<IList<GameInfo>> getGames(PlayerID playerID);

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
