import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_scaffold_dart/server.dart';
import 'package:game_scaffold_games/game_scaffold_games.dart';
import 'package:logging/logging.dart';

import 'main.dart';

void main() {
  Logger.root.clearListeners();
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) =>
      // ignore: avoid_print
      print('[${record.level}] ${record.loggerName}: ${record.message}'));
  final _ = IOServer();
  registerTicTacToe();
  runApp(ProviderScope(
    overrides: [
      serviceType.overrideWithProvider(StateProvider((ref) => IOService)),
      remoteUriProvider.overrideWithProvider(StateProvider(
          (ref) => Uri.parse('http://localhost:$defaultGamePort'))),
    ],
    child: const TicTacToeApp(),
  ));
}
