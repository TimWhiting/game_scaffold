import 'dart:async';

import 'package:logging/logging.dart';

// ignore: library_prefixes
import 'package:socket_io/socket_io.dart' as IO;
// ignore: implementation_imports, library_prefixes
import 'package:socket_io/src/namespace.dart' as IO;

import '../../core.dart';
import 'server.dart';

class GameServer {
  GameServer(
    IO.Server _io,
    this.mainServer,
    this._container,
    this._gameID,
    this._onGameOver, {
    this.timeout = const Duration(hours: 2),
    this.debug = true,
  })  : _socket = _io.of('/$_gameID'),
        _serverLogger = Logger('GameServer $_gameID') {
    _initServer();
  }

  /// Logs server events
  final Logger _serverLogger;

  /// Main Server
  final IOServer mainServer;

  /// flag for printing out debug info
  final bool debug;

  /// When to stop a game after [timeout] long of inactivity
  final Duration timeout;

  /// The game's id
  GameCode get gameID => _gameID;

  /// Gets [GameConfig] of this game
  GameConfig get gameConfig =>
      _container.read(BackendProviders.state.notifier).gameConfig;

  /// Gets the game's type from the config
  GameType get gameType => gameConfig.gameType;

  /// Returns the list of players involved in the game
  IList<PlayerID> get playerNames => _players.map((p) => p.name).toIList();

  /// Returns whether the client by [id] is the admin
  bool isClientAdmin(PlayerID? id) => id == gameConfig.adminID;

  /// Gets the client's name corresponding to [id]
  String? getClientName(PlayerID id) => _clientNames[id];
  final ProviderContainer _container;
  final GameCode _gameID;
  IList<Player> get _players =>
      _container.read(BackendProviders.lobby).players.toIList();
  final _clients = <PlayerID, IO.Socket?>{};
  final _clientNames = <PlayerID, String>{};
  // ignore: prefer_typing_uninitialized_variables
  final IO.Namespace _socket;

  /// The callback to call when the game ends
  final void Function(GameCode) _onGameOver;

  /// The notifier for the game state
  late final GameStateNotifier _gameState =
      _container.read(BackendProviders.state.notifier);

  /// The notifier for errors of the game
  // final GameErrorNotifier _gameError;

  /// Keeps track of how long there has not been an event
  late Timer _gameNotActiveTimer;

  /// Keeps track of how long there has not been an event (i.e. game is active)
  bool _active = false;
  final _started = true;

  late void Function() _gameStateListenerDisposer;

  void _initServer() {
    _gameNotActiveTimer = Timer.periodic(timeout, (timer) {
      if (!_active) {
        killGame();
      }
    });
    _serverLogger.info('Creating Game Server');
    _serverLogger.info('Listening on namespace /$_gameID');
    // ignore: avoid_dynamic_calls
    _socket.on(
      IOChannel.connection.string,
      (c) => _handleClientConnection(c as IO.Socket),
    );
  }

  GameInfo gameInfo(PlayerID? id) => GameInfo(
        status: _started ? GameStatus.started : GameStatus.lobby,
        gameID: _gameID,
        players: _players.map((p) => p.name).toIList(),
        player: _clientNames[id] ?? '',
        creator: isClientAdmin(id),
        gameType: gameType,
      );

  void _handleClientConnection(IO.Socket client) {
    _serverLogger.info('Game server namespace $_gameID connected to client');
    client.on(
      IOChannel.register.string,
      (data) => _handleRegister(client, data as Map<String, dynamic>),
    );
    client.on(
      IOChannel.event.string,
      _handleRequest,
    );
    _serverLogger.info('Sending first update');
    if (_started) {
      _sendUpdates(_gameState.gameState);
    }
  }

  void _handleRegister(IO.Socket client, Map<String, dynamic> data) {
    _serverLogger
        .info('Game server namespace $_gameID registering client $data');

    final name = data['name'] as String?;
    final id = data['id'] as PlayerID;
    // print('Client registered');

    client.on(
      IOChannel.disconnect.string,
      (data) => _handleDisconnect(client, id, data),
    );
    // Player rejoining
    if (_clients.containsKey(id)) {
      // The player already exists, and is in the game
      // just update their client data
      _serverLogger.info('Client $id rejoining');
      _clients[id] = client;
      if (_started) {
        _clients[id]
            ?.emit(IOChannel.gameState.string, _gameState.gameState.toJson());
      } else {
        _clients[id]?.emit(IOChannel.lobby.string, gameInfo(id).toJson());
      }

      _clients[id]?.emit(IOChannel.name.string, _clientNames[id]);
      return;
    }
    if (_clients.length > gameConfig.maxPlayers) {
      _sendError((message: 'Too many players already, sorry', player: id));
      _clients[id]?.emit(IOChannel.name.string);
    } else {
      if (gameConfig.customNames) {
        _serverLogger.info('Creating player with name $name');
        _clients[id] = client;
        _clientNames[id] = name ?? 'No name';
        _addPlayer(Player(id, name: name ?? 'No name'));
        mainServer.addClientToGame(id, _gameID);
        _clients[id]?.emit(IOChannel.name.string, name);
      } else {
        _serverLogger.info('Creating player with random name');
        final name = _getRandomPlayer();
        client.emit(IOChannel.name.string, name);
        _clients[id] = client;
        _clientNames[id] = name;
        _addPlayer(Player(id, name: name));
        mainServer.addClientToGame(id, _gameID);
        _clients[id]?.emit(IOChannel.name.string, name);
      }

      if (_players.length == gameConfig.maxPlayers && gameConfig.autoStart) {
        _start();
      }
    }
  }

  void _start() {
    _gameStateListenerDisposer = _gameState.addListener(_sendUpdates);
  }

  void _handleDisconnect(IO.Socket socket, PlayerID id, reason) {
    _serverLogger.info('Client disconnected from $_gameID namespace $reason');
    _clients[id] = null;
  }

  void _addPlayer(Player player) {
    _container.read(BackendProviders.lobby.notifier).addPlayer(player);
    _serverLogger.info('Notifying ${_clients.length} clients of added player');
    for (final client in _clients.entries) {
      client.value?.emit(IOChannel.lobby.string, gameInfo(client.key).toJson());
    }
  }

  void _sendError(GameError error){
    final message = error.message; 
    final client = _clients[error.player];
    // TODO: Change channel
    client?.emit(IOChannel.gameError.string, message);
  }

  void _sendUpdates<T>(State<T>? state) {
    if (state == null) {
      return;
    }
    final json = state.toJson();

    for (final client in _clients.entries) {
      _serverLogger.info('Game update for client ${client.key}');

      client.value?.emit(IOChannel.gameState.string, json);
    }
    if (state.status == GameStatus.finished) {
      killGame();
    }
  }

  /// Disposes of all resources used by the server
  void _dispose() {
    _gameNotActiveTimer.cancel();
    _gameStateListenerDisposer();
    _gameState.dispose();
    for (final client in [..._clients.values]) {
      client?.disconnect();
    }
    _socket.clearListeners();
    for (final c in _clients.keys) {
      mainServer.removeClientFromGame(c, _gameID);
    }
  }

  dynamic _handleRequest(gameEvent) {
    final event = Game.gameEventFromJson(gameEvent as Map<String, dynamic>);
    _serverLogger.info(event);
    if (event is GameEventGame) {
      _start();
    }
    _gameState.handleEvent(event);

    _active = true;
  }

  /// Gets a name that hasn't already been used
  String _getRandomPlayer() => ((Set.of(nameSets[gameConfig.nameSet]!)
          .difference(_clientNames.values.toSet()))
      .toList()
    ..shuffle())[0];

  /// Dispose of all resources, and then notify the creator of the Game
  void killGame() {
    _dispose();
    _serverLogger.info('Killing game');
    _onGameOver(_gameID);
  }

  /// Note: only notify users that the game was killed if the killing was manually
  /// done so that it doesn't kick clients out of the game at the end of the game
  void notifyKilled(IO.Socket client) {
    for (final client in _clients.values) {
      client?.emit(IOChannel.gameDeleted.string, true);
    }
    if (!_clients.values.contains(client)) {
      client.emit(IOChannel.gameDeleted.string, true);
    }
  }

  PlayerID clientID(IO.Socket client) =>
      _clients.entries.firstWhere((c) => c.value == client).key;
}
