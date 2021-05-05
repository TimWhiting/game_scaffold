import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_scaffold/game_scaffold.dart';
import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/games.dart';
import 'package:logging/logging.dart';

import 'main.dart';
void main() {
  Logger.root.clearListeners();
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) =>
      print('[${record.level}] ${record.loggerName}: ${record.message}'));
  final _ = IOServer();
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerIOClients();
  runApp(ProviderScope(
    overrides: [
      gameLocationProvider
          .overrideWithProvider(StateProvider((ref) => IOServerLocation)),
      selectedAddress.overrideWithProvider(
          StateProvider((_) => 'http://localhost:$defaultGamePort')),
    ],
    child: TicTacToeApp(),
  ));
}
