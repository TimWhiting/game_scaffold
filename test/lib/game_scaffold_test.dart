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
@isTest
void testGame<T extends Game>(
  String testName, {
  required GameConfig config,
  required List<Player> players,
  required void Function(GameTester<T>) test,
}) {
  darttest.group(testName, () {
    final root = ProviderContainer();
    final readers = <PlayerID, dynamic>{};

    late GameCode code;
    darttest.setUp(() async {
      root.read(GameProviders.clientType).state = OnDeviceClient;

      for (final p in players) {
        readers[p.id] = ProviderContainer(parent: root, overrides: [
          GameProviders.playerIDProvider.overrideWithValue(p.id)
        ]).read;
      }
      code = await (readers[players.first.id] as Reader)(GameProviders.client)
          .createGame(config: config);
      for (final p in players) {
        await (readers[p.id] as Reader)(GameProviders.client)
            .register(code: code);
      }

      if ((readers[players.first.id] as Reader)(GameProviders.status).state !=
          GameStatus.Started) {
        await (readers[players.first.id] as Reader)(GameProviders.client)
            .startGame();
      }
    });
    darttest.test('${testName}_Tests', () {
      test(GameTester<T>(root.read, readers, players, code));
    });
  });
}

/// `GameTester` lets you test an event and check it's outcome
///
/// Just call [event] with your event, and a function that recieves a game and error
/// and check the properties you want
class GameTester<T extends Game> {
  GameTester(this.read, this.readers, this._players, this.code);

  final List<Player> _players;
  final GameCode code;
  final Reader read;
  final Map<PlayerID, dynamic> readers;

  /// Event lets you test the [outcome] of an [event]
  ///
  /// Use like:
  /// ```dart
  /// tester.event(MyGameEvent(), (game, error) {
  ///   expect(error, isNull);
  ///   expect(game.players.size, 2);
  /// });
  /// ```
  void event(Event event, Function(T, GameError<T>?) outcome) {
    NoServerClient.games[code]!
        .read(BackendProviders.state.notifier)
        .handleEvent(event.asGameEvent);

    final game = NoServerClient.games[code]!.read(BackendProviders.state) as T;
    final error = NoServerClient.games[code]!.read(BackendProviders.error)
        as GameError<T>?;
    if (error != null) {
      NoServerClient.games[code]!
          .read(BackendProviders.error.notifier)
          .clearError();
    }
    outcome(game, error);
  }

  /// Returns the current game state
  ///
  /// If testing the outcome of an event prefer using [event]
  T get game => read(GameProviders.state).value as T;

  /// Returns the current error state
  ///
  /// If testing the outcome of an event prefer using [event]
  GameError? get error => read(GameProviders.error);

  /// Advances to the next round, and checks the [expectation] of the game after
  /// the round has advanced
  void nextRound(Function(T) expectation) {
    for (final p in _players) {
      (readers[p.id] as Reader)(GameProviders.client).newRound();
    }
    expectation(game);
  }
}
