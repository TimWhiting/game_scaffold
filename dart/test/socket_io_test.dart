import 'package:game_scaffold_dart/server.dart';
import 'package:test/test.dart';

void main() {
  final _ = IOServer();
  late Reader read;
  late Reader p1Game;
  setUp(() {
    final rootProvider = ProviderContainer();
    read = rootProvider.read;
    p1Game = ProviderContainer(
        parent: rootProvider,
        overrides: [GameProviders.playerID.overrideWithValue(P1)]).read;
  });
  test('io', () async {
    read(GameProviders.clientType.notifier).state = IOClient;
    read(GameProviders.remoteUri.notifier).state =
        Uri.parse('http://localhost:$defaultGamePort');

    expect(p1Game(GameProviders.status), GameStatus.NotConnected);
    p1Game(GameProviders.config.notifier).state =
        const GameConfig(gameType: 'None');
    final code = await p1Game(GameProviders.createGame.future);
    expect(p1Game(GameProviders.status), GameStatus.NotJoined);
    p1Game(GameProviders.code.notifier).state = code;
    await p1Game(GameProviders.joinGame.future);
    expect(p1Game, GameStatus.NotStarted);
  });
}
