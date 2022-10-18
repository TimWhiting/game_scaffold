import 'dart:io';

import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/games.dart';
import 'package:test/test.dart';

Future<void> main() async {
  registerTicTacToe();
  late ProviderContainer rootProvider;
  late ProviderContainer p1Game;
  final _ = IOServer();
  setUp(() {
    rootProvider = ProviderContainer();
    p1Game = ProviderContainer(
      parent: rootProvider,
      overrides: [playerIDProvider.overrideWithValue('1')],
    );
  });
  test('io', () async {
    rootProvider.read(serviceType.notifier).state = IOService;
    rootProvider.read(remoteUriProvider.notifier).state =
        Uri.parse('http://localhost:$defaultGamePort');

    expect(p1Game.read(GameProviders.status), null);
    final gClient = p1Game.listen(gameClientProvider, (_, __) {});
    final gClientState = p1Game.listen(gameInfoProvider, (_, __) {});

    gClient.read().setGameConfig(const GameConfig(gameType: 'tictactoe'));
    final code = await gClient.read().createGame();
    expect(p1Game.read(GameProviders.status), null);
    assert(gClientState.read().code == code, 'Code is set');
    await gClient.read().joinGame();
    await Future.delayed(const Duration(milliseconds: 1));
    expect(p1Game.read(GameProviders.status), GameStatus.lobby);
  });
  await Future.delayed(const Duration(seconds: 2));
  exit(0);
}
