import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:game_scaffold_dart/src/core/clients/clients.dart';
import 'package:game_scaffold_dart/src/core/clients/socket_io/channels.dart';
import 'package:kt_dart/kt.dart';
import 'package:riverpod/all.dart';
//ignore: library_prefixes
import 'package:socket_io/socket_io.dart' as IO;
import 'package:stream/stream.dart';
import 'package:dartx/dartx.dart';
import 'package:logging/logging.dart';

import '../core/backend.dart';

/// Logs server events
final _serverLogger = Logger('Server');

/// Options for server socket
final _serverSocketOpts = <String, dynamic>{
  'transports': ['websocket'],
};

/// Keeps track of a set of games that a client is a part of by client id
final _clientGames = <String, Set<String>>{};

class GameServer {
  GameServer(
    IO.Server _io,
    this._read,
    this._gameId,
    this._onGameOver, {
    this.timeout = const Duration(hours: 2),
    this.debug = true,
  })  : _socket = _io.of('/$_gameId'),
        _gameState = _read(gameProvider),
        _gameError = _read(gameErrorProvider) {
    _initServer();
  }

  /// flag for printing out debug info
  final bool debug;

  /// When to stop a game after [timeout] long of inactivity
  final Duration timeout;

  /// The game's id
  String get id => _gameId;

  /// Gets [GameConfig] of this game
  GameConfig get gameConfig => _read(gameConfigProvider).state;

  /// Gets the game's type from the config
  String get gameType => gameConfig.gameType;

  /// Returns the list of players involved in the game
  KtList<String> get playerNames =>
      _players.map((p) => p.name).toImmutableList();

  /// Returns whether the client by [id] is the admin
  bool isClientAdmin(String id) => id == gameConfig.adminId;

  /// Gets the client's name corresponding to [id]
  String getClientName(String id) => _clientNames[id];

  final Reader _read;
  final String _gameId;
  final List<Player> _players = [];
  final _clients = <String, IO.Socket>{};
  final _clientNames = <String, String>{};
  final _socket;

  /// The callback to call when the game ends
  final void Function(String) _onGameOver;

  /// The notifier for the game state
  final GameStateNotifier _gameState;

  /// The notifier for errors of the game
  final GameErrorNotifier _gameError;

  /// Keeps track of how long there has not been an event
  Timer _gameNotActiveTimer;

  /// Keeps track of how long there has not been an event (i.e. game is active)
  bool _active = false;

  void Function() _gameStateListenerDisposer;
  void Function() _gameErrorListenerDisposer;

  void _initServer() {
    _gameNotActiveTimer = Timer.periodic(timeout, (timer) {
      if (!_active) {
        killGame();
      }
    });
    _gameStateListenerDisposer = _gameState.addListener(_sendUpdates);
    _gameErrorListenerDisposer = _gameError.addListener(_sendError);
    _serverLogger.info('Creating Game Server');
    _serverLogger.info('Listening on namespace /$_gameId');
    _socket.on(IOChannel.connection.string, _handleClientConnection);
  }

  void _handleClientConnection(IO.Socket client) {
    _serverLogger.info('Game server namespace $_gameId connected to client');
    client.on(
        IOChannel.register.string, (data) => _handleRegister(client, data));
    client.on(IOChannel.event.string, _handleRequest);
    if (_gameState.gameState != null) {
      _serverLogger.info('Sending first update');
      _sendUpdates(_gameState.gameState);
    }
  }

  void _handleRegister(IO.Socket client, Map<String, dynamic> data) {
    _serverLogger
        .info('Game server namespace $_gameId registering client $data');

    final name = data['name'] as String;
    final id = data['id'] as String;

    client.on(
        IOChannel.disconnect.string, (data) => _handleDisconnect(client, data));
    // Player rejoining
    if (_clients.containsKey(id)) {
      // The player already exists, and is in the game
      // just update their client data
      _clients[id] = client;
      _clients[id]
          .emit(IOChannel.gamestate.string, _gameState.gameState?.toJson());
      return;
    }
    if (_clients.length > 12) {
      client?.emit(IOChannel.error.string, 'Too many players already, sorry');
    } else {
      if (gameConfig.customNames) {
        _serverLogger.info('Creating player with name $name');
        _clients[id] = client;
        if (_clientGames[id] == null) {
          _clientGames[id] = {};
        }
        _clientGames[id].add(_gameId);
        _clientNames[id] = name;
        _addPlayer(Player(id, name: name));
      } else {
        _serverLogger.info('Creating player with random name');
        final name = _getRandomPlayer();
        client.emit(IOChannel.name.string, name);
        _addPlayer(Player(id, name: name));
        if (_clientGames[id] == null) {
          _clientGames[id] = {};
        }
        _clients[id] = client;
        _clientNames[id] = name;
        _clientGames[id].add(_gameId);
      }
    }
  }

  void _handleDisconnect(IO.Socket socket, dynamic reason) {
    _serverLogger.info('Client disconnected from $_gameId namespace $reason');
    _clients[id] = null;
  }

  void _addPlayer(Player player) {
    _players.add(player);
    _read(serverPlayersProvider).state = _players.toImmutableList();
  }

  void _sendUpdates(Game state) {
    if (state == null) {
      return;
    }
    for (final client in _clients.entries) {
      _serverLogger.info('Game update for client ${client.key}');
      client.value?.emit(IOChannel.gamestate.string, state.toJson());
    }
    if (state.gameStatus == GameStatus.Finished) {
      killGame();
    }
  }

  void _dispose() {
    _gameNotActiveTimer.cancel();
    _gameState.dispose();
    for (final client in _clients.values) {
      client?.disconnect();
    }
    _socket.clearListeners();
    for (final c in _clients.keys) {
      _clientGames[c].remove(_gameId);
    }
    _gameStateListenerDisposer();
    _gameErrorListenerDisposer();
  }

  void _sendError(GameError message) {
    if (message == null) {
      return;
    }
    _serverLogger.info('Error: $message');
    _clients[message.person]?.emit(IOChannel.error.string, message.message);
  }

  dynamic _handleRequest(gameEvent) {
    final event = Game.gameEventFromJson(gameEvent as Map<String, dynamic>);
    _serverLogger.info(event);
    _gameState.handleEvent(event);
    _active = true;
  }

  String _getRandomPlayer() => (nameSets[gameConfig?.nameSet ?? NameSet.Basic]
      .except(_clientNames.values)
      .toList()
        ..shuffle())[0];

  void killGame() {
    _dispose();
    _serverLogger.info('Killing game');
    _onGameOver(_gameId);
  }
}

// TODO: Separate this out into another class MultiGameServer and into different file
Future<void> startServer({
  bool debug = false,
  bool https = false,
  String pathToPem,
  String pathToRsa,
  int port,
}) async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('[${record.level.name}]: ${record.message}');
  });
  final io = IO.Server(options: _serverSocketOpts);
  final servers = <String, GameServer>{};
  final clients = <IO.Socket>{};
  io.on(
    IOChannel.connection.string,
    (client) => _handleClientConnection(io, client, servers, clients, debug),
  );
  final server = StreamServer();
  if (https) {
    assert(pathToPem != null);
    assert(pathToRsa != null);

    final security = SecurityContext()
      ..useCertificateChain(pathToPem)
      ..usePrivateKey(pathToRsa);
    await server.startSecure(
      security,
      address: InternetAddress.anyIPv4,
      port: port ?? defaultGamePort,
    );
  } else {
    await server.start(
      address: InternetAddress.loopbackIPv4,
      port: port ?? defaultGamePort,
    );
  }
  io.listen(server, _serverSocketOpts);
}

void _handleClientConnection(
  IO.Server io,
  IO.Socket client,
  Map<String, GameServer> servers,
  Set<IO.Socket> clients,
  bool debug,
) {
  _serverLogger.info('Client connected');
  clients.add(client);
  client.on(
    IOChannel.disconnect.string,
    (reason) => _clientDisconnect(clients, client, reason),
  );
  client.on(
    IOChannel.creategame.string,
    (config) => _createGame(io, client, servers, config, debug),
  );
  client.on(
    IOChannel.getgames.string,
    (clientId) => _getGames(client, servers, clientId),
  );
  client.on(
    IOChannel.getgameinfo.string,
    (id) => _getGameInfo(client, servers, id),
  );

  client.on(
    IOChannel.deletegame.string,
    (id) => _deleteGame(client, servers, id),
  );
}

void _getGameInfo(
    IO.Socket client, Map<String, GameServer> servers, String id) {
  if (servers.containsKey(id)) {
    client.emit(IOChannel.gameinfo.string,
        GameInfo(id, [], '', false, servers[id].gameType).toJson());
  } else {
    client.emit(IOChannel.gameinfo.string, '404');
  }
}

void _clientDisconnect(
    Set<IO.Socket> clients, IO.Socket client, dynamic reason) {
  clients.remove(client);
  _serverLogger.info('Client disconnected from main room $reason');
}

void _createGame(
  IO.Server io,
  IO.Socket client,
  Map<String, GameServer> servers,
  Map<String, dynamic> config,
  bool debug,
) {
  _serverLogger.info('creating game');
  final gameConfig = GameConfig.fromJson(config);
  var gameid = '';
  while (gameid.length != 4 || servers.keys.contains(gameid)) {
    gameid =
        'BCDFGHJKLMNPQRSTVWXZ'.characters.shuffled().join('').substring(0, 4);
  }
  final container = ProviderContainer();
  container.read(gameConfigProvider).state = gameConfig;
  final server =
      GameServer(io, container.read, gameid, servers.remove, debug: debug);

  servers[server.id] = server;
  client.emit(IOChannel.gamecreated.string, server.id);
}

void _deleteGame(IO.Socket client, Map<String, GameServer> servers, String id) {
  servers[id].killGame();
  client.emit(IOChannel.gamedeleted.string, true);
  //TODO: Notify the other clients in the game of the game being deleted (probably in the killGame function)
}

void _getGames(IO.Socket client, Map<String, GameServer> servers, String id) {
  if (_clientGames[id] == null) {
    client.emit(IOChannel.allgames.string, json.encode([]));
  } else {
    _updateGames(id, servers, client);
  }
}

void _updateGames(
    String id, Map<String, GameServer> servers, IO.Socket client) {
  _serverLogger.info('Getting all games for $id');
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
