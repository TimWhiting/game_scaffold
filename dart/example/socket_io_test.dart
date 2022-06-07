import 'dart:io';

import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/games.dart';
import 'package:test/test.dart';

Future<void> main() async {
  TicTacToeGame.register();

  final _ = IOServer();
  late Reader read;
  late Reader p1Game;
  setUp(() {
    final rootProvider = ProviderContainer();
    read = rootProvider.read;
    p1Game = ProviderContainer(
        parent: rootProvider,
        overrides: [GameProviders.playerID.overrideWithValue(P1)]).read;
  });
  test('io', () async {
    read(GameProviders.clientType.notifier).state = IOClient;
    read(GameProviders.remoteUri.notifier).state =
        Uri.parse('http://localhost:$defaultGamePort');

    expect(p1Game(GameProviders.status), null);
    p1Game(GameProviders.config.notifier).state =
        const GameConfig(gameType: 'tictactoe');
    final code = await p1Game(GameProviders.createGame.future);
    expect(p1Game(GameProviders.status), null);
    p1Game(GameProviders.code.notifier).state = code;
    await p1Game(GameProviders.joinGame.future);
    await Future.delayed(const Duration(milliseconds: 1));
    expect(p1Game(GameProviders.status), GameStatus.lobby);
  });
  await Future.delayed(const Duration(seconds: 2));
  exit(0);
}
