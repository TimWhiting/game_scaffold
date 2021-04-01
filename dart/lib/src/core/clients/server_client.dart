import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';

import '../../core.dart';
import '../core.dart';

typedef ServerLocation = String;
// TODO: Make this a URI
typedef GameAddress = String;
/// A Client that can contact the server to manage games
///
/// The client can
/// * Start
/// * Delete
/// * Get Game Info
/// * Get List of Games that [playerID] is a part of
abstract class ServerClient {
  ServerClient(this.read, this.playerID)
      : logger = Logger('ServerClient $playerID');

  /// The id of the client
  final PlayerID playerID;
  GameReader get game => read.gameFor(playerID);

  final Reader read;
  final Logger logger;

  /// Creates a game on the server
  Future<void> createGame();

  /// Deletes the game on the server
  Future<bool> deleteGame();

  /// Gets a list of games on the server
  Future<IList<GameInfo>> getGames();

  /// Gets info about a particular game from the server
  Future<void> getGameInfo(String gameId);

  /// Disposes of the [ServerClient] (i.e. disconnects from the server)
  void dispose();

  /// Registers a particular implementation of [ServerClient] for the given [location]
  static void registerImplementation<T extends ServerClient>(
    ServerLocation location,
    T Function(Reader, GameAddress, PlayerID) impl,
  ) {
    _clientImplementations[location] = impl;
  }

  static final Map<ServerLocation, ServerClient Function(Reader, GameAddress, PlayerID)>
      _clientImplementations = {};

  /// Creates a [ServerClient] from the [location] [address] and [playerID]
  static ServerClient fromParams({
    required ServerLocation location,
    required Reader read,
    required GameAddress address,
    required PlayerID playerID,
  }) {
    final impl = _clientImplementations[location];
    if (impl == null) {
      throw UnimplementedError(
          'No ServerClient implementation for $location defined');
    }
    return impl(read, address, playerID);
  }

  /// Connects to the backend
  ///
  /// Default implementation does nothing
  Future<void> connect() async {}

  /// Disconnect from the backend
  ///
  /// Default implementation does nothing
  Future<void> disconnect() async {}
}
