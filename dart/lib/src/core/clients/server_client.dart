import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';

import '../../core.dart';
import '../core.dart';

typedef ServerLocation = String;

typedef GameAddress = Uri;

/// A Client that can contact the server to manage games
///
/// The client can
/// * Start
/// * Delete
/// * Get Game Info
/// * Get List of Games that [playerID] is a part of
abstract class ServerClient {
  ServerClient(this.ref, this.playerID)
      : logger = Logger('ServerClient $playerID'),
        read = ref.read;

  /// The id of the client
  final PlayerID playerID;
  GameReader get game => read.gameFor(playerID);

  final ProviderRef<ServerClient> ref;
  final Reader read;
  final Logger logger;

  /// Creates a game on the server
  Future<void> createGame();

  /// Deletes the game on the server
  Future<bool> deleteGame();

  /// Gets a list of games on the server
  Future<IList<GameInfo>> getGames();

  /// Disposes of the [ServerClient] (i.e. disconnects from the server)
  void dispose();

  /// Registers a particular implementation of [ServerClient] for the given [location]
  static void registerImplementation<T extends ServerClient>(
    ServerLocation location,
    T Function(ProviderRef<ServerClient>, GameAddress, PlayerID) impl,
  ) {
    _clientImplementations[location] = impl;
  }

  static final Map<
          ServerLocation,
          ServerClient Function(
              ProviderRef<ServerClient>, GameAddress, PlayerID)>
      _clientImplementations = {};

  /// Creates a [ServerClient] from the [location] [address] and [playerID]
  static ServerClient fromParams({
    required ServerLocation location,
    required ProviderRef<ServerClient> ref,
    required GameAddress address,
    required PlayerID playerID,
  }) {
    final impl = _clientImplementations[location];
    if (impl == null) {
      throw UnimplementedError(
          'No ServerClient implementation for $location defined');
    }
    return impl(ref, address, playerID);
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
