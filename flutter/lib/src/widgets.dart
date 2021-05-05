import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'state_hooks.dart';

abstract class GameHookWidget extends HookWidget {
  const GameHookWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerID = usePlayerID();
    final gameProvider = useGameProvider(playerID);
    return buildWithGame(context, gameProvider);
  }

  Widget buildWithGame(BuildContext context, GameProvider gameProvider);
}

class GameNavigator extends GameHookWidget {
  const GameNavigator(
      {Widget? disconnected,
      required this.connected,
      required this.lobby,
      required this.game,
      Widget? betweenRounds,
      Widget? gameOver})
      : disconnected = disconnected ?? connected,
        betweenRounds = betweenRounds ?? game,
        gameOver = gameOver ?? game;
  final Widget disconnected;
  final Widget connected;
  final Widget lobby;
  final Widget game;
  final Widget betweenRounds;
  final Widget gameOver;

  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    final gameStatus = gameProvider.useGameStatus;
    final pages = {GameStatus.NotConnected: disconnected};
    // print(
    //     'Building client ${gameProvider.playerID} with game status ${gameStatus}');
    if (gameStatus != GameStatus.NotConnected) {
      pages[GameStatus.NotJoined] = connected;
      if (gameStatus != GameStatus.NotJoined) {
        pages[GameStatus.NotStarted] = lobby;
        if (gameStatus != GameStatus.NotStarted) {
          pages[GameStatus.Started] = game;
          if (gameStatus == GameStatus.BetweenRounds && betweenRounds != game) {
            pages[GameStatus.Started] = betweenRounds;
          } else if (gameStatus == GameStatus.Finished && gameOver != game) {
            pages[GameStatus.Started] = gameOver;
          }
        }
      }
    }

    return Navigator(
      pages: pages.entries
          .map((entry) => MaterialPage(
              key: Key('${entry.key}') as LocalKey?,
              child: entry.value,
              arguments: entry.key))
          .toList(),
      onPopPage: (route, p) {
        // print('Popping ${route.settings.arguments}');
        final status = route.settings.arguments as GameStatus?;
        if (status == GameStatus.Finished ||
            status == GameStatus.BetweenRounds ||
            status == GameStatus.Started ||
            status == GameStatus.NotStarted) {
          context.gameClient.exitGame();
          route.didPop(null);
          return true;
        } else if (status == GameStatus.NotJoined) {
          context.gameClient.disconnect();
          return true;
        }
        return false;
      },
    );
  }
}
