import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';

import '../../core.dart';
import '../core.dart';

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
  final String? playerID;
  GameReader get game => read!.gameFor(playerID!);

  final Reader? read;
  final Logger logger;

  /// Creates a game on the server
  Future<void> createGame();

  /// Deletes the game on the server
  Future<bool> deleteGame();

  /// Gets a list of games on the server
  Future<List<GameInfo>> getGames();

  /// Gets info about a particular game from the server
  Future<void> getGameInfo(String gameId);

  /// Disposes of the [ServerClient] (i.e. disconnects from the server)
  void dispose();

  /// Registers a particular implementation of [ServerClient] for the given [location]
  static void registerImplementation<T extends ServerClient>(
    String location,
    T Function(Reader?, String?, String?) impl,
  ) {
    _clientImplementations[location] = impl;
  }

  static final Map<String, ServerClient Function(Reader?, String?, String?)>
      _clientImplementations = {};

  /// Creates a [ServerClient] from the [location] [address] and [playerID]
  static ServerClient fromParams({
    String? location,
    Reader? read,
    String? address,
    String? playerID,
  }) {
    final impl = _clientImplementations[location!] as ServerClient Function(T Function<T>(RootProvider<Object, T>)?, String?, String?)?;
    if (impl == null) {
      throw UnimplementedError(
          'No ServerClient implementation for $location defined');
    }
    return impl(read as T Function<T>(RootProvider<Object, T>)?, address, playerID);
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
