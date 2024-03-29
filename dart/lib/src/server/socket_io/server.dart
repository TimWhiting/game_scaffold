import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
// ignore: import_of_legacy_library_into_null_safe, library_prefixes
import 'package:socket_io/socket_io.dart' as IO;
// ignore: import_of_legacy_library_into_null_safe
import 'package:stream/stream.dart';

import '../../core.dart';
import 'game_server.dart';

/// Options for server socket
final _serverSocketOpts = <String, dynamic>{
  'transports': ['websocket'],
};

class IOServer {
  IOServer({
    this.debug = false,
    this.https = false,
    String? pathToPem,
    String? pathToRsa,
    int port = defaultGamePort,
  }) {
    final server = StreamServer();
    if (https) {
      assert(pathToPem != null, 'Https requires pathToPem');
      assert(pathToRsa != null, 'Https requires pathToRsa');

      final security = SecurityContext()
        ..useCertificateChain(pathToPem!)
        ..usePrivateKey(pathToRsa!);
      server.startSecure(security,
          address: InternetAddress.anyIPv4, port: port);
    } else {
      server.start(address: InternetAddress.loopbackIPv4, port: port);
    }
    io.listen(server, _serverSocketOpts);
    io.on(
      IOChannel.connection.string,
      (c) => _handleClientConnection(c as IO.Socket),
    );
    Logger.root.clearListeners();
    Logger.root.level = Level.FINE; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      if (record.loggerName.startsWith('socket_io')) {
        return;
      }
      // ignore: avoid_print
      print('[${record.level.name}]: ${record.loggerName} ${record.message}');
    });
  }
  final bool debug;
  final bool https;
  final logger = Logger('IOServer');
  final io = IO.Server(options: _serverSocketOpts);
  final servers = <GameCode, GameServer>{};
  final clients = <IO.Socket>{};
  final container = ProviderContainer();

  /// Keeps track of a set of games that a client is a part of by client id
  final _clientGames = <PlayerID, Set<GameCode>>{};

  void _handleClientConnection(
    IO.Socket client,
  ) {
    logger.info('Client connected');
    clients.add(client);
    client.on(
      IOChannel.disconnect.string,
      (reason) => _clientDisconnect(client, reason),
    );
    client.on(
      IOChannel.createGame.string,
      (config) => _createGame(client, config as Map<String, dynamic>),
    );
    client.on(
      IOChannel.getGames.string,
      (clientId) => _getGames(client, clientId as String),
    );
    client.on(
      IOChannel.getGameInfo.string,
      (id) => _getGameInfo(client, id as String),
    );

    client.on(
      IOChannel.deleteGame.string,
      (id) => _deleteGame(client, id as String),
    );
  }

  void _getGameInfo(IO.Socket client, PlayerID id) {
    if (servers.containsKey(id)) {
      client.emit(IOChannel.gameInfo.string,
          servers[id]!.gameInfo(servers[id]!.clientID(client)).toJson());
    } else {
      client.emit(IOChannel.gameInfo.string, '404');
    }
  }

  void _clientDisconnect(IO.Socket client, reason) {
    clients.remove(client);
    logger.info('Client disconnected');
  }

  void _createGame(
    IO.Socket client,
    Map<String, dynamic> config,
  ) {
    logger.fine('Creating game');
    final gameConfig = GameConfig.fromJson(config, (_) => _);
    final gameID = generateGameID(servers.keys.toList());
    final scopedContainer = ProviderContainer();
    final lobby = scopedContainer.read(BackendProviders.lobby.notifier);
    lobby.setCode(gameID);
    lobby.setConfig(gameConfig);
    final server = GameServer(io, this, scopedContainer, gameID, servers.remove,
        debug: debug);
    servers[server.gameID] = server;
    client.emit(IOChannel.gameCreated.string, server.gameID);
  }

  Future<void> _deleteGame(IO.Socket client, GameCode id) async {
    logger.info('Deleting game $id');
    servers[id]!.notifyKilled(client);
    await Future.delayed(const Duration(seconds: 1));
    servers[id]!.killGame();
  }

  void _getGames(IO.Socket client, PlayerID id) {
    if (_clientGames[id] == null) {
      client.emit(IOChannel.allGames.string, json.encode([]));
    } else {
      _updateGames(id, client);
    }
  }

  void _updateGames(PlayerID id, IO.Socket client) {
    logger.info('Getting all games for $id');
    final games = _clientGames[id]!;
    final gameInfo =
        games.map((g) => servers[g]!.gameInfo(id).toJson()).toList();
    client.emit(IOChannel.allGames.string, json.encode(gameInfo));
  }

  void addClientToGame(PlayerID id, GameCode gameID) {
    if (_clientGames[id] == null) {
      _clientGames[id] = {};
    }
    _clientGames[id]!.add(gameID);
  }

  void removeClientFromGame(PlayerID id, GameCode gameID) {
    _clientGames[id]?.remove(gameID);
  }
}
