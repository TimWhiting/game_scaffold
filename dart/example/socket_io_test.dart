import 'dart:io';

import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/games.dart';
import 'package:test/test.dart';

Future<void> main() async {
  TicTacToeGame.register();
  late ProviderContainer rootProvider;
  late ProviderContainer p1Game;
  final _ = IOServer();
  setUp(() {
    rootProvider = ProviderContainer();
    p1Game = ProviderContainer(
        parent: rootProvider,
        overrides: [GameProviders.playerID.overrideWithValue(P1)]);
  });
  test('io', () async {
    rootProvider.read(GameProviders.clientType.notifier).state = IOClient;
    rootProvider.read(GameProviders.remoteUri.notifier).state =
        Uri.parse('http://localhost:$defaultGamePort');

    expect(p1Game.read(GameProviders.status), null);
    p1Game.read(GameProviders.config.notifier).state =
        const GameConfig(gameType: 'tictactoe');
    final code = await p1Game.read(GameProviders.createGame.future);
    expect(p1Game.read(GameProviders.status), null);
    p1Game.read(GameProviders.code.notifier).state = code;
    await p1Game.read(GameProviders.joinGame.future);
    await Future.delayed(const Duration(milliseconds: 1));
    expect(p1Game.read(GameProviders.status), GameStatus.lobby);
  });
  await Future.delayed(const Duration(seconds: 2));
  exit(0);
}
