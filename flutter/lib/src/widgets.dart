// ignore_for_file: do_not_use_environment

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

@visibleForTesting
bool multiplayerOverride = false;
bool get multiplayerTest =>
    const bool.fromEnvironment('MULTIPLAYER_TEST') || multiplayerOverride;

final navigationLogger = Logger('GameNavigator');
final isDesktop = !(kIsWeb || isMobile);
final isMobile = Platform.isAndroid || Platform.isIOS;
final List<GlobalKey> apps = [GlobalKey(debugLabel: 'Player 0')];

class MultiPlayerWidget extends HookConsumerWidget {
  const MultiPlayerWidget({
    required this.app,
    required this.code,
    this.additionalOptions,
    Key? key,
  }) : super(key: key);
  final String? code;
  final Widget Function(int, String?, Key) app;
  final Widget? additionalOptions;

  static const addPlayerKey = ValueKey('addPlayer');
  static ValueKey<String> getPlayerNumberKey(int index) =>
      ValueKey('playerNumber$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numPlayers = useState(1);
    final lock = useState(false);
    final currentApp = useState(0);
    final sideBySide = useState(isDesktop);
    if (multiplayerTest) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: sideBySide.value
                  ? Row(
                      children: [
                        for (var i = 0; i < apps.length; i++)
                          Expanded(child: app(i, code, apps[i])),
                      ],
                    )
                  : IndexedStack(
                      index: currentApp.value,
                      children: [
                        for (var i = 0; i < apps.length; i++)
                          app(i, code, apps[i])
                      ],
                    ),
            ),
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!sideBySide.value)
                            for (var i = 0; i < numPlayers.value; i++)
                              IconButton(
                                padding: EdgeInsets.zero,
                                key: getPlayerNumberKey(i),
                                icon: Text('$i'),
                                onPressed: () {
                                  currentApp.value = i;
                                },
                              ),
                          if (!lock.value) ...[
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                numPlayers.value--;
                                apps.removeLast();
                              },
                            ),
                            IconButton(
                              key: addPlayerKey,
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                numPlayers.value++;
                                final id = apps.length;
                                apps.add(
                                  GlobalKey(debugLabel: 'Player $id'),
                                );
                              },
                            ),
                          ],
                          IconButton(
                            icon: lock.value
                                ? const Icon(Icons.lock_open)
                                : const Icon(Icons.lock),
                            onPressed: () {
                              lock.value = !lock.value;
                            },
                          ),
                          IconButton(
                            icon: sideBySide.value
                                ? const Icon(Icons.tab)
                                : const Icon(Icons.calendar_view_week),
                            onPressed: () {
                              sideBySide.value = !sideBySide.value;
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 20),
                          DropdownButton<ServiceType>(
                            value: ref.watch(serviceType),
                            items: [
                              for (final backendType
                                  in ref.watch(allServiceTypes))
                                DropdownMenuItem<ServiceType>(
                                  value: backendType,
                                  child: Text(backendType),
                                ),
                            ],
                            onChanged: (v) =>
                                ref.read(serviceType.notifier).state = v!,
                          ),
                          const SizedBox(width: 20),
                          if (additionalOptions != null) ...[
                            additionalOptions!,
                            const SizedBox(width: 20),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
    } else {
      return app(
        0,
        code,
        apps[0],
      );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('code', code));
    properties.add(
        ObjectFlagProperty<Widget Function(int p1, String? p2, Key p3)>.has(
            'app', app));
  }
}

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
    final conn = ref.watch(gameInfoProvider.select((r) => r.connected));
    final gameStatus = ref.watch(GameProviders.status);
    print('Game Status: $gameStatus');

    final pages = {'disconnected': disconnected};
    navigationLogger.info(
        'PlayerID: ${ref.read(playerIDProvider)} gameStatus: $gameStatus');

    if (conn) {
      pages['connected'] = connected;
      if (gameStatus != null) {
        pages['lobby'] = lobby;
        if (gameStatus != GameStatus.lobby) {
          if (gameStatus == GameStatus.betweenRounds && betweenRounds != game) {
            pages['started'] = betweenRounds;
          } else if (gameStatus == GameStatus.finished && gameOver != game) {
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
          // ignore: unused_result
          ref.refresh(GameProviders.exitGame);
          ref.read(GameProviders.exitGame.future);
          ref.read(gameClientProvider).fetchOldGames();
          route.didPop(null);
          return true;
        } else if (status == 'connected') {
          ref.read(gameService).disconnect();
          return true;
        }
        return false;
      },
    );
  }
}
