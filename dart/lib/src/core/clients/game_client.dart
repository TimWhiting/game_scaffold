import 'dart:async';

import 'package:riverpod/all.dart';

import '../core.dart';

/// A client with client identifier [id] for a particular game identified by [gameCode]
abstract class GameClient {
  GameClient(this.id, this.gameCode, this.read);

  /// The client's [id]
  final String id;

  /// The [gameCode] of the game the client has joined
  final String gameCode;

  final Reader read;

  /// Causes the client to exit the game
  void exitGame();

  /// Registers the client with the game server
  Future<void> register();

  /// Sends [event] to the game server
  void sendEvent(Event event);

  /// Sends a start event to the game server
  void startGame() => sendEvent(const GenericEvent.start().asGameEvent);

  /// Sends an undo event to the game server
  void undo() => sendEvent(const GenericEvent.undo().asGameEvent);

  /// Sends a new round event to the game server
  void newRound() => sendEvent(GenericEvent.readyNextRound(id).asGameEvent);

  /// Sends a message event to the game server
  void sendMessage(String message) =>
      sendEvent(GenericEvent.message(message, from: id, to: null).asGameEvent);

  /// Disposes of the game client
  void dispose();

  /// Registers a [GameClient] implementation for the given [GameServerLocation]
  static void registerImplementation<T extends GameClient>(
    String loc,
    T Function(Reader read, String address, String id, String gameCode) impl,
  ) {
    _clientImplementations[loc] = impl;
  }

  static final Map<String, GameClient Function(Reader, String, String, String)>
      _clientImplementations = {};

  /// Creates a [GameClient] with the parameters specified
  static GameClient fromParams({
    String location,
    Reader read,
    String address,
    String id,
    String gameCode,
  }) {
    final impl = _clientImplementations[location];
    if (impl == null) {
      throw UnimplementedError(
          'No ServerClient implementation for $location defined');
    }
    return impl(read, address, id, gameCode);
  }
}
