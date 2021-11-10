import 'dart:io';

import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_games/games.dart';

// ignore_for_file: avoid_print
Future<void> main(List<String> arguments) async {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  final rootProvider = ProviderContainer();
  final read = rootProvider.read;
  final p1Ref = ProviderContainer(
      parent: rootProvider,
      overrides: [GameProviders.playerID.overrideWithValue(P1)]);
  final p1Reader = p1Ref.read;
  final p2Ref = ProviderContainer(
      parent: rootProvider,
      overrides: [GameProviders.playerID.overrideWithValue(P2)]);
  read(GameProviders.clientType.notifier).state = OnDeviceClient;
  const config = GameConfig(
    adminID: P1,
    customNames: false,
    gameType: 'tictactoe',
    rounds: 2,
    maxPlayers: 2,
  );

  p1Ref.read(GameProviders.config.notifier).state = config;
  final code = await p1Reader(GameProviders.createGame.future);
  await p1Reader(GameProviders.joinGame.future);
  p2Ref.read(GameProviders.code.notifier).state = code;
  await p2Ref.read(GameProviders.joinGame.future);

  print(read(GameProviders.lobby));
  late ProviderSubscription sub;
  sub = p2Ref.listen<AsyncValue<Game>>(GameProviders.game, (last, value) async {
    if (value.asData?.value.gameOver ?? false) {
      sub.close();
      return;
    }
    final gameState = value.value! as TicTacToeGame;
    print(gameState.status);
    if (gameState.gameOver || gameState.roundOver) {
      print('Round Over');
      if (gameState.isWinner(P1)) {
        print('Player 0 Wins!');
      } else if (gameState.isWinner(P2)) {
        print('Player 1 Wins!');
      } else {
        print('Draw');
      }
      print('');
      if (gameState.roundOver) {
        await p1Reader(GameProviders.newRound.future);
        await p2Ref.read(GameProviders.newRound.future);
      } else {
        print('Finished');
        print('Player 0: ${gameState.totalScores[P1]}');
        print('Player 1: ${gameState.totalScores[P2]}');
        exit(0);
      }
    } else {
      await loop(value.value!, read, {P1: p1Reader, P2: p2Ref.read}, code);
    }
  });
}

Future<void> loop(Game state, Reader read, Map<String, dynamic> playerReaders,
    GameCode code) async {
  printStateAndAction(state, read, code);
  final player = state.currentPlayer!.id;
  List<int?> location;
  do {
    final command = stdin.readLineSync();
    location = command!.split(',').map(int.tryParse).toList();
  } while (location.any((l) => l == null));

  await (playerReaders[player] as Reader)(GameProviders.sendEvent(
    TicTacToeGameEvent(player, location[0]! * 3 + location[1]!).asGameEvent,
  ).future);

  await Future.delayed(const Duration(milliseconds: 100));
  final error = (playerReaders[player] as Reader)(GameProviders.error);
  if (error.value != null) {
    print('');
    print('!!!!!!!!!!!');
    print(error.value);
    print('!!!!!!!!!!!');
    print('');
  }
}

void printStateAndAction(Game state, Reader read, GameCode code) {
  print("Player ${state.currentPlayer?.id}'s turn");
  final gameState = state as TicTacToeGame;
  String strFor(int index) => gameState.board[index] == P1
      ? 'X'
      : gameState.board[index] == P2
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
