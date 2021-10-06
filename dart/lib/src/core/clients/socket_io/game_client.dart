import 'dart:async';

import 'package:riverpod/riverpod.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../game_scaffold_dart.dart';
import '../../core.dart';
import '../game_client.dart';
import '../providers.dart';
import 'channels.dart';

/// The socket IO implementation of [GameClient]
class IOGameClient extends GameClient {
  IOGameClient(
      {required ProviderRef<GameClient> ref,
      required this.address,
      required PlayerID playerID})
      : super(playerID, ref) {
    Future.delayed(const Duration(milliseconds: 100), _ensureConnected);
  }
  final GameAddress address;

  IO.Socket? _socket;
  GameCode? _lastGameCode;

  void _ensureConnected() {
    if (gameCode != _lastGameCode || (_socket?.disconnected ?? true)) {
      _socket?.dispose();
      _socket = IO.io('$address/$gameCode', socketIOOpts);
      logger.info('Created Game Client Socket $gameCode');
      _lastGameCode = gameCode;
      scheduleMicrotask(() => gameStatus = GameStatus.NotJoined);
    }
  }

  @override
  Future<bool> exitGame() async {
    _socket!.off(IOChannel.error_channel.string);
    _socket!.off(IOChannel.gamestate.string);
    _socket!.off(IOChannel.lobby.string);
    logger.info('Exiting game');
    gameStatus = GameStatus.NotJoined;
    return true;
  }

  set gameStatus(GameStatus status) {
    read(GameProviders.status).state = status;
  }

  GameStatus get gameStatus => read(GameProviders.status).state;
  @override
  Future<bool> register() async {
    _ensureConnected();
    logger.info('Registering');
    gameStatus = GameStatus.NotJoined;
    _watchState();
    final assignedName = await _socket!.call(IOChannel.register, {
      'name': read(GameProviders.playerName).state,
      'id': playerID
    }) as String?;
    if (assignedName != null) {
      read(GameProviders.playerName).state = assignedName;
      return true;
    }
    return false;
  }

  void _onLobby(Map<String, dynamic> lobby) {
    final gameInfo = GameInfo.fromJson(lobby);
    gameStatus = GameStatus.NotStarted;
    logger.info('Got Lobby $gameInfo');
    lobbyStreamController.add(gameInfo);
  }

  void _watchState() {
    _socket!.on(IOChannel.gamestate.string, (data) {
      _socket!.off(IOChannel.lobby.string);
      final gameState = Game.fromJson(data as Map<String, dynamic>);
      logger.info('Got gamestate $data');
      gameStreamController.add(gameState);
      gameStatus = gameState.status;
    });
    _socket!.on(IOChannel.error_channel.string, (data) {
      final error = GameError.fromJson(data as Map<String, dynamic>);
      logger.warning('Error: $error');
      read(GameProviders.error.notifier).error = error;
    });
    // ignore: unnecessary_lambdas
    _socket!
        .on(IOChannel.lobby.string, (d) => _onLobby(d as Map<String, dynamic>));
  }

  @override
  Future<bool> sendEvent(Event event) async {
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    final result = await _socket!.call(IOChannel.event, js);
    return result as bool;
  }

  @override
  void dispose() {
    exitGame();
    logger.info('Dispose');
    _socket!.dispose();
    super.dispose();
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      IOClient,
      (ref, address, id) =>
          IOGameClient(address: address, ref: ref, playerID: id),
    );
  }
}
