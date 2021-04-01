import 'dart:async';

import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:riverpod/riverpod.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../core.dart';
import '../game_client.dart';
import '../providers.dart';
import 'channels.dart';

/// The socket IO implementation of [GameClient]
class IOGameClient extends GameClient {
  IOGameClient(
      {required Reader read, required this.address, required PlayerID playerID})
      : super(playerID, read) {
    Future.delayed(Duration(milliseconds: 100), _ensureConnected);
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
      scheduleMicrotask(() => game.gameStatus = GameStatus.NotJoined);
    }
  }

  @override
  void exitGame() {
    _socket!.off(IOChannel.error_channel.string);
    _socket!.off(IOChannel.gamestate.string);
    _socket!.off(IOChannel.lobby.string);
    logger.info('Exiting game');
    game.gameStatus = GameStatus.NotJoined;
  }

  @override
  Future<void> register() async {
    _ensureConnected();
    logger.info('Registering');
    game.gameStatus = GameStatus.NotJoined;
    _watchState();
    final assignedName = await _socket!
        .call(IOChannel.register, {'name': game.playerName, 'id': playerID});
    game.playerName = assignedName as String;
  }

  void _onLobby(Map<String, dynamic> lobby) {
    final gameInfo = GameInfo.fromJson(lobby);
    game.gameStatus = GameStatus.NotStarted;
    logger.info('Got Lobby $gameInfo');
    game.lobbyInfo = gameInfo;
  }

  void _watchState() {
    _socket!.on(IOChannel.gamestate.string, (data) {
      _socket!.off(IOChannel.lobby.string);
      final gameState = Game.fromJson(data as Map<String, dynamic>);
      logger.info('Got gamestate $data');
      game.gameState = gameState;
      game.gameStatus = gameState.gameStatus;
    });
    _socket!.on(IOChannel.error_channel.string, (data) {
      final error = GameError.fromJson(data as Map<String, dynamic>);
      logger.warning('Error: $error');
      game.gameError = error;
    });
    _socket!.on(IOChannel.lobby.string, (d) => _onLobby(d));
  }

  @override
  void sendEvent(Event event) {
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    _socket!.emit(IOChannel.event.string, js);
  }

  @override
  void dispose() {
    exitGame();
    logger.info('Dispose');
    _socket!.dispose();
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      IOServerLocation,
      (read, address, id) =>
          IOGameClient(address: address, read: read, playerID: id),
    );
  }
}
