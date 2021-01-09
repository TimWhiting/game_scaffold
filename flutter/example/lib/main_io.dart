import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game_scaffold/game_scaffold.dart';
import 'package:game_scaffold_dart/games.dart';
import 'package:logging/logging.dart';

import 'main.dart';

void main() {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerIOClients();
  Logger.root.clearListeners();
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) =>
      print('[${record.level}] ${record.loggerName}: ${record.message}'));
  runApp(ProviderScope(
    overrides: [
      selectedAddress.overrideWithProvider(
          StateProvider((_) => 'http://localhost:$defaultGamePort')),
    ],
    child: TicTacToeApp(),
  ));
}
