import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart' as darttest;

/// Tests the game with [T] type in a group with [name] and test named [name + '_Tests']
///
/// All parameters are required
/// * [config] specifies the [GameConfig]
/// * [players] specifies the list of players
/// * [test] gives you access to a [GameTester] which allows you to test the game
///
/// Uses the OnDevice clients
/// TODO: Maybe try to use only Backend Providers as long as nothing need to be async (which it shouldn't since the game method are all non-async)?
@isTest
void testGame<T extends Object, E extends Object>(
  String testName, {
  required GameConfig config,
  required List<Player> players,
  required Future<void> Function(GameTester<T, E>) test,
}) {
  darttest.test(testName, () async {
    final root = ProviderContainer();
    final ref = <PlayerID, ProviderContainer>{};
    final g = <PlayerID, ProviderSubscription<GameClient>>{};
    final r = <PlayerID, ProviderSubscription<RoundClient>>{};

    root.read(serviceType.notifier).state = OnDeviceService;

    for (final p in players) {
      ref[p.id] = ProviderContainer(
          parent: root, overrides: [playerIDProvider.overrideWithValue(p.id)]);
      g[p.id] = ref[p.id]!
          .listen(gameClientProvider(p.id).notifier, (previous, next) {});
    }
    g[players.first.id]!.read().setGameConfig(config);
    final code = await g[players.first.id]!.read().createGame();
    for (final p in players) {
      g[p.id]!.read().setGameCode(code);
      await g[p.id]!.read().joinGame();
      r[p.id] = ref[p.id]!
          .listen(roundClientProvider(p.id).notifier, (previous, next) {});
    }

    if (ref[players.first.id]!.read(GameProviders.status) !=
        GameStatus.started) {
      await r[players.first.id]!.read().startGame();
    }
    final tester = GameTester<T, E>(ref, players, code);
    await test(tester);

    for (final s in g.keys) {
      g[s]!.close();
      ref[s]!.dispose();
    }
    tester.dispose();
    await root.read(gameService).deleteGame(players.first.id, code);
  });
}

/// `GameTester` lets you test an event and check it's outcome
///
/// Just call [event] with your event, and a function that receives a game and error
/// and check the properties you want
class GameTester<T extends Object, E extends Object> {
  GameTester(this.readers, this._players, this.code) {
    sub = backendContainer.listen(BackendProviders.lobby, (previous, next) {
      print('Next: $next');
    });
  }

  final List<Player> _players;
  final GameCode code;
  late final ProviderContainer backendContainer =
      OnDeviceGameService.games[code]!.container;
  final Map<PlayerID, ProviderContainer> readers;
  GameError? _lastError;
  ProviderSubscription? sub;

  /// Event lets you test the [outcome] of an [event]
  ///
  /// Use like:
  /// ```dart
  /// tester.event(MyGameEvent(), (game, error) {
  ///   expect(error, isNull);
  ///   expect(game.players.size, 2);
  /// });
  /// ```
  void event(E event, Function(GameState<T>, GameError?) outcome) {
    backendContainer.read(BackendProviders.state.notifier).handleEvent(event);

    final g = game;
    final e = error;
    if (e == _lastError) {
      outcome(g, null);
    } else {
      _lastError = e;
      outcome(g, e);
    }
  }

  void dispose() {
    sub?.close();
  }

  /// Returns the current game state
  ///
  /// If testing the outcome of an event prefer using [event]
  GameState<T> get game =>
      backendContainer.read(BackendProviders.state.notifier).gameState
          as GameState<T>;

  /// Returns the current error state
  ///
  /// If testing the outcome of an event prefer using [event]
  GameError? get error => backendContainer.read(BackendProviders.error);

  /// Advances to the next round, and checks the [expectation] of the game after
  /// the round has advanced
  void nextRound(Function(GameState<T>) expectation) {
    for (final p in _players) {
      backendContainer
          .read(BackendProviders.state.notifier)
          .handleEvent(GenericEvent.readyNextRound(p.id));
    }

    expectation(game);
  }
}
