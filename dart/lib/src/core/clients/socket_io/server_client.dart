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
    required this.ref,
  }) {
    Future.delayed(const Duration(milliseconds: 10), connect);
  }
  final ProviderRef<ServerClient> ref;

  final GameAddress address;
  late final IO.Socket socket = IO.io(address.toString(), socketIOOpts);

  @override
  Future<GameCode> createGame(PlayerID playerID, GameConfig config) async {
    logger.fine('Creating game $config');
    final gameCode = await _createGame(config);
    return gameCode;
  }

  Future<GameCode> _createGame(GameConfig config) async {
    final result = await socket.call(IOChannel.creategame, config.toJson());
    return result as GameCode;
  }

  @override
  Future<bool> deleteGame(PlayerID playerID, GameCode gameCode) async {
    final result = await socket
        .call(IOChannel.deletegame, {'code': gameCode, 'playerID': playerID});
    return result as bool;
  }

  @override
  Future<IList<GameInfo>> getGames(PlayerID playerID) async {
    final result = await socket.call(IOChannel.getgames, playerID);
    return (json.decode(result as String) as List<dynamic>)
        .map((v) => GameInfo.fromJson(v as Map<String, dynamic>))
        .toIList();
  }

  @override
  void dispose() {
    disconnect();
    logger.info('Dispose');
    socket.dispose();
  }

  /// Connects to the backend
  @override
  Future<void> connect() async {
    logger.info('Connecting, to $address');
    socket.on(IOChannel.connection.string, (_) {
      ref.read(GameProviders.connected.notifier).state = true;
    });
    socket.on(IOChannel.disconnect.string, (_) {
      ref.read(GameProviders.connected.notifier).state = false;
    });
    if (socket.connected) {
      ref.read(GameProviders.connected.notifier).state = true;
    }
    logger.info('Created ServerClient');
  }

  /// Disconnect from the backend
  ///
  /// Default implementation does nothing
  @override
  Future<void> disconnect() async {
    socket.dispose();
    ref.read(GameProviders.connected.notifier).state = false;
  }
}

final socketIOGameServerClient = Provider<ServerClient>(
  (ref) {
    final client = IOServerClient(
      address: ref.watch(GameProviders.remoteUri),
      ref: ref,
    );
    ref.onDispose(client.dispose);
    return client;
  },
  name: 'socketIOGameServerClient',
  dependencies: [GameProviders.remoteUri, GameProviders.connected.notifier],
);
