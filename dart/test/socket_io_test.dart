import 'package:game_scaffold_dart/server.dart';
import 'package:test/test.dart';

void main() {
  final _ = IOServer();
  late Reader read;
  late Reader p1Game;
  late Reader p2Game;
  setUp(() {
    final rootProvider = ProviderContainer();
    read = rootProvider.read;
    p1Game = ProviderContainer(
        parent: rootProvider,
        overrides: [GameProviders.playerIDProvider.overrideWithValue(P1)]).read;
    p2Game = ProviderContainer(
        parent: rootProvider,
        overrides: [GameProviders.playerIDProvider.overrideWithValue(P2)]).read;
    registerIOClients();
  });
  test('io', () async {
    read(GameProviders.clientType).state = IOClient;
    read(GameProviders.remoteUri).state =
        Uri.parse('http://localhost:$defaultGamePort');

    expect(p1Game(GameProviders.status).state, GameStatus.NotConnected);
    final client = p1Game(GameProviders.client);
    final code =
        await client.createGame(config: const GameConfig(gameType: 'None'));
    expect(p1Game(GameProviders.status).state, GameStatus.NotJoined);
    await client.register(code: code);
    expect(p1Game, GameStatus.NotStarted);
  });
}
