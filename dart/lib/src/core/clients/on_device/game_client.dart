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
  static final Map<String, List<void Function()>> _startListening = {};
  @override
  Future<bool> exitGame() async {
    gameStatus = GameStatus.NotJoined;
    return true;
  }

  set gameStatus(GameStatus status) {
    read(GameProviders.status).state = status;
  }

  Reader get backendReader =>
      NoServerClient.games[read(GameProviders.code).state]!.read;

  GameStatus get gameStatus => read(GameProviders.status).state;
  IList<Player> get _players => backendReader(BackendProviders.players).state;
  @override
  Future<bool> register() async {
    backendReader(BackendProviders.players).state = _players
        .add(Player(playerID, name: read(GameProviders.playerName).state));
    gameStatus = GameStatus.NotJoined;
    read(GameProviders.playerName).state =
        read(GameProviders.playerName).state == ''
            ? playerID
            : read(GameProviders.playerName).state;
    gameStatus = GameStatus.NotStarted;
    _startListening.putIfAbsent(gameCode, () => []);
    _startListening[gameCode]!.add(_watchState);
    final config = backendReader(BackendProviders.config).state;
    if (_players.length == config.maxPlayers && config.autoStart) {
      await sendEvent(const GenericEvent.start().asGameEvent);
    }

    for (final pID in _players) {
      lobbyStreamController.add(GameInfo(
        gameId: gameCode,
        players: _players.map((p) => p.name).toIList(),
        player: pID.name,
        creator:
            pID.id == backendReader(BackendProviders.players).state.first.id,
        gameType: config.gameType,
      ));
    }
    return true;
  }

  void _watchState() {
    logger.info('Watching backend');

    _ss = backendReader(BackendProviders.state.notifier).stream.listen(
        (gameState) {
      gameStreamController.add(gameState);
      read(GameProviders.status).state = gameState.status;
    }, onError: (e) {
      logger.shout('Unexpected Error State $e');

      read(GameProviders.error.notifier).error =
          GameError(e as String, playerID);
    });

    _se = backendReader(BackendProviders.error.notifier)
        .stream
        .listen((gameError) {
      logger.warning('Error State $gameError');
      if (gameError == null || gameError.person == playerID) {
        read(GameProviders.error.notifier).error = gameError;
      }
    });
    final initialState =
        backendReader(BackendProviders.state.notifier).gameState;
    gameStreamController.add(initialState);
    read(GameProviders.status).state = initialState.status;
    final error = backendReader(BackendProviders.error.notifier).error;
    read(GameProviders.error.notifier).error = error;
  }

  @override
  Future<bool> sendEvent(Event event) async {
    // print('${event.toJson()}');
    final js = event.asGameEvent.toJson();
    logger.info('Sending event $js');
    final result = backendReader(BackendProviders.state.notifier)
        .handleEvent(event.asGameEvent);
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
      OnDeviceClient,
      (ref, address, id) => NoServerGameClient(ref: ref, playerID: id),
    );
  }
}
