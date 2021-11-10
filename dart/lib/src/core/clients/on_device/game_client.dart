import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../../backend.dart';
import '../../client.dart';
import '../../core.dart';
import '../clients.dart';

/// An implementation of a [GameClient] for a local game on device with no server connection
///
/// Warning implementation not complete or tested yet
class NoServerGameClient extends GameClient {
  NoServerGameClient();
  @override
  Future<bool> exitGame(PlayerID playerID, GameCode code) async => true;

  @override
  Future<String?> joinGame(
      PlayerID playerID, GameCode code, PlayerName name) async {
    final backendReader = NoServerClient.games[code]!.container.read;

    final notifier = backendReader(BackendProviders.lobby.notifier);
    await Future.delayed(const Duration(microseconds: 1));
    notifier.addPlayer(Player(playerID, name: name));

    final lobby = backendReader(BackendProviders.lobby);
    final config = lobby.config;
    final players = lobby.players;
    if (players.length == config.maxPlayers && config.autoStart) {
      scheduleMicrotask(() {
        startGame(playerID, code).ignore();
      });
    }

    return name;
  }

  @override
  Future<bool> startGame(PlayerID playerID, GameCode code) async {
    final backendReader = NoServerClient.games[code]!.container.read;
    backendReader(BackendProviders.state);
    return true;
  }

  @override
  Stream<GameInfo> gameLobby(PlayerID playerID, GameCode code) {
    final backend = NoServerClient.games[code]!.container;
    backend.read(BackendProviders.lobby);
    return backend.read(BackendProviders.playerLobby(playerID).stream);
  }

  @override
  Stream<GameOrError> gameStream(PlayerID playerID, GameCode code) {
    logger.info('Watching backend');
    final backendReader = NoServerClient.games[code]!.container;
    return backendReader.read(BackendProviders.state.notifier).stream;
  }

  @override
  Future<bool> sendEvent(PlayerID playerID, GameCode code, Event event) async {
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    final backendReader = NoServerClient.games[code]!.container;
    // If the gameClient is initializing
    // we cannot edit the backend provider synchronously
    await Future.delayed(const Duration(microseconds: 1));
    final result = backendReader
        .read(BackendProviders.state.notifier)
        .handleEvent(event.asGameEvent);
    return result;
  }

  @override
  void dispose() {
    logger.info('Disposing game client');
  }
}

final onDeviceGameClient = Provider<GameClient>((ref) {
  final client = NoServerGameClient();
  ref.onDispose(client.dispose);
  return client;
});
