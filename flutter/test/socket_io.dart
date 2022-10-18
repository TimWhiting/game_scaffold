import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/games.dart';

// ignore: constant_identifier_names
const P1 = '0';
// ignore: constant_identifier_names
const P2 = '1';
// ignore_for_file: avoid_print
Future<void> main() async {
  registerTicTacToe();
  final ioServer = IOServer();

  await test('Created', (read) async {
    final gameCode = read.p1.read(GameProviders.code);
    assert(ioServer.servers[gameCode] != null, 'Game Server Created');
    final gameStatus = read.p1.read(GameProviders.status);
    print(gameStatus);
    assert(gameStatus == null, 'Game Starts out Not Joined');
  });

  await Future.delayed(const Duration(milliseconds: 100));

  await test('Registered Start Game', (read) async {
    final gameCode = read.p1.read(GameProviders.code);
    await read.p1G.read().joinGame();
    await read.p1R.read().startGame();
    await Future.delayed(const Duration(milliseconds: 100));
    assert(ioServer.servers[gameCode]!.playerNames.length == 1,
        'One Player Joined');
    assert(
        read.p1.read(GameProviders.game).asData?.value.status ==
            GameStatus.started,
        'Game is Started');
  });
  assert(1 == 1, 'Success');
  print('Success!');
}

Future<void> test(
    String testName, Future<void> Function(Readers) testFn) async {
  print('########## Started Test $testName #########');
  final root = ProviderContainer();
  final readers = Readers({
    P1: ProviderContainer(
        parent: root, overrides: [playerIDProvider.overrideWithValue(P1)]),
    P2: ProviderContainer(
        parent: root, overrides: [playerIDProvider.overrideWithValue(P2)])
  });
  root.read(remoteUriProvider.notifier).state =
      Uri.parse('http://127.0.0.1:$defaultGamePort');
  const config = GameConfig(adminID: P1, gameType: 'tictactoe');
  readers.p1G.read().setGameConfig(config);
  final code = await readers.p1G.read().createGame();
  await Future.delayed(const Duration(milliseconds: 100));
  await testFn(readers);
  final deleted = await readers.p1G.read().deleteGame(code);
  print(
      '########## Finished Test $testName GameCode: $code, deleted: $deleted ##########');
}

class Readers {
  const Readers(this._readers);
  final Map<String, ProviderContainer> _readers;

  ProviderContainer gameFor(String player) => _readers[player]!;
  ProviderContainer get p1 => _readers[P1]!;
  ProviderContainer get p2 => _readers[P2]!;
  ProviderSubscription<MultiplayerGameClient> get p1G =>
      p1.listen(gameClientProvider, (_, __) {});
  ProviderSubscription<MultiplayerGameClient> get p2G =>
      p2.listen(gameClientProvider, (_, __) {});
  ProviderSubscription<MultiplayerRoundClient> get p1R =>
      p1.listen(roundClientProvider, (_, __) {});
  ProviderSubscription<MultiplayerRoundClient> get p2R =>
      p2.listen(roundClientProvider, (_, __) {});
}
