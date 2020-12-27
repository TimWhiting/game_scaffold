import 'dart:io';

import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_dart/src/core/backend.dart';
import 'package:game_scaffold_dart/src/games/tic_tac_toe.dart';

void main(List<String> arguments) {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerOnDeviceClients();

  final container = ProviderContainer();

  Result read<Result>(ProviderBase<Object, Result> p) => container.read(p);
  read(gameConfigProvider).state = GameConfig(
    adminId: P1,
    customNames: false,
    gameType: 'tictactoe',
    rounds: 2,
  );
  read(gameServerClientProvider(P1)).createGame();
  read(gameClientProvider(P1)).register();
  read(gameClientProvider(P2)).register();
  read(gameClientProvider(P1)).startGame();

  loop(read);
}

void loop(Reader container) {
  printOptions(container);
  final command = stdin.readLineSync();
  print('Command: $command');
}

void printOptions(Reader read) {
  print('Player ${read(gameProvider).state.currentPlayer.id}\'s turn');
}
