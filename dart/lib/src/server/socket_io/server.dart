import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:stream/stream.dart';

//ignore: library_prefixes
import 'package:socket_io/socket_io.dart' as IO;

import '../../core.dart';
import '../../core/clients/socket_io/channels.dart';
import 'game_server.dart';

/// Options for server socket
final _serverSocketOpts = <String, dynamic>{
  'transports': ['websocket'],
};

class IOServer {
  final bool debug;
  final bool https;
  final String pathToPem;
  final String pathToRsa;
  final int port;
  final logger = Logger('IOServer');
  final io = IO.Server(options: _serverSocketOpts);
  final servers = <String, GameServer>{};
  final clients = <IO.Socket>{};

  /// Keeps track of a set of games that a client is a part of by client id
  final _clientGames = <String, Set<String>>{};
  IOServer({
    this.debug = false,
    this.https = false,
    this.pathToPem,
    this.pathToRsa,
    this.port,
  }) {
    final server = StreamServer();
    if (https) {
      assert(pathToPem != null);
      assert(pathToRsa != null);

      final security = SecurityContext()
        ..useCertificateChain(pathToPem)
        ..usePrivateKey(pathToRsa);
      server.startSecure(
        security,
        address: InternetAddress.anyIPv4,
        port: port ?? defaultGamePort,
      );
    } else {
      server.start(
        address: InternetAddress.loopbackIPv4,
        port: port ?? defaultGamePort,
      );
    }
    io.listen(server, _serverSocketOpts);
    io.on(
      IOChannel.connection.string,
      (client) => _handleClientConnection(client),
    );
    Logger.root.clearListeners();
    Logger.root.level = Level.FINE; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      if (record.loggerName.startsWith('socket_io')) {
        return;
      }
      print('[${record.level.name}]: ${record.loggerName} ${record.message}');
    });
  }

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
      IOChannel.creategame.string,
      (config) => _createGame(client, config),
    );
    client.on(
      IOChannel.getgames.string,
      (clientId) => _getGames(client, clientId),
    );
    client.on(
      IOChannel.getgameinfo.string,
      (id) => _getGameInfo(client, id),
    );

    client.on(
      IOChannel.deletegame.string,
      (id) => _deleteGame(client, id),
    );
  }

  void _getGameInfo(IO.Socket client, String id) {
    if (servers.containsKey(id)) {
      client.emit(IOChannel.gameinfo.string,
          servers[id].gameInfo(servers[id].clientID(client)).toJson());
    } else {
      client.emit(IOChannel.gameinfo.string, '404');
    }
  }

  void _clientDisconnect(IO.Socket client, dynamic reason) {
    clients.remove(client);
    logger.info('Client disconnected');
  }

  void _createGame(
    IO.Socket client,
    Map<String, dynamic> config,
  ) {
    logger.fine('Creating game');
    final gameConfig = GameConfig.fromJson(config);
    final gameid = generateGameID(servers.keys.toList());
    final container = ProviderContainer();
    container.read.backendGame(gameid).gameConfig = gameConfig;
    final server = GameServer(
        io, this, container.read.backendGame(gameid), gameid, servers.remove,
        debug: debug);
    servers[server.id] = server;
    client.emit(IOChannel.gamecreated.string, server.id);
  }

  Future<void> _deleteGame(IO.Socket client, String id) async {
    logger.info('Deleting game $id');
    servers[id].notifyKilled(client);
    await Future.delayed(2.seconds);
    servers[id].killGame();
  }

  void _getGames(IO.Socket client, String id) {
    if (_clientGames[id] == null) {
      client.emit(IOChannel.allgames.string, json.encode([]));
    } else {
      _updateGames(id, client);
    }
  }

  void _updateGames(String id, IO.Socket client) {
    logger.info('Getting all games for $id');
    final games = _clientGames[id];
    final gameInfo =
        games.map((g) => servers[g].gameInfo(id).toJson()).toList();
    client.emit(IOChannel.allgames.string, json.encode(gameInfo));
  }

  void addClientToGame(String id, String gameId) {
    if (_clientGames[id] == null) {
      _clientGames[id] = {};
    }
    _clientGames[id].add(gameId);
  }

  void removeClientFromGame(String id, String gameId) {
    _clientGames[id]?.remove(gameId);
  }
}
