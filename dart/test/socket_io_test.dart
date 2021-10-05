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
        overrides: [playerIDProvider.overrideWithValue(P1)]).read;
    p2Game = ProviderContainer(
        parent: rootProvider,
        overrides: [playerIDProvider.overrideWithValue(P2)]).read;
    registerIOClients();
  });
  test('io', () async {
    read.clientImplementation = IOServerLocation;
    read.address = Uri.parse('http://localhost:$defaultGamePort');

    expect(p1Game.gameStatus, GameStatus.NotConnected);
    final client = p1Game.gameClient;
    final code =
        await client.createGame(config: const GameConfig(gameType: 'None'));
    expect(p1Game.gameStatus, GameStatus.NotJoined);
    await client.register(code: code);
    expect(p1Game, GameStatus.NotStarted);
  });
}
