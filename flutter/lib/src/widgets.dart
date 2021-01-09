import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'state_hooks.dart';

abstract class GameHookWidget extends HookWidget {
  const GameHookWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerID = usePlayerID();
    final gameProvider = useGameProvider(playerID);
    return buildWithGame(context, gameProvider);
  }

  Widget buildWithGame(BuildContext context, GameProvider gameProvider);
}

class GameNavigator extends GameHookWidget {
  GameNavigator(
      {Widget disconnected,
      @required this.connected,
      @required this.lobby,
      @required this.game,
      Widget betweenRounds,
      Widget gameOver})
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
    final pages = [disconnected];
    if (gameStatus != GameStatus.NotConnected) {
      pages.add(connected);
      if (gameStatus != GameStatus.NotJoined) {
        pages.add(lobby);
        if (gameStatus != GameStatus.NotStarted) {
          pages.add(game);
          if (gameStatus == GameStatus.BetweenRounds && betweenRounds != game) {
            pages.add(betweenRounds);
          } else if (gameStatus == GameStatus.Finished && gameOver != game) {
            pages.add(gameOver);
          }
        }
      }
    }

    return Navigator(
        pages: pages
            .mapIndexed((index, c) => MaterialPage(
                key: Key('$index'), child: c, arguments: gameStatus))
            .toList(),
        onPopPage: (route, p) {
          final status = route.settings.arguments as GameStatus;
          if (status == GameStatus.Finished ||
              status == GameStatus.BetweenRounds ||
              status == GameStatus.Started ||
              status == GameStatus.NotStarted) {
            context.gameClient(gameProvider.playerID).exitGame();
            route.didPop(null);
            return true;
          } else if (status == GameStatus.NotJoined) {
            // context.gameClient(gameProvider.playerID).disconnect();
            context.setGameStatus(
                gameProvider.playerID, GameStatus.NotConnected);
            return true;
          }
          return false;
        });
  }
}
