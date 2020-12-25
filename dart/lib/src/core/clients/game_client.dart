import 'dart:async';

import 'package:riverpod/all.dart';

import '../game.dart';
import 'providers.dart';

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
  void sendEvent(GameEvent event);

  /// Sends a start event to the game server
  void startGame() => sendEvent(const GeneralEvent.start().asGameEvent);

  /// Sends an undo event to the game server
  void undo() => sendEvent(const GeneralEvent.undo().asGameEvent);

  /// Sends a new round event to the game server
  void newRound() => sendEvent(GeneralEvent.readyNextRound(id).asGameEvent);

  /// Sends a message event to the game server
  void sendMessage(String message) =>
      sendEvent(GeneralEvent.message(message, from: id, to: null).asGameEvent);

  /// Disposes of the game client
  void dispose();

  /// Registers a [GameClient] implementation for the given [GameServerLocation]
  static void registerImplementation<T extends GameClient>(
    GameServerLocation loc,
    T Function(Reader read, String address, String id, String gameCode) impl,
  ) {
    _clientImplementations[loc] = impl;
  }

  static final Map<GameServerLocation,
          GameClient Function(Reader, String, String, String)>
      _clientImplementations = {};

  /// Creates a [GameClient] with the parameters specified
  static GameClient fromParams({
    GameServerLocation location,
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
