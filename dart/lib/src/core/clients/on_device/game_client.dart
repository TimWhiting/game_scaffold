import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../../backend.dart';
import '../../client.dart';
import '../../core.dart';
import '../clients.dart';

/// An implementation of a [GameClient] for a local game on device with no server connection
///
/// Warning implementation not complete or tested yet
class NoServerGameClient extends GameClient {
  NoServerGameClient({required Reader read, required PlayerID playerID})
      : super(playerID, read);
  StreamSubscription<Game?>? _ss;
  StreamSubscription<GameError?>? _se;
  BackendGameReader get backend => read.backendGame(game.gameCode);
  static final Map<String, List<void Function()>> _startListening = {};
  @override
  void exitGame() {
    game.gameStatus = GameStatus.NotJoined;
  }

  IList<Player> get _players => backend.players;
  @override
  Future<void> register() async {
    backend.players =
        _players.add(Player(playerID, name: game.playerName ?? playerID));
    game.gameStatus = GameStatus.NotJoined;
    game.playerName = game.playerName == '' ? playerID : game.playerName;
    game.gameStatus = GameStatus.NotStarted;
    _startListening.putIfAbsent(gameCode, () => []);
    _startListening[gameCode]!.add(_watchState);
    final config = backend.gameConfig;
    if (_players.length == config.maxPlayers && config.autoStart) {
      sendEvent(const GenericEvent.start().asGameEvent);
    }
    for (final pID in _players) {
      read.gameFor(pID.id).lobbyInfo = GameInfo(
        gameId: gameCode,
        players: _players.map((p) => p.name).toIList(),
        player: pID.name,
        creator: pID.id == backend.players.first.id,
        gameType: config.gameType,
      );
    }
  }

  void _watchState() {
    _ss = backend.gameNotifier.stream.listen((gameState) {
      game.gameState = gameState;
      game.gameStatus = gameState.gameStatus;
    }, onError: (e) {
      game.gameError = GameError(e as String, playerID);
    });
    _se = backend.errorNotifier.stream.listen((gameError) {
      if (gameError == null || gameError.person == playerID) {
        game.gameError = gameError;
      }
    });
  }

  @override
  void sendEvent(Event event) {
    if (event is GenericEventStart && _startListening[gameCode] != null) {
      for (final fcn in _startListening[gameCode]!) {
        fcn();
      }
      _startListening[gameCode]?.clear();
    }
    // print('${event.toJson()}');
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    backend.handleEvent(event.asGameEvent);
  }

  @override
  void dispose() {
    _ss?.cancel();
    _se?.cancel();
    logger.info('Disposing game client');
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      OnDeviceLocation,
      (read, address, id) => NoServerGameClient(read: read, playerID: id),
    );
  }
}
