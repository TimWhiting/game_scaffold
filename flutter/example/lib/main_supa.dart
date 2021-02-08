import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:game_scaffold/game_scaffold.dart';
import 'package:game_scaffold_games/games.dart';
import 'package:logging/logging.dart';
import 'package:supabase/supabase.dart';
import 'main.dart';

void main() {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerSupabaseServerClients();
  final url = Platform.environment['SUPAURL'] ?? '';
  final key = Platform.environment['SUPAKEY'] ?? '';
  if (url == '' || key == '') {
    stderr.writeln(
        'Please make sure the SUPAURL and SUPAKEY environment variables are set to your SUPA database');

    print('url "$url", key "$key"');
    exit(1);
  }
  Logger.root.clearListeners();
  Logger.root.level = Level.FINEST;

  Logger.root.onRecord.listen((record) =>
      print('[${record.level}] ${record.loggerName}: ${record.message}'));
  runApp(ProviderScope(
    overrides: [
      gameLocationProvider
          .overrideWithProvider(StateProvider((ref) => SupabaseLocation)),
      supabaseProvider.overrideWithProvider(
        Provider(
          (_) => SupabaseClient(url, key),
        ),
      ),
    ],
    child: TicTacToeApp(),
  ));
}
