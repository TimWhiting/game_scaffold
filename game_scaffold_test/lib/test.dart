import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:test/test.dart' as darttest;

void testGame<T extends Game>(
  String name, {
  GameConfig config,
  List<Player> players,
  void Function(GameTester<T>) test,
}) {
  darttest.group(name, () {
    final read = ProviderContainer().read;
    darttest.setUp(() async {
      read(gameLocationProvider).state = OnDeviceLocation;
      read(gameConfigProvider).state = config;
      await read(gameServerClientProvider(players.first.id)).createGame();
      for (final p in players) {
        await read(gameClientProvider(p.id)).register();
      }
      read(gameClientProvider(players.first.id)).startGame();
    });
    darttest.test(name + '_Tests', () {
      test(GameTester<T>(read));
    });
  });
}

class GameTester<T extends Game> {
  final Reader _read;

  GameTester(this._read);
  void event(Event event, Function(T, GameError) test) {
    if (event != null) {
      _read(gameProvider).handleEvent(event.asGameEvent);
    }

    final T game = _read(gameProvider).gameState;
    final error = _read(gameErrorProvider).error;
    if (error != null) {
      _read(gameErrorProvider).clearError();
    }
    test(game, error);
  }

  T get game => _read(gameProvider).gameState;
  GameError get error => _read(gameErrorProvider).error;
}
