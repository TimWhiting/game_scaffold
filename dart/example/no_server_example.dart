import 'dart:io';

import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_dart/src/core/backend.dart';
import 'package:game_scaffold_games/games.dart';

Future<void> main(List<String> arguments) async {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerOnDeviceClients();
  final Reader read = ProviderContainer().read;
  read.clientImplementation = OnDeviceLocation;
  final p1Reader = read.gameFor(P1);
  p1Reader.gameConfig = GameConfig(
    adminId: P1,
    customNames: false,
    gameType: 'tictactoe',
    rounds: 2,
    maxPlayers: 2,
  );

  final code = await p1Reader.gameClient.createGame();
  await p1Reader.gameClient.register();
  read.gameFor(P2).gameCode = code;
  await read.gameFor(P2).gameClient.register();

  print(read.backendGame(code).gameState.playerIDs);
  print(read.backendGame(code).gameState.gameStatus);
  while (!read.backendGame(code).gameState.gameOver) {
    await loop(read, code);
  }
}

Future<void> loop(Reader read, String code) async {
  printStateAndAction(read, code);
  final player = read.backendGame(code).gameState.currentPlayer.id;
  List<int> location;
  do {
    final command = stdin.readLineSync();
    location = command.split(',').map((n) => int.tryParse(n)).toList();
  } while (location.any((l) => l == null));

  read.gameFor(player).gameClient.sendEvent(
        TicTacToeGameEvent(player, location[0] * 3 + location[1]),
      );

  await Future.delayed(Duration(milliseconds: 100));
  final error = read.backendGame(code).gameError;
  if (error != null) {
    print('');
    print('!!!!!!!!!!!');
    print(error);
    print('!!!!!!!!!!!');
    print('');
    read.backendGame(code).clearError();
  }
  final gameState = read.backendGame(code).gameState as TicTacToeGame;
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
      read.gameFor(P1).gameClient.newRound();
      read.gameFor(P2).gameClient.newRound();
    } else {
      print('Finished');
      print('Player 0: ${gameState.totalScores[P1]}');
      print('Player 1: ${gameState.totalScores[P2]}');
      exit(0);
    }
  }
}

void printStateAndAction(Reader read, String code) {
  print('Player ${read.backendGame(code).gameState.currentPlayer.id}\'s turn');
  final gameState = read.backendGame(code).gameState as TicTacToeGame;
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
