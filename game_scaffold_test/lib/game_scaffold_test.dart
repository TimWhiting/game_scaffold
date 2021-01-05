import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:test/test.dart' as darttest;
import 'package:meta/meta.dart';

/// Tests the game with [T] type in a group with [name] and test named [name + '_Tests']
///
/// All parameters are required
/// * [config] specifies the [GameConfig]
/// * [players] specifies the list of players
/// * [test] gives you access to a [GameTester] which allows you to test the game
///
/// Uses the OnDevice clients
void testGame<T extends Game>(
  String name, {
  @required GameConfig config,
  @required List<Player> players,
  @required void Function(GameTester<T>) test,
}) {
  darttest.group(name, () {
    final read = ProviderContainer().read;
    darttest.setUp(() async {
      read(gameLocationProvider).state = OnDeviceLocation;
      read(gameConfigProvider(P1)).state = config;
      await read(gameServerClientProvider(players.first.id)).createGame();
      for (final p in players) {
        await read(gameServerClientProvider(p.id)).register();
      }
      if (read(backendGameProvider).gameState?.gameStatus !=
          GameStatus.Started) {
        read(gameServerClientProvider(players.first.id)).startGame();
      }
    });
    darttest.test(name + '_Tests', () {
      test(GameTester<T>(read, players));
    });
  });
}

/// `GameTester` lets you test an event and check it's outcome
///
/// Just call [event] with your event, and a function that recieves a game and error
/// and check the properties you want
class GameTester<T extends Game> {
  final Reader _read;
  final List<Player> _players;

  GameTester(this._read, this._players);

  /// Event lets you test the [outcome] of an [event]
  ///
  /// Use like:
  /// ```dart
  /// tester.event(MyGameEvent(), (game, error) {
  ///   expect(error, isNull);
  ///   expect(game.players.size, 2);
  /// });
  /// ```
  void event(Event event, Function(T, GameError) outcome) {
    if (event != null) {
      _read(backendGameProvider).handleEvent(event.asGameEvent);
    }

    final T game = _read(backendGameProvider).gameState;
    final error = _read(backendGameErrorProvider).error;
    if (error != null) {
      _read(backendGameErrorProvider).clearError();
    }
    outcome(game, error);
  }

  /// Returns the current game state
  ///
  /// If testing the outcome of an event prefer using [event]
  T get game => _read(backendGameProvider).gameState;

  /// Returns the current error state
  ///
  /// If testing the outcome of an event prefer using [event]
  GameError get error => _read(backendGameErrorProvider).error;

  /// Advances to the next round, and checks the [expectation] of the game after
  /// the round has advanced
  void nextRound(Function(T) expectation) {
    for (final p in _players) {
      _read(gameServerClientProvider(p.id)).newRound();
    }
    expectation(game);
  }
}
