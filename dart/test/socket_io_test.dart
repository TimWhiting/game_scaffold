import 'package:game_scaffold_dart/server.dart';
import 'package:test/test.dart';

void main() {
  final _ = IOServer();
  late Reader read;
  setUp(() {
    read = ProviderContainer().read;
    registerIOClients();
  });
  test('io', () async {
    read.clientImplementation = IOServerLocation;
    read.address = 'http://localhost:$defaultGamePort';
    expect(read.gameFor(P1).gameStatus, GameStatus.NotConnected);
    final client = read.gameFor(P1).gameClient;
    final code =
        await client.createGame(config: const GameConfig(gameType: 'None'));
    expect(read.gameFor(P1).gameStatus, GameStatus.NotJoined);
    await client.register(code: code);
    expect(read.gameFor(P1), GameStatus.NotStarted);
  });
}
