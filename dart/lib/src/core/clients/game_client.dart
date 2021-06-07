import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';

import '../../../game_scaffold_dart.dart';
import '../core.dart';

/// A client for a particular game identified by [gameCode]
abstract class GameClient {
  GameClient(this.playerID, this.read)
      : logger = Logger('GameClient $playerID');

  /// The client's [playerID]
  final PlayerID playerID;

  /// The [gameCode] of the game the client has joined
  GameCode get gameCode => read.gameFor(playerID).gameCode;
  final Logger logger;

  final Reader read;
  GameReader get game => read.gameFor(playerID);

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
  void newRound() =>
      sendEvent(GenericEvent.readyNextRound(playerID).asGameEvent);

  /// Sends a message event to the game server
  void sendMessage(String message) => sendEvent(
      GenericEvent.message(message, from: playerID, to: null).asGameEvent);

  /// Disposes of the game client
  @mustCallSuper
  void dispose() {
    gameStreamController.close();
    lobbyStreamController.close();
  }

  /// Registers a [GameClient] implementation for the given [location]
  static void registerImplementation<T extends GameClient>(
    ServerLocation location,
    T Function(Reader read, GameAddress address, PlayerID playerID) impl,
  ) {
    _clientImplementations[location] = impl;
  }

  static final Map<ServerLocation,
          GameClient Function(Reader, GameAddress, PlayerID)>
      _clientImplementations = {};

  /// Creates a [GameClient] with the parameters specified
  static GameClient fromParams({
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

  final StreamController<Game> gameStreamController =
      StreamController.broadcast();
  Stream<Game> gameStream() => gameStreamController.stream;

  final StreamController<GameInfo> lobbyStreamController =
      StreamController.broadcast();
  Stream<GameInfo> gameLobby() => lobbyStreamController.stream;

  final errorNotifier = GameErrorNotifier();
}
