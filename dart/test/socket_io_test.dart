import 'package:game_scaffold_dart/server.dart';

import 'package:game_scaffold_dart/games.dart';
import 'package:test/test.dart';

void main() {
  IOServer ioServer;
  setUpAll(() {
    Game.registerGeneralEvents();
    TicTacToeGame.register();
    registerIOClients();
  });
  setUp(() {
    ioServer = IOServer();
  });
  group('IO Game Created', () {
    Reader read;
    setUpAll(() async {
      read = ProviderContainer().read;
      read(selectedAddress(P1)).state = 'http://127.0.0.1:$defaultGamePort';
      final serverClient = read(gameServerClientProvider(P1));
      final config = GameConfig(adminId: P1, gameType: 'tictactoe');
      read(gameConfigProvider(P1)).state = config;
      serverClient.connect();
      await serverClient.createGame();
    });

    test('IO CreateGame Server', () {
      final gameCode = read(gameCodeProvider(P1)).state;
      expect(ioServer.servers[gameCode], isNotNull);
      expect(
          read(gameStateProvider(P1)).state.gameStatus, GameStatus.NotStarted);
    });

    test('IO Register with server', () async {
      final gameCode = read(gameCodeProvider(P1)).state;
      final gameClient = read(gameClientProvider(P1));
      await gameClient.register();
      gameClient.startGame();
      expect(ioServer.servers[gameCode].playerNames.size, 1);
      // TODO: Verify the frontend GameStatus has changed (startGame is sort of async)
      // expect(read(gameStateProvider(P1)).state.gameStatus, GameStatus.Started);
    });
  });
}
