import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_scaffold_games/games.dart';
import 'package:logging/logging.dart';
// import 'package:supabase/supabase.dart' hide Provider;
// import 'main.dart';

void main() {
  TicTacToeGame.register();
  final url = Platform.environment['SUPAURL'] ?? '';
  final key = Platform.environment['SUPAKEY'] ?? '';
  if (url == '' || key == '') {
    stderr.writeln('Please make sure the SUPAURL and SUPAKEY environment variables are set to your SUPA database');

    // ignore: avoid_print
    print('url "$url", key "$key"');
    exit(1);
  }
  Logger.root.clearListeners();
  Logger.root.level = Level.FINEST;

  Logger.root.onRecord.listen((record) =>
      // ignore: avoid_print
      print('[${record.level}] ${record.loggerName}: ${record.message}'));
  // runApp(ProviderScope(
  //   overrides: [
  //     GameProviders.clientType
  //         .overrideWithValue(StateController(SupabaseLocation)),
  //     supabaseProvider.overrideWithValue(
  //       SupabaseClient(url, key),
  //     ),
  //   ],
  //   child: const TicTacToeApp(),
  // ));
}
