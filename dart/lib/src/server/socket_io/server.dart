import 'dart:convert';
import 'dart:io';

import 'package:game_scaffold_dart/src/core/clients/socket_io/channels.dart';
import 'package:logging/logging.dart';
import 'package:stream/stream.dart';

//ignore: library_prefixes
import 'package:socket_io/socket_io.dart' as IO;

import '../../core.dart';
import '../../core/backend.dart';
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
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      print('[${record.level.name}]: ${record.message}');
    });

    io.on(IOChannel.connection.string, _handleClientConnection);
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
          GameInfo(id, [], '', false, servers[id].gameType).toJson());
    } else {
      client.emit(IOChannel.gameinfo.string, '404');
    }
  }

  void _clientDisconnect(IO.Socket client, dynamic reason) {
    clients.remove(client);
    logger.info('Client disconnected from main room $reason');
  }

  void _createGame(
    IO.Socket client,
    Map<String, dynamic> config,
  ) {
    logger.info('creating game');
    final gameConfig = GameConfig.fromJson(config);
    var gameid = '';
    while (gameid.length != 4 || servers.keys.contains(gameid)) {
      gameid =
          'BCDFGHJKLMNPQRSTVWXZ'.characters.shuffled().join('').substring(0, 4);
    }
    final container = ProviderContainer();
    container.read(gameConfigProvider).state = gameConfig;
    final server = GameServer(io, this, container.read, gameid, servers.remove,
        debug: debug);

    servers[server.id] = server;
    client.emit(IOChannel.gamecreated.string, server.id);
  }

  void _deleteGame(IO.Socket client, String id) {
    servers[id].notifyKilled();
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
    final gameInfo = games
        .map(
          (g) => GameInfo(
            g,
            servers[g].playerNames.asList(),
            servers[g].getClientName(id),
            servers[g].isClientAdmin(id),
            servers[g].gameType,
          ).toJson(),
        )
        .toList();
    client.emit(IOChannel.allgames.string, json.encode(gameInfo));
  }

  void addClientToGame(String id, String gameId) {
    if (_clientGames[id] == null) {
      _clientGames[id] = {};
    }
    _clientGames[id].add(gameId);
  }

  void removeClientFromGame(String id, String gameId) {
    _clientGames[id].remove(gameId);
  }
}
