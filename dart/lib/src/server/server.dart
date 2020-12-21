import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:kt_dart/kt.dart';
import 'package:riverpod/all.dart';
//ignore: library_prefixes
import 'package:socket_io/socket_io.dart' as IO;
import 'package:stream/stream.dart';
import 'package:uuid/uuid.dart';
import 'package:dartx/dartx.dart';
import 'package:logging/logging.dart';

import '../core/comms.dart';
import '../core/errors.dart';
import '../core/game.dart';
import '../core/providers.dart';
import '../core/game_server.dart';

final _serverLogger = Logger('Server');
final Map<dynamic, dynamic> _serverSocketOpts = <String, dynamic>{
  'transports': ['websocket'],
};
final Uuid uuid = Uuid();

final Map<String, Set<String>> clientGames = <String, Set<String>>{};

class GameServer {
  GameServer(
    this.io,
    this.read,
    this.onGameOver,
    this._gameId, {
    this.debug = true,
  })  : _socket = io.of('/$_gameId'),
        gameState = read(gameProvider),
        gameError = read(gameErrorProvider) {
    initServer();
  }
  final Reader read;
  final List<Player> players = [];
  final IO.Server io;
  final bool debug;
  final String _gameId;
  final _clients = <String, IO.Socket>{};
  final _clientNames = <String, String>{};
  final dynamic _socket;
  final List<Game> previousStates = [];
  final Set<String> readyPlayers = {};
  final void Function(String) onGameOver;
  final GameStateNotifier gameState;
  final GameErrorNotifier gameError;
  void Function() gameStateListenerDisposer;
  void Function() gameErrorListenerDisposer;
  Timer gameNotActiveTimer;
  bool active = false;
  String get id => _gameId;
  GameConfig get gameConfig => read(gameConfigProvider).state;
  String get gameType => gameConfig.gameType;
  KtList<String> get playerNames =>
      players.map((p) => p.name).toImmutableList();

  void initServer() {
    gameNotActiveTimer = Timer.periodic(2.hours, (timer) {
      if (!active) {
        killGame();
        timer.cancel();
      }
    });
    gameStateListenerDisposer = gameState.addListener(sendUpdates);
    gameErrorListenerDisposer = gameError.addListener(sendError);
    _serverLogger.info('Creating Game Server');
    _serverLogger.info('Listening on namespace /$_gameId');

    _socket.on(IOChannel.connection.string, (client) {
      _serverLogger.info('Game server namespace $_gameId connected to client');

      client.on(IOChannel.register.string, (data) {
        _serverLogger
            .info('Game server namespace $_gameId registering client $data');

        final name = data['name'] as String;
        final id = data['id'] as String;

        client.on(IOChannel.disconnect.string, (reason) {
          _serverLogger
              .info('Client disconnected from $_gameId namespace $reason');
          _clients[id] = null;
        });
        // Player rejoining
        if (_clients.containsKey(id)) {
          // The player already exists, and is in the game
          // just update their client data
          _clients[id] = client as IO.Socket;
          _clients[id]
              .emit(IOChannel.gamestate.string, gameState.gameState.toJson());
          return;
        }
        if (_clients.length > 12) {
          (client as IO.Socket)
              ?.emit(IOChannel.error.string, 'Too many players already, sorry');
        } else {
          if (gameConfig.customNames) {
            _serverLogger.info('Creating player with name $name');
            _clients[id] = client as IO.Socket;
            if (clientGames[id] == null) {
              clientGames[id] = {};
            }
            clientGames[id].add(_gameId);
            _clientNames[id] = name;
            addPlayer(Player(id, name: name));
          } else {
            _serverLogger.info('Creating player with random name');
            final name = _getRandomPlayer();
            client.emit(IOChannel.name.string, name);
            addPlayer(Player(id, name: name));
            if (clientGames[id] == null) {
              clientGames[id] = {};
            }
            _clients[id] = client as IO.Socket;
            _clientNames[id] = name;
            clientGames[id].add(_gameId);
          }
        }
      });
      client.on(IOChannel.event.string, _handleRequest);
      if (gameState.gameState != null) {
        _serverLogger.info('Sending first update');
        sendUpdates(gameState.gameState);
      }
    });
  }

  void addPlayer(Player player) {
    players.add(player);
    read(serverPlayersProvider).state = players.toImmutableList();
  }

  void sendUpdates(Game state) {
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

  void killGame() {
    gameStateListenerDisposer();
    _serverLogger.info('Killing game');
    gameState.dispose();
    for (final client in _clients.values) {
      client?.disconnect();
    }
    _socket.clearListeners();
    for (final c in _clients.keys) {
      clientGames[c].remove(_gameId);
    }
    onGameOver(_gameId);
  }

  void sendError(GameError message) {
    if (message == null) {
      return;
    }
    _serverLogger.info('Error: $message');
    _clients[message.person]?.emit(IOChannel.error.string, message.message);
  }

  dynamic _handleRequest(gameEvent) {
    final event = Game.gameEventFromJson(gameEvent as Map<String, dynamic>);
    _serverLogger.info(event);
    gameState.handleEvent(event);
    active = true;
  }

  String _getRandomPlayer() => (nameSets[gameConfig?.nameSet ?? NameSet.Basic]
      .except(_clientNames.values)
      .toList()
        ..shuffle())[0];

  bool isClientAdmin(String id) => id == gameConfig.adminId;

  String getClientName(String id) => _clientNames[id];
}

void updateGames(String id, Map<String, GameServer> servers, IO.Socket client) {
  _serverLogger.info('Getting all games for $id');
  final games = clientGames[id];
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

Future<void> startServer({bool debug = false}) async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('[${record.level.name}]: ${record.message}');
  });
  final io = IO.Server(options: _serverSocketOpts);
  final servers = <String, GameServer>{};
  final clients = <dynamic>{};
  io.on(IOChannel.connection.string, (client) {
    _serverLogger.info('Client connected');
    clients.add(client);
    client.on(IOChannel.getgameinfo.string, (id) async {
      if (servers.containsKey(id)) {
        client.emit(
            IOChannel.gameinfo.string,
            GameInfo(
              id as String,
              [],
              '',
              false,
              servers[id].gameType,
            ).toJson());
      } else {
        client.emit(IOChannel.gameinfo.string, '404');
      }
    });
    client.on(IOChannel.disconnect.string, (reason) {
      clients.remove(client);
      _serverLogger.info('Client disconnected from main room $reason');
    });
    client.on(IOChannel.creategame.string, (data) {
      _serverLogger.info('creating game');
      final config = GameConfig.fromJson(data as Map<String, dynamic>);
      var gameid = '';
      while (gameid.length != 4 || servers.keys.contains(gameid)) {
        gameid = 'BCDFGHJKLMNPQRSTVWXZ'
            .characters
            .shuffled()
            .join('')
            .substring(0, 4);
      }
      final container = ProviderContainer();
      container.read(gameConfigProvider).state = config;
      final server =
          GameServer(io, container.read, servers.remove, gameid, debug: debug);

      servers[server.id] = server;
      client.emit(IOChannel.gamecreated.string, server.id);
    });
    client.on(IOChannel.deletegame.string, (data) {
      servers[data].killGame();
      client.emit(IOChannel.gamedeleted.string, true);
      //TODO: Notify the other clients in the game of the game being deleted (probably in the killGame function)
    });
    client.on(IOChannel.getgames.string, (id) {
      if (clientGames[id] == null) {
        client.emit(IOChannel.allgames.string, json.encode([]));
      } else {
        updateGames(id as String, servers, client as IO.Socket);
      }
    });
  });

  final server = StreamServer();
  await server.start(
    address: InternetAddress.loopbackIPv4,
    port: defaultGamePort,
  );
  io.listen(server, _serverSocketOpts);
}
