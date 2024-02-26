import 'dart:async';

import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../game_scaffold_dart.dart';

part 'round_service.g.dart';

@Riverpod(dependencies: [OnDeviceRoundService])
T roundService<T extends RoundService>(
  RoundServiceRef ref,
  PlayerID multiplayerID,
) {
  switch (ref.watch(serviceType)) {
    case OnDeviceService:
      return ref.watch(
          onDeviceRoundServiceProvider.notifier as ProviderListenable<T>);
    default:
      throw UnsupportedError('Unsupported service type');
  }
}

/// A client for a particular game
abstract class RoundService extends Notifier {
  RoundService() : logger = Logger('RoundClient');
  final services = <Type, RoundService>{};
  void registerService<T extends RoundService>(T service) {
    services[T] = service;
  }

  final Logger logger;

  /// Causes the client to exit the game
  Future<bool> exitGame(PlayerID playerID, GameCode code);

  /// Sends [event] to the game server
  Future<bool> sendEvent<E extends Event>(
      PlayerID playerID, GameCode code, E event);

  /// Sends a new round event to the game server
  Future<bool> newRound(PlayerID playerID, GameCode code) => sendEvent(
        playerID,
        code,
        GenericEvent.readyNextRound(playerID),
      );

  Stream<GameState> gameStream(PlayerID playerID, GameCode code);
  Stream<GameError> errorStream(PlayerID playerID, GameCode code);
  Stream<GameInfo> gameLobby(PlayerID playerID, GameCode code);

  /// Sends a start request to the game server
  Future<bool> startGame(PlayerID playerID, GameCode code);

  /// Disposes of the [RoundService] (i.e. disconnects from the server)
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
  Future<void> disconnect() async {
    sc.add(false);
  }
}
