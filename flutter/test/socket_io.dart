import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/game_scaffold_games.dart';

// ignore_for_file: avoid_print
Future<void> main() async {
  TicTacToeGame.register();
  final ioServer = IOServer();

  await test('Created', (read) async {
    final gameCode = read.gameFor(P1)(GameProviders.code);
    assert(ioServer.servers[gameCode] != null, 'Game Server Created');
    final gameStatus = read.gameFor(P1)(GameProviders.status);
    print(gameStatus);
    assert(gameStatus == null, 'Game Starts out Not Joined');
  });

  await Future.delayed(const Duration(milliseconds: 100));

  await test('Registered Start Game', (read) async {
    final gameCode = read.gameFor(P1)(GameProviders.code);
    await read.gameFor(P1)(GameProviders.joinGame.future);
    await read.gameFor(P1)(GameProviders.startGame.future);
    await Future.delayed(const Duration(milliseconds: 100));
    assert(ioServer.servers[gameCode]!.playerNames.length == 1,
        'One Player Joined');
    assert(
        read.gameFor(P1)(GameProviders.game).asData?.value.status ==
            GameStatus.Started,
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
        parent: root,
        overrides: [GameProviders.playerID.overrideWithValue(P1)]).read,
    P2: ProviderContainer(
        parent: root,
        overrides: [GameProviders.playerID.overrideWithValue(P2)]).read
  });
  root.read(GameProviders.remoteUri.notifier).state =
      Uri.parse('http://127.0.0.1:$defaultGamePort');
  const config = GameConfig(adminID: P1, gameType: 'tictactoe');
  readers.gameFor(P1)(GameProviders.config.notifier).state = config;
  final code = await readers.gameFor(P1)(GameProviders.createGame.future);
  await Future.delayed(const Duration(milliseconds: 100));
  await testFn(readers);
  final deleted = await readers.gameFor(P1)(GameProviders.deleteGame.future);
  print(
      '########## Finished Test $testName GameCode: $code, deleted: $deleted ##########');
}

class Readers {
  const Readers(this._readers);
  final Map<String, dynamic> _readers;

  Reader gameFor(String player) => _readers[player] as Reader;
}
