import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/game_scaffold_games.dart';

void main() async {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerIOClients();
  final ioServer = IOServer();

  await test('Created', (read) async {
    final gameCode = read.gameFor(P1).gameCode;
    assert(ioServer.servers[gameCode] != null);
    print(read.gameFor(P1).gameStatus);
    assert(read.gameFor(P1).gameStatus == GameStatus.NotJoined);
  });

  await Future.delayed(100.milliseconds);

  await test('Registered Start Game', (read) async {
    final gameCode = read.gameFor(P1).gameCode;
    final gameClient = read.gameFor(P1).gameClient;
    await gameClient.register();
    gameClient.startGame();
    await Future.delayed(100.milliseconds);
    assert(ioServer.servers[gameCode].playerNames.length == 1);
    assert(read.gameFor(P1).gameState.gameStatus == GameStatus.Started);
  });
  assert(1 == 1);
  print('Success!');
}

Future<void> test(String testName, Future<void> Function(Reader) testFn) async {
  print('########## Started Test $testName #########');
  final Reader read = ProviderContainer().read;
  read.address = 'http://127.0.0.1:$defaultGamePort';
  var serverClient = read.gameFor(P1).gameClient;
  final config = GameConfig(adminId: P1, gameType: 'tictactoe');
  read.gameFor(P1).gameConfig = config;
  final code = await serverClient.createGame();
  await Future.delayed(100.milliseconds);
  await testFn(read);
  serverClient = read.gameFor(P1).gameClient;
  final deleted = await serverClient.deleteGame();
  print(
      '########## Finished Test $testName GameCode: $code, deleted: $deleted ##########');
}
