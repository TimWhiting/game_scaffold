import 'dart:io';

import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_games/games.dart';

// ignore_for_file: avoid_print
Future<void> main(List<String> arguments) async {
  registerTicTacToe();
  final rootProvider = ProviderContainer();
  final p1Ref = ProviderContainer(
      parent: rootProvider,
      overrides: [GameProviders.playerID.overrideWithValue('0')],);
  final p2Ref = ProviderContainer(
      parent: rootProvider,
      overrides: [GameProviders.playerID.overrideWithValue('1')],);
  rootProvider.read(GameProviders.clientType.notifier).state = OnDeviceClient;
  const config = GameConfig(
    adminID: '0',
    customNames: false,
    gameType: 'tictactoe',
    rounds: 2,
    maxPlayers: 2,
  );

  p1Ref.read(GameProviders.config.notifier).state = config;
  final code = await p1Ref.read(GameProviders.createGame.future);
  p1Ref.read(GameProviders.playerName.notifier).state = 'Player 1';
  p2Ref.read(GameProviders.playerName.notifier).state = 'Player 2';
  final r = await p1Ref.read(GameProviders.joinGame.future);
  p2Ref.read(GameProviders.code.notifier).state = code;
  final r1 = await p2Ref.read(GameProviders.joinGame.future);
  p1Ref.listen(GameProviders.lobby, (_, __){});
  p2Ref.listen(GameProviders.lobby, (_, __){});
  final r2 = await p1Ref.read(GameProviders.startGame.future);

  print(r);
  print(r1);
  print(r2);

  late ProviderSubscription sub;
  sub = p1Ref.listen<AsyncValue<GameState>>(
    fireImmediately: true,
    GameProviders.game,
    (last, value) async {
    print(value);
    if (value.value == null){
      return;
    }
    if (value.asData?.value.gameOver ?? false) {
      sub.close();
      return;
    }
    final gameState = value.value! as GameState<TicTacToeGame>;
    print(gameState.status);
    if (gameState.gameOver || gameState.roundOver) {
      print('Round Over');
      if (gameState.game.isWinner(0)) {
        print('Player 0 Wins!');
      } else if (gameState.game.isWinner(1)) {
        print('Player 1 Wins!');
      } else {
        print('Draw');
      }
      print('');
      if (gameState.roundOver) {
        p1Ref.refresh(GameProviders.newRound);
        await p1Ref.read(GameProviders.newRound.future);
        p2Ref.refresh(GameProviders.newRound);
        await p2Ref.read(GameProviders.newRound.future);
      } else {
        print('Finished');
        // print('Player 0: ${gameState.totalScores[P1]}');
        // print('Player 1: ${gameState.totalScores[P2]}');
        exit(0);
      }
    } else {
      await loop(gameState, {0: p1Ref, 1: p2Ref});
    }
  });
  
  await Future.delayed(const Duration(seconds: 10));
}

Future<void> loop(
  GameState<TicTacToeGame> state,
  Map<int, ProviderContainer> playerContainers,
) async {
  printStateAndAction(state);
  final player = state.game.currentPlayer;
  List<int?> location;
  do {
    final command = stdin.readLineSync();
    location = command!.split(',').map(int.tryParse).toList();
  } while (location.any((l) => l == null));

  final event = ((player: player, location: location[0]! * 3 + location[1]!), );
  playerContainers[player]!.refresh(GameProviders.sendEvent(event));
  await playerContainers[player]!.read(GameProviders.sendEvent(event).future);

  await Future.delayed(const Duration(milliseconds: 100));
  final error = playerContainers[player]!.read(GameProviders.error);
  if (error.value != null) {
    print('');
    print('!!!!!!!!!!!');
    print(error.value);
    print('!!!!!!!!!!!');
    print('');
  }
}

void printStateAndAction(GameState<TicTacToeGame> state) {
  print("Player ${state.game.currentPlayer}'s turn");
  final gameState = state as TicTacToeGame;
  String strFor(int index) => gameState.board[index] == 0
      ? 'X'
      : gameState.board[index] == 1
          ? '0'
          : ' ';
  String row(int startIndex) =>
      '${strFor(startIndex)}|${strFor(startIndex + 1)}|${strFor(startIndex + 2)}';
  print('State: ');
  print(row(0));
  print('-----');
  print(row(3));
  print('-----');
  print(row(6));

  print('');
  print('Select row, column: e.g. 0,1');
}
