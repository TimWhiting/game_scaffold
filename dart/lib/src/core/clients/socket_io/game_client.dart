import 'dart:async';

import 'package:riverpod/riverpod.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../game_scaffold_dart.dart';
import '../../core.dart';
import '../game_client.dart';
import '../providers.dart';
import 'channels.dart';

/// The socket IO implementation of [GameClient]
class IOGameClient extends GameClient {
  IOGameClient({
    required this.address,
    required GameCode code,
    required this.ref,
  }) {
    Future.delayed(
      const Duration(milliseconds: 100),
      () => _ensureConnected(code),
    );
  }
  final GameAddress address;
  final ProviderRef<GameClient> ref;

  IO.Socket? _socket;
  GameCode? _lastGameCode;
  // ignore: avoid_setters_without_getters
  set gameStatus(GameStatus status) {
    ref.read(GameProviders.status.notifier).state = status;
  }

  Future<void> _ensureConnected(GameCode code) async {
    if (code != _lastGameCode || (_socket?.disconnected ?? true)) {
      _socket?.dispose();
      _socket = IO.io('$address/$code', socketIOOpts);
      logger.info('Created Game Client Socket $code');
      _lastGameCode = code;
    }
  }

  @override
  Future<bool> exitGame(PlayerID playerID, GameCode code) async {
    _socket!.off(IOChannel.gamestate.string);
    _socket!.off(IOChannel.lobby.string);
    logger.info('Exiting game');
    // gameStatus = GameStatus.NotJoined;
    return true;
  }

  @override
  Future<PlayerName> joinGame(
      PlayerID playerID, GameCode code, PlayerName name) async {
    await _ensureConnected(code);
    logger.info('Registering');
    final assignedName = await _socket!
        .call(IOChannel.register, {'name': name, 'id': playerID}) as String?;
    if (assignedName != null) {
      return assignedName;
    }
    return name;
  }

  @override
  Stream<GameInfo> gameLobby(PlayerID playerID, GameCode code) async* {
    final sc = StreamController<GameInfo>();
    _socket!.on(IOChannel.lobby.string, (d) {
      final gameInfo = GameInfo.fromJson(d as Map<String, dynamic>);
      sc.add(gameInfo);
      logger.info('Got Lobby $gameInfo');
    });

    yield* sc.stream;
    await sc.close();
  }

  @override
  Stream<GameOrError> gameStream(PlayerID playerID, GameCode code) async* {
    final sc = StreamController<GameOrError>();
    _socket!.on(IOChannel.gamestate.string, (data) {
      _socket!.off(IOChannel.lobby.string);
      print('game or error $data');
      final gameState = GameOrError.fromJson(data as Map<String, dynamic>);
      logger.info('Got gamestate $data');
      sc.add(gameState);
    });

    yield* sc.stream;
    await sc.close();
  }

  @override
  Future<bool> sendEvent(PlayerID playerID, GameCode code, Event event) async {
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    final result = await _socket!.call(IOChannel.event, js);
    return result as bool;
  }

  @override
  void dispose() {
    logger.info('Dispose');
    _socket!.dispose();
  }

  @override
  Future<bool> startGame(PlayerID playerID, GameCode code) async {
    final result = await _socket!
        .call(IOChannel.startgame, {'playerID': playerID, 'code': code});
    return result as bool;
  }
}

final socketIOGameClient = Provider<GameClient>(
  (ref) {
    final client = IOGameClient(
      code: ref.read(GameProviders.code),
      address: ref.watch(GameProviders.remoteUri),
      ref: ref,
    );
    ref.onDispose(() {
      client.exitGame(
        ref.read(GameProviders.playerID),
        ref.read(GameProviders.code),
      );
      client.dispose();
    });
    return client;
  },
  name: 'socketIOGameClient',
  dependencies: [
    GameProviders.remoteUri,
    GameProviders.code,
    GameProviders.playerID,
  ],
);
