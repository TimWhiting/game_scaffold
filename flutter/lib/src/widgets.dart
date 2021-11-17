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
    final conn = ref.watch(GameProviders.connected);
    final gameStatus = ref.watch(GameProviders.status);

    final pages = {'disconnected': disconnected};
    navigationLogger.info(
        'PlayerID: ${ref.read(GameProviders.playerID)} gameStatus: $gameStatus');

    if (conn) {
      pages['connected'] = connected;
      if (gameStatus != null) {
        pages['lobby'] = lobby;
        if (gameStatus != GameStatus.Lobby) {
          if (gameStatus == GameStatus.BetweenRounds && betweenRounds != game) {
            pages['started'] = betweenRounds;
          } else if (gameStatus == GameStatus.Finished && gameOver != game) {
            pages['started'] = gameOver;
          } else {
            pages['started'] = game;
          }
        }
      }
    }

    return Navigator(
      pages: pages.entries
          .map(
            (entry) => MaterialPage(
              key: ValueKey(entry.key),
              child: entry.value,
              arguments: entry.key,
            ),
          )
          .toList(),
      onPopPage: (route, p) {
        navigationLogger.info('Popping route ${route.settings.arguments}');
        final status = route.settings.arguments as String?;
        if (status == 'lobby' || status == 'started') {
          ref.refresh(GameProviders.exitGame);
          ref.read(GameProviders.exitGame.future);
          ref.refresh(GameProviders.allGames);
          route.didPop(null);
          return true;
        } else if (status == 'connected') {
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
