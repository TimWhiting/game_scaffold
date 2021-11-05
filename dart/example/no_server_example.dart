import 'dart:io';

import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:game_scaffold_dart/src/core/backend.dart';
import 'package:game_scaffold_games/games.dart';

// ignore_for_file: avoid_print
Future<void> main(List<String> arguments) async {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerOnDeviceClients();
  final rootProvider = ProviderContainer();
  final read = rootProvider.read;
  final p1Reader = ProviderContainer(
      parent: rootProvider,
      overrides: [GameProviders.playerID.overrideWithValue(P1)]).read;
  final p2Reader = ProviderContainer(
      parent: rootProvider,
      overrides: [GameProviders.playerID.overrideWithValue(P2)]).read;
  read(GameProviders.clientType.notifier).state = OnDeviceClient;
  const config = GameConfig(
    adminId: P1,
    customNames: false,
    gameType: 'tictactoe',
    rounds: 2,
    maxPlayers: 2,
  );

  final code = await p1Reader(GameProviders.client).createGame(config: config);
  await p1Reader(GameProviders.client).register();
  await p2Reader(GameProviders.client).register(code: code);

  print(read(BackendProviders.state)!.playerIDs);
  print(read(BackendProviders.state)!.status);
  while (!read(BackendProviders.state)!.gameOver) {
    await loop(read, {P1: p1Reader, P2: p2Reader}, code);
  }
}

Future<void> loop(
    Reader read, Map<String, dynamic> playerReaders, GameCode code) async {
  printStateAndAction(read, code);
  final player = read(BackendProviders.state)!.currentPlayer!.id;
  List<int?> location;
  do {
    final command = stdin.readLineSync();
    location = command!.split(',').map(int.tryParse).toList();
  } while (location.any((l) => l == null));

  await (playerReaders[player] as Reader)(GameProviders.client).sendEvent(
    TicTacToeGameEvent(player, location[0]! * 3 + location[1]!),
  );

  await Future.delayed(const Duration(milliseconds: 100));
  final error = read(BackendProviders.error);
  if (error != null) {
    print('');
    print('!!!!!!!!!!!');
    print(error);
    print('!!!!!!!!!!!');
    print('');
    read(BackendProviders.error.notifier).clearError();
  }
  final gameState = read(BackendProviders.state) as TicTacToeGame;
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
      await (playerReaders[P1] as Reader)(GameProviders.client).newRound();
      await (playerReaders[P2] as Reader)(GameProviders.client).newRound();
    } else {
      print('Finished');
      print('Player 0: ${gameState.totalScores[P1]}');
      print('Player 1: ${gameState.totalScores[P2]}');
      exit(0);
    }
  }
}

void printStateAndAction(Reader read, GameCode code) {
  print("Player ${read(BackendProviders.state)!.currentPlayer?.id}'s turn");
  final gameState = read(BackendProviders.state)! as TicTacToeGame;
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
