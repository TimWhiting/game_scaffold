import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:rxdart/rxdart.dart';
import '../../../game_scaffold_dart.dart';
import '../core.dart';

/// A client for a particular game identified by [gameCode]
abstract class GameClient {
  GameClient(this.playerID, this.ref)
      : logger = Logger('GameClient $playerID'),
        read = ref.read;

  /// The client's [playerID]
  final PlayerID playerID;

  /// The [gameCode] of the game the client has joined
  GameCode get gameCode => read.gameFor(playerID).gameCode;
  final Logger logger;

  final ProviderRef<GameClient> ref;
  final Reader read;
  GameReader get game => read.gameFor(playerID);

  /// Causes the client to exit the game
  Future<bool> exitGame();

  /// Registers the client with the game server
  Future<bool> register();

  /// Sends [event] to the game server
  Future<bool> sendEvent(Event event);

  /// Sends a start event to the game server
  Future<bool> startGame() => sendEvent(const GenericEvent.start().asGameEvent);

  /// Sends an undo event to the game server
  Future<bool> undo() => sendEvent(const GenericEvent.undo().asGameEvent);

  /// Sends a new round event to the game server
  Future<bool> newRound() =>
      sendEvent(GenericEvent.readyNextRound(playerID).asGameEvent);

  /// Sends a message event to the game server
  Future<bool> sendMessage(String message) => sendEvent(
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
    T Function(
            ProviderRef<GameClient> ref, GameAddress address, PlayerID playerID)
        impl,
  ) {
    _clientImplementations[location] = impl;
  }

  static final Map<ServerLocation,
          GameClient Function(ProviderRef<GameClient>, GameAddress, PlayerID)>
      _clientImplementations = {};

  /// Creates a [GameClient] with the parameters specified
  static GameClient fromParams({
    required ServerLocation location,
    required ProviderRef<GameClient> ref,
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

  final BehaviorSubject<Game> gameStreamController = BehaviorSubject();
  Stream<Game> gameStream() => gameStreamController.stream;

  final BehaviorSubject<GameInfo> lobbyStreamController = BehaviorSubject();
  Stream<GameInfo> gameLobby() => lobbyStreamController.stream;

  final errorNotifier = GameErrorNotifier();
}
