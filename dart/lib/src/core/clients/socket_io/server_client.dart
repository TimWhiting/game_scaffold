import 'dart:async';
import 'dart:convert';

import 'package:riverpod/riverpod.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../client.dart';
import '../../core.dart';
import '../providers.dart';
import '../server_client.dart';
import 'channels.dart';

/// The socket IO implementation of [ServerClient]
class IOServerClient extends ServerClient {
  IOServerClient({
    required this.address,
  }) {
    Future.delayed(const Duration(milliseconds: 10), connect);
  }

  final GameAddress address;
  IO.Socket? socket;

  @override
  Future<GameCode> createGame(PlayerID playerID, GameConfig config) async {
    logger.fine('Creating game $config');
    final gameCode = await _createGame(config);
    return gameCode;
  }

  Future<GameCode> _createGame(GameConfig config) async {
    await _ensureConnected();
    final result = await socket!.call(IOChannel.creategame, config.toJson());
    return result as GameCode;
  }

  @override
  Future<bool> deleteGame(PlayerID playerID, GameCode gameCode) async {
    await _ensureConnected();
    final result = await socket!
        .call(IOChannel.deletegame, {'code': gameCode, 'playerID': playerID});
    return result as bool;
  }

  @override
  Future<IList<GameInfo>> getGames(PlayerID playerID) async {
    await _ensureConnected();
    final result = await socket!.call(IOChannel.getgames, playerID);
    return (json.decode(result as String) as List<dynamic>)
        .map((v) => GameInfo.fromJson(v as Map<String, dynamic>))
        .toIList();
  }

  @override
  void dispose() {
    logger.info('Dispose');
    socket?.dispose();
  }

  Future<void> _ensureConnected() async {
    await connect();
  }

  /// Connects to the backend
  @override
  Future<void> connect() async {
    final completer = Completer<void>();
    scheduleMicrotask(() async {
      logger.info('Connecting, old uri was: ${socket?.io.uri}');
      if ((socket?.connected ?? true) ||
          Uri.parse(socket?.io.uri ?? '') != address) {
        socket?.dispose();
        socket = IO.io(address.toString(), socketIOOpts);
        socket!.on(
          IOChannel.connection.string,
          (_) => gameStatus = GameStatus.NotJoined,
        );
        socket!.on(
          IOChannel.disconnect.string,
          (_) => gameStatus = GameStatus.NotConnected,
        );
        await Future.delayed(const Duration(milliseconds: 20));
        final currentStatus = gameStatus;
        if (currentStatus == GameStatus.NotConnected ||
            currentStatus == GameStatus.NotJoined) {
          scheduleMicrotask(
            () => gameStatus = socket!.connected
                ? GameStatus.NotJoined
                : GameStatus.NotConnected,
          );
        }
      }
      completer.complete();
    });

    logger.info('Created ServerClient');
    return completer.future;
  }

  /// Disconnect from the backend
  ///
  /// Default implementation does nothing
  @override
  Future<void> disconnect() async {
    socket?.dispose();
    gameStatus = GameStatus.NotConnected;
  }
}

final socketIOGameServerClient = Provider((ref) {
  final client = IOServerClient(
    address: ref.watch(GameProviders.remoteUri),
  );
  ref.onDispose(client.dispose);
  return client;
});
