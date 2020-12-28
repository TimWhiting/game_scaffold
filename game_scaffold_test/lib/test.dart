import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:test/test.dart';

void testGame<T extends Game>(
  String name, {
  GameConfig config,
  List<Player> players,
  List<Event> events,
  List<Function(T, GameError)> expected,
}) {
  group(name, () {
    final read = ProviderContainer().read;
    setUp(() async {
      read(gameLocationProvider).state = OnDeviceLocation;
      read(gameConfigProvider).state = config;
      await read(gameServerClientProvider(players.first.id)).createGame();
      for (final p in players) {
        await read(gameClientProvider(p.id)).register();
      }
      read(gameClientProvider(players.first.id)).startGame();
    });
    test(name + 'tests', () {
      for (final index in 0.rangeTo(events.length - 1)) {
        if (events[index] != null) {
          read(gameProvider).handleEvent(events[index].asGameEvent);
        }

        expected[index](
            read(gameProvider).gameState, read(gameErrorProvider).error);
        if (read(gameErrorProvider).error != null) {
          read(gameErrorProvider).clearError();
        }
      }
    });
  });
}
