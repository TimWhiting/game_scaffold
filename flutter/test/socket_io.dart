import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/game_scaffold_games.dart';

// ignore_for_file: avoid_print
Future<void> main() async {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerIOClients();
  final ioServer = IOServer();

  await test('Created', (read) async {
    final gameCode = read.gameFor(P1).gameCode;
    assert(ioServer.servers[gameCode] != null, 'Game Server Created');
    print(read.gameFor(P1).gameStatus);
    assert(read.gameFor(P1).gameStatus == GameStatus.NotJoined,
        'Game Starts out Not Joined');
  });

  await Future.delayed(const Duration(milliseconds: 100));

  await test('Registered Start Game', (read) async {
    final gameCode = read.gameFor(P1).gameCode;
    final gameClient = read.gameFor(P1).gameClient;
    await gameClient.register();
    gameClient.startGame();
    await Future.delayed(const Duration(milliseconds: 100));
    assert(ioServer.servers[gameCode]!.playerNames.length == 1,
        'One Player Joined');
    assert(read.gameFor(P1).gameState?.gameStatus == GameStatus.Started,
        'Game is Started');
  });
  assert(1 == 1, 'Success');
  print('Success!');
}

Future<void> test(String testName, Future<void> Function(Reader) testFn) async {
  print('########## Started Test $testName #########');
  final read = ProviderContainer().read;
  read.address = 'http://127.0.0.1:$defaultGamePort';
  var serverClient = read.gameFor(P1).gameClient;
  const config = GameConfig(adminId: P1, gameType: 'tictactoe');
  read.gameFor(P1).gameConfig = config;
  final code = await serverClient.createGame();
  await Future.delayed(const Duration(milliseconds: 100));
  await testFn(read);
  serverClient = read.gameFor(P1).gameClient;
  final deleted = await serverClient.deleteGame();
  print(
      '########## Finished Test $testName GameCode: $code, deleted: $deleted ##########');
}
