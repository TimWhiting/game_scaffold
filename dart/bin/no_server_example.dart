import 'dart:io';

import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_dart/src/core/backend.dart';
import 'package:game_scaffold_dart/src/games/tic_tac_toe.dart';

Future<void> main(List<String> arguments) async {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerOnDeviceClients();

  final container = ProviderContainer();

  Result read<Result>(ProviderBase<Object, Result> p) => container.read(p);
  read(gameLocationProvider).state = OnDeviceLocation;
  read(gameConfigProvider).state = GameConfig(
    adminId: P1,
    customNames: false,
    gameType: 'tictactoe',
    rounds: 2,
  );
  await read(gameServerClientProvider(P1)).createGame();
  await read(gameClientProvider(P1)).register();
  await read(gameClientProvider(P2)).register();
  read(gameClientProvider(P1)).startGame();
  print(read(gameProvider).gameState.playerIds.asList());
  print(read(gameProvider).gameState.gameStatus);
  while (!read(gameProvider).gameState.gameOver) {
    await loop(read);
  }
}

Future<void> loop(Reader read) async {
  printOptions(read);
  final command = stdin.readLineSync();
  print('Command: $command');
  final player = read(gameProvider).gameState.currentPlayer.id;
  List<int> location;
  do {
    location = command.split(',').map((n) => int.tryParse(n)).toList();
  } while (location.any((l) => l == null));

  read(gameClientProvider(player)).sendEvent(
    TicTacToeGameEvent(player, location[0] * 3 + location[1]).asGameEvent,
  );

  await Future.delayed(Duration(milliseconds: 100));
  final error = read(gameErrorProvider).error;
  if (error != null) {
    print('');
    print('!!!!!!!!!!!');
    print(error);
    print('!!!!!!!!!!!');
    print('');
    read(gameErrorProvider).clearError();
  }
  final gameState = read(gameProvider).gameState as TicTacToeGame;
  print(gameState.gameStatus);
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
      await read(gameClientProvider(P1)).newRound();
      await read(gameClientProvider(P2)).newRound();
    } else {
      print('Finished');
      print('Player 0: ${gameState.totalScores[P1]}');
      print('Player 1: ${gameState.totalScores[P2]}');
      exit(0);
    }
  }
}

void printOptions(Reader read) {
  print('Player ${read(gameProvider).gameState.currentPlayer.id}\'s turn');
  final gameState = read(gameProvider).gameState as TicTacToeGame;
  String strFor(int index) => gameState.board[index] == P1
      ? 'X'
      : gameState.board[index] == P2
          ? '0'
          : ' ';
  String row(int startIndex) =>
      strFor(startIndex) +
      '|' +
      strFor(startIndex + 1) +
      '|' +
      strFor(startIndex + 2);
  print('State: ');
  print(row(0));
  print('-----');
  print(row(3));
  print('-----');
  print(row(6));

  print('');
  print('Select row, column: e.g. 0,1');
}
