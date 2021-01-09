import 'package:flutter/material.dart';
import 'package:game_scaffold/game_scaffold.dart';
import 'package:hooks_riverpod/all.dart';

void main() {
  runApp(ProviderScope(child: TicTacToeApp()));
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToe(),
    );
  }
}

class TicTacToe extends StatelessWidget {
  const TicTacToe();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Row(children: [
      ProviderScope(
        overrides: [playerIDProvider.overrideAs((watch) => '0')],
        child: Player(),
      ),
      ProviderScope(
        overrides: [playerIDProvider.overrideAs((watch) => '1')],
        child: Player(),
      ),
    ]));
  }
}

class Player extends GameHookWidget {
  @override
  Widget buildWithGame(
      BuildContext context, String playerID, GameProvider gameProvider) {
    return Container();
  }
}
