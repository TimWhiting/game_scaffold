import 'package:flutter/material.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

final navigationLogger = Logger('GameNavigator');

class GameNavigator extends HookConsumerWidget {
  const GameNavigator({
    required this.connected,
    required this.lobby,
    required this.game,
    Widget? disconnected,
    Widget? betweenRounds,
    Widget? gameOver,
    Key? key,
  })  : disconnected = disconnected ?? connected,
        betweenRounds = betweenRounds ?? game,
        gameOver = gameOver ?? game,
        super(key: key);
  final Widget disconnected;
  final Widget connected;
  final Widget lobby;
  final Widget game;
  final Widget betweenRounds;
  final Widget gameOver;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalStatus = ref.watch(GameProviders.status);
    final gameStatus = ref.watch(GameProviders.gameOrError
            .select((g) => g.asData?.value.value?.status)) ??
        generalStatus;
    final pages = {GameStatus.NotConnected: disconnected};
    navigationLogger.info(
        'PlayerID: ${ref.read(GameProviders.playerID)} gameStatus: $gameStatus');

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
              key: ValueKey(entry.key),
              child: entry.value,
              arguments: entry.key))
          .toList(),
      onPopPage: (route, p) {
        navigationLogger.info('Popping route ${route.settings.arguments}');
        final status = route.settings.arguments as GameStatus?;
        if (status == GameStatus.Finished ||
            status == GameStatus.BetweenRounds ||
            status == GameStatus.Started ||
            status == GameStatus.NotStarted) {
          ref.read(GameProviders.exitGame.future);
          ref.refresh(GameProviders.allGames);
          route.didPop(null);
          return true;
        } else if (status == GameStatus.NotJoined) {
          ref.read(GameProviders.serverClient).disconnect();
          return true;
        }
        return false;
      },
    );
  }
}

extension RefreshFuture<State> on AlwaysAliveProviderBase<AsyncValue<State>> {
  Future<State> refresh(WidgetRef ref) {
    ref.refresh(this);
    return ref.read(future);
  }
}

extension RefreshADFuture<State> on AutoDisposeProviderBase<AsyncValue<State>> {
  Future<State> refresh(WidgetRef ref) {
    ref.refresh(this);
    return ref.read(future);
  }
}
