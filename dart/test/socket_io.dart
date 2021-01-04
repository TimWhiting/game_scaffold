import 'package:game_scaffold_dart/server.dart';

import 'package:game_scaffold_dart/games.dart';

void main() async {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerIOClients();
  final ioServer = IOServer();

  await test('Created', (read) async {
    final gameCode = read(gameCodeProvider(P1)).state;
    assert(ioServer.servers[gameCode] != null);
    assert(read(gameStatusProvider(P1)).state == GameStatus.NotConnected);
  });

  await test('Registered Start Game', (read) async {
    final gameCode = read(gameCodeProvider(P1)).state;
    final gameClient = read(gameServerClientProvider(P1));
    await gameClient.register();
    gameClient.startGame();
    await Future.delayed(100.milliseconds);
    assert(ioServer.servers[gameCode].playerNames.size == 1);
    assert(read(gameStateProvider(P1)).state.gameStatus == GameStatus.Started);
  });
  assert(1 == 1);
  print('Success!');
}

Future<void> test(String testName, Future<void> Function(Reader) testFn) async {
  print('########## Started Test $testName #########');
  final read = ProviderContainer().read;
  read(selectedAddress(P1)).state = 'http://127.0.0.1:$defaultGamePort';
  var serverClient = read(gameServerClientProvider(P1));
  final config = GameConfig(adminId: P1, gameType: 'tictactoe');
  read(gameConfigProvider(P1)).state = config;
  final code = await serverClient.createGame();
  await Future.delayed(100.milliseconds);
  await testFn(read);
  serverClient = read(gameServerClientProvider(P1));
  final deleted = await serverClient.deleteGame();
  print(
      '########## Finished Test $testName GameCode: $code, deleted: $deleted ##########');
}
