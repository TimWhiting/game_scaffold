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
  String name, {
  required GameConfig config,
  required List<Player> players,
  required void Function(GameTester<T>) test,
}) {
  darttest.group(name, () {
    final Reader read = ProviderContainer().read;
    late String code;
    darttest.setUp(() async {
      read(gameLocationProvider).state = OnDeviceLocation;
      read.gameFor(players.first.id).gameConfig = config;
      code = await read.gameFor(players.first.id).gameClient.createGame();
      for (final p in players) {
        read.gameFor(p.id).gameCode = code;
        await read.gameFor(p.id).gameClient.register();
      }
      if (read.backendGame(code).gameState?.gameStatus != GameStatus.Started) {
        read.gameFor(players.first.id).gameClient.startGame();
      }
    });
    darttest.test(name + '_Tests', () {
      test(GameTester<T>(read, players, code));
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
  final String code;

  GameTester(this._read, this._players, this.code);

  /// Event lets you test the [outcome] of an [event]
  ///
  /// Use like:
  /// ```dart
  /// tester.event(MyGameEvent(), (game, error) {
  ///   expect(error, isNull);
  ///   expect(game.players.size, 2);
  /// });
  /// ```
  void event(Event event, Function(T, GameError?) outcome) {
    _read.backendGame(code).handleEvent(event.asGameEvent);

    final game = _read.backendGame(code).gameState as T;
    final error = _read.backendGame(code).gameError as GameError<T>?;
    if (error != null) {
      _read.backendGame(code).clearError();
    }
    outcome(game, error);
  }

  /// Returns the current game state
  ///
  /// If testing the outcome of an event prefer using [event]
  T get game => _read.backendGame(code).gameState as T;

  /// Returns the current error state
  ///
  /// If testing the outcome of an event prefer using [event]
  GameError? get error => _read.backendGame(code).gameError;

  /// Advances to the next round, and checks the [expectation] of the game after
  /// the round has advanced
  void nextRound(Function(T) expectation) {
    for (final p in _players) {
      _read.gameFor(p.id).gameClient.newRound();
    }
    expectation(game);
  }
}
