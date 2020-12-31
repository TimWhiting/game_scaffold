import 'dart:async';
import 'package:game_scaffold_dart/src/core/clients/socket_io/channels.dart';
import 'package:kt_dart/kt.dart';
import 'package:riverpod/all.dart';
//ignore: library_prefixes
import 'package:socket_io/socket_io.dart' as IO;
import 'package:logging/logging.dart';

import '../../core.dart';
import '../../core/backend.dart';
import 'server.dart';

class GameServer {
  GameServer(
    IO.Server _io,
    this.mainServer,
    this._read,
    this._gameId,
    this._onGameOver, {
    this.timeout = const Duration(hours: 2),
    this.debug = true,
  })  : _socket = _io.of('/$_gameId'),
        _gameState = _read(gameProvider),
        _gameError = _read(gameErrorProvider),
        _serverLogger = Logger('GameServer $_gameId') {
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
  String get id => _gameId;

  /// Gets [GameConfig] of this game
  GameConfig get gameConfig => _read(backendGameConfigProvider).state;

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
    _socket.on(
      IOChannel.connection.string,
      (client) => _handleClientConnection(client),
    );
  }

  GameInfo gameInfo(String id) => GameInfo(
        _gameId,
        _players.map((p) => p.name),
        _clientNames[id],
        isClientAdmin(id),
        gameType,
      );

  void _handleClientConnection(IO.Socket client) {
    _serverLogger.info('Game server namespace $_gameId connected to client');
    client.on(
      IOChannel.register.string,
      (data) => _handleRegister(client, data),
    );
    client.on(
      IOChannel.event.string,
      (data) => _handleRequest(data),
    );
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
      IOChannel.disconnect.string,
      (data) => _handleDisconnect(client, data),
    );
    // Player rejoining
    if (_clients.containsKey(id)) {
      // The player already exists, and is in the game
      // just update their client data
      _clients[id] = client;
      _clients[id]
          .emit(IOChannel.gamestate.string, _gameState.gameState?.toJson());
      return;
    }
    if (_clients.length > gameConfig.maxPlayers) {
      client?.emit(IOChannel.error.string, 'Too many players already, sorry');
    } else {
      if (gameConfig.customNames) {
        _serverLogger.info('Creating player with name $name');
        _clients[id] = client;
        mainServer.addClientToGame(id, _gameId);
        _clientNames[id] = name;
        _addPlayer(Player(id, name: name));
      } else {
        _serverLogger.info('Creating player with random name');
        final name = _getRandomPlayer();
        client.emit(IOChannel.name.string, name);
        _addPlayer(Player(id, name: name));
        mainServer.addClientToGame(id, _gameId);
        _clients[id] = client;
        _clientNames[id] = name;
      }

      if (_players.length == gameConfig.maxPlayers && gameConfig.autoStart) {
        _gameState.handleEvent(GenericEvent.start().asGameEvent);
      }
    }
  }

  void _handleDisconnect(IO.Socket socket, dynamic reason) {
    _serverLogger.info('Client disconnected from $_gameId namespace $reason');
    _clients[id] = null;
  }

  void _addPlayer(Player player) {
    _players.add(player);
    _read(backendPlayersProvider).state = _players.toImmutableList();
    for (final client in _clients.entries) {
      client.value?.emit(IOChannel.lobby.string, gameInfo(id).toJson());
    }
  }

  void _sendUpdates(Game state) {
    if (state == null) {
      return;
    }
    final json = state.toJson();
    for (final client in _clients.entries) {
      _serverLogger.info('Game update for client ${client.key}');
      client.value?.emit(IOChannel.gamestate.string, json);
    }
    if (state.gameStatus == GameStatus.Finished) {
      killGame();
    }
  }

  /// Disposes of all resources used by the server
  void _dispose() {
    _gameNotActiveTimer.cancel();
    _gameStateListenerDisposer();
    _gameErrorListenerDisposer();
    _gameState.dispose();
    for (final client in _clients.values) {
      client?.disconnect();
    }
    _socket.clearListeners();
    for (final c in _clients.keys) {
      mainServer.removeClientFromGame(c, _gameId);
    }
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

  /// Dispose of all resources, and then notify the creator of the Game
  void killGame() {
    _dispose();
    _serverLogger.info('Killing game');
    _onGameOver(_gameId);
  }

  /// Note: only notify users that the game was killed if the killing was manually
  /// done so that it doesn't kick clients out of the game at the end of the game
  void notifyKilled() {
    for (final client in _clients.values) {
      client?.emit(IOChannel.gamedeleted.string, true);
    }
  }

  String clientID(IO.Socket client) =>
      _clients.entries.firstWhere((c) => c.value == client).key;
}
