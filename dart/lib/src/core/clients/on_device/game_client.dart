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
  NoServerGameClient(
      {required ProviderRef<GameClient> ref, required PlayerID playerID})
      : super(playerID, ref);
  StreamSubscription<Game?>? _ss;
  StreamSubscription<GameError?>? _se;
  BackendGameReader get backend => read.backendGame(game.gameCode);
  static final Map<String, List<void Function()>> _startListening = {};
  @override
  Future<bool> exitGame() async {
    game.gameStatus = GameStatus.NotJoined;
    return true;
  }

  IList<Player> get _players => backend.players;
  @override
  Future<bool> register() async {
    backend.players = _players.add(Player(playerID, name: game.playerName));
    game.gameStatus = GameStatus.NotJoined;
    game.playerName = game.playerName == '' ? playerID : game.playerName;
    game.gameStatus = GameStatus.NotStarted;
    _startListening.putIfAbsent(gameCode, () => []);
    _startListening[gameCode]!.add(_watchState);
    final config = backend.gameConfig;
    if (_players.length == config.maxPlayers && config.autoStart) {
      await sendEvent(const GenericEvent.start().asGameEvent);
    }
    for (final pID in _players) {
      lobbyStreamController.add(GameInfo(
        gameId: gameCode,
        players: _players.map((p) => p.name).toIList(),
        player: pID.name,
        creator: pID.id == backend.players.first.id,
        gameType: config.gameType,
      ));
    }
    return true;
  }

  void _watchState() {
    logger.info('Watching backend');
    _ss = backend.gameNotifier.stream.listen((gameState) {
      gameStreamController.add(gameState);
      game.gameStatus = gameState.gameStatus;
    }, onError: (e) {
      game.errorNotifier.error = GameError(e as String, playerID);
    });

    _se = backend.errorNotifier.stream.listen((gameError) {
      if (gameError == null || gameError.person == playerID) {
        game.errorNotifier.error = gameError;
      }
    });
    final initialState = backend.gameNotifier.gameState;
    gameStreamController.add(initialState);
    game.gameStatus = initialState.gameStatus;
    final error = backend.gameError;
    game.errorNotifier.error = error;
  }

  @override
  Future<bool> sendEvent(Event event) async {
    // print('${event.toJson()}');
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    final result = backend.handleEvent(event.asGameEvent);
    if (event is GameEventGeneral &&
        event.event is GenericEventStart &&
        _startListening[gameCode] != null) {
      logger.info('Starting');
      for (final fcn in _startListening[gameCode]!) {
        fcn();
      }
      _startListening[gameCode]?.clear();
    }
    return result;
  }

  @override
  void dispose() {
    _ss?.cancel();
    _se?.cancel();
    logger.info('Disposing game client');
    super.dispose();
  }

  static void registerImplementation() {
    GameClient.registerImplementation(
      OnDeviceLocation,
      (ref, address, id) => NoServerGameClient(ref: ref, playerID: id),
    );
  }
}
