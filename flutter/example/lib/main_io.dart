import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/games.dart';
import 'package:logging/logging.dart';

import 'main.dart';

void main() {
  Logger.root.clearListeners();
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) =>
      // ignore: avoid_print
      print('[${record.level}] ${record.loggerName}: ${record.message}'));
  final _ = IOServer();
  TicTacToeGame.register();
  runApp(ProviderScope(
    overrides: [
      GameProviders.clientType
          .overrideWithProvider(StateProvider((ref) => IOClient)),
      GameProviders.remoteUri.overrideWithProvider(StateProvider(
          (ref) => Uri.parse('http://localhost:$defaultGamePort'))),
    ],
    child: const TicTacToeApp(),
  ));
}
