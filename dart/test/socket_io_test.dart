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
    registerIOClients();
  });
  test('io', () async {
    read(GameProviders.clientType.notifier).state = IOClient;
    read(GameProviders.remoteUri.notifier).state =
        Uri.parse('http://localhost:$defaultGamePort');

    expect(p1Game(GameProviders.status), GameStatus.NotConnected);
    final client = p1Game(GameProviders.client);
    final code =
        await client.createGame(config: const GameConfig(gameType: 'None'));
    expect(p1Game(GameProviders.status), GameStatus.NotJoined);
    await client.register(code: code);
    expect(p1Game, GameStatus.NotStarted);
  });
}
