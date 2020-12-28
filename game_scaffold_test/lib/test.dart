import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:test/test.dart';

void testGame(
  String name,
  GameConfig config,
  List<Player> players,
  List<Event> events,
  List<GameOrError> expected,
) async {
  final read = ProviderContainer().read;
  read(gameLocationProvider).state = OnDeviceLocation;
  read(gameConfigProvider).state = config;
  await read(gameServerClientProvider(players.first.id)).createGame();
  for (final p in players) {
    await read(gameClientProvider(p.id)).register();
  }
  read(gameClientProvider(players.first.id)).startGame();
  for (final index in 0.rangeTo(events.length)) {
    read(gameProvider).handleEvent(events[index]);
    if (expected[index].isError) {
      expect(read(gameErrorProvider).error, expected[index].error);
    }
    expect(read(gameProvider).gameState, expected[index].value);
  }
}
