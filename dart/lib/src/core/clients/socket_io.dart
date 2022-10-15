import 'dart:async';
import 'dart:convert';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../game_scaffold_dart.dart';

/// Location that corresponds to using an io-server for the backend
// ignore: constant_identifier_names
const IOClient = 'io-server';

/// The socket IO implementation of [RoundService]
class IORoundClient extends RoundService {
  IORoundClient({
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
  final ProviderRef<RoundService> ref;

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
    _socket!.off(IOChannel.gameState.string);
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
  Stream<GameState<T>> gameStream<T extends Object>(PlayerID playerID, GameCode code) async* {
    final sc = StreamController<GameState<T>>();
    _socket!.on(IOChannel.gameState.string, (data) {
      _socket!.off(IOChannel.lobby.string);
      // ignore: avoid_print
      final gameState = GameStateFromJson<T>(data as Map<String, dynamic>);
      logger.info('Got gameState $data');
      sc.add(gameState);
    });

    yield* sc.stream;
    await sc.close();
  }

  @override
  Stream<GameError> errorStream(PlayerID playerID, GameCode code) async* {
    final sc = StreamController<GameError>();
    _socket!.on(IOChannel.gameError.string, (data) {
      _socket!.off(IOChannel.lobby.string);
      data as JsonMap;
      // ignore: avoid_print
      final error = (message: data['message'] as String, player: data['player'] as String);
      logger.info('Got gameState $data');
      sc.add(error);
    });

    yield* sc.stream;
    await sc.close();
  }

  @override
  Future<bool> sendEvent<E extends Object>(
      PlayerID playerID, GameCode code, E event) async {
    final js = Game.toEventJson(event);
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
        .call(IOChannel.startGame, {'playerID': playerID, 'code': code});
    return result as bool;
  }
}

final socketIOGameClient = Provider<RoundService>(
  (ref) {
    final client = IORoundClient(
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

/// The socket IO implementation of [GameService]
class IOGameClient extends GameService {
  IOGameClient({
    required this.address,
    required this.ref,
  }) {
    Future.delayed(const Duration(milliseconds: 10), connect);
  }
  final ProviderRef<GameService> ref;

  final GameAddress address;
  late final IO.Socket socket = IO.io(address.toString(), socketIOOpts);

  @override
  Future<GameCode> createGame(PlayerID playerID, GameConfig config) async {
    logger.fine('Creating game $config');
    final gameCode = await _createGame(config);
    return gameCode;
  }

  Future<GameCode> _createGame(GameConfig config) async {
    final result = await socket.call(IOChannel.createGame,
        config.toJson());
    return result as GameCode;
  }

  @override
  Future<bool> deleteGame(PlayerID playerID, GameCode code) async {
    final result = await socket
        .call(IOChannel.deleteGame, {'code': code, 'playerID': playerID});
    return result as bool;
  }

  @override
  Future<IList<GameInfo>> getGames(PlayerID playerID) async {
    final result = await socket.call(IOChannel.getGames, playerID);
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

final socketIOGameServerClient = Provider<GameService>(
  (ref) {
    final client = IOGameClient(
      address: ref.watch(GameProviders.remoteUri),
      ref: ref,
    );
    ref.onDispose(client.dispose);
    return client;
  },
  name: 'socketIOGameServerClient',
  dependencies: [GameProviders.remoteUri, GameProviders.connected],
);

/// Options for a socket io server
final socketIOOpts = <String, dynamic>{
  'transports': ['websocket'],
  'forceNew': true,
};

/// The IO Channels used by the socket io implementations of [GameService] and [RoundService]
enum IOChannel {
  gameState,
  gameError,
  event,
  register,
  connect,
  connection,
  createGame,
  gameCreated,
  deleteGame,
  gameDeleted,
  startGame,
  gameStarted,
  eventAck,
  gameInfo,
  getGameInfo,
  name,
  disconnect,
  getGames,
  allGames,
  lobby,
}

extension IOChannelX on IOChannel {
  /// Retrieves the string for the enum
  String get string => name;

  /// Returns the corresponding response `IOChannel` for a particular channel
  ///
  /// This allows us to create a asynchronous request/response type API on top
  /// of the `IO.Socket` stream interface
  IOChannel get responseChannel {
    final error = UnimplementedError('No corresponding response channel');

    switch (this) {
      case IOChannel.startGame:
        return IOChannel.gameStarted;
      case IOChannel.event:
        return IOChannel.eventAck;
      case IOChannel.deleteGame:
        return IOChannel.gameDeleted;
      case IOChannel.createGame:
        return IOChannel.gameCreated;
      case IOChannel.register:
        return IOChannel.name;
      case IOChannel.getGameInfo:
        return IOChannel.gameInfo;
      case IOChannel.getGames:
        return IOChannel.allGames;
      // ignore: no_default_cases
      default:
        throw error;
    }
 }
}

extension SocketIOX on IO.Socket {
  /// Calls [requestChannel] with [request], and receives the corresponding
  /// response on the `requestChannel.responseChannel`, returning it as a `Future`
  Future<Object> call(IOChannel requestChannel, Object? request) {
    final responseChannel = requestChannel.responseChannel;
    final completer = Completer<Object>();
    once(responseChannel.string, completer.complete);
    emit(requestChannel.string, request);
    return completer.future;
  }
}
