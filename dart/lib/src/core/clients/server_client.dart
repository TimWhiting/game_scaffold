import 'package:riverpod/all.dart';

import '../core.dart';

/// A Client that can contact the server to manage games
///
/// Can
/// * Start
/// * Delete
/// * Get Game Info
/// * Get List of Games that [playerID] is a part of
///
///
abstract class ServerClient {
  ServerClient(this.read, this.playerID);

  /// The id of the client
  final String playerID;

  /// The gameCode for the game that was created
  String gameCode;

  final Reader read;

  /// Connects this client to the server
  void connect();

  /// Creates a game on the server
  Future<void> createGame();

  /// Deletes the game on the server
  Future<bool> deleteGame();

  /// Gets a list of games on the server
  Future<List<GameInfo>> getGames();

  /// Gets info about a particular game from the server
  Future<void> getGameInfo(String gameId);

  /// Disposes of the [ServerClient]
  void dispose();

  /// Disconnects from the server
  void disconnect();

  /// Registers a particular implementation of [ServerClient] for the given [GameServerLocation]
  static void registerImplementation<T extends ServerClient>(
    String loc,
    T Function(Reader, String, String) impl,
  ) {
    _clientImplementations[loc] = impl;
  }

  static final Map<String, ServerClient Function(Reader, String, String)>
      _clientImplementations = {};

  /// Creates a [ServerClient] from the [location] [address] and [playerID]
  static ServerClient fromParams({
    String location,
    Reader read,
    String address,
    String playerID,
  }) {
    final impl = _clientImplementations[location];
    if (impl == null) {
      throw UnimplementedError(
          'No ServerClient implementation for $location defined');
    }
    return impl(read, address, playerID);
  }
}
