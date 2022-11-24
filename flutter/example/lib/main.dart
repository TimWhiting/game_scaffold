import 'package:flutter/material.dart';
import 'package:game_scaffold/game_scaffold.dart';
import 'package:game_scaffold_games/games.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() {
  FlutterError.demangleStackTrace = (stack) {
    if (stack is stack_trace.Trace) {
      return stack.vmTrace;
    }
    if (stack is stack_trace.Chain) {
      return stack.toTrace().vmTrace;
    }
    return stack;
  };
  registerTicTacToe();
  Logger.root.clearListeners();
  Logger.root.level = Level.FINE;
  Logger.root.onRecord.listen((record) =>
      // ignore: avoid_print
      print('[${record.level}] ${record.loggerName}: ${record.message}'));
  runApp(ProviderScope(
    overrides: [
      serviceType.overrideWith((ref) => OnDeviceService),
    ],
    child: const TicTacToeApp(),
  ));
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey,
        ),
        home: const TicTacToeWidget(),
      );
}

class TicTacToeWidget extends StatelessWidget {
  const TicTacToeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
          home: Scaffold(
        body: Row(children: [
          Expanded(
            child: ProviderScope(
              overrides: [playerIDProvider.overrideWithValue('0')],
              child: const Player(),
            ),
          ),
          Container(width: 10, color: Colors.black),
          Expanded(
            child: ProviderScope(
              overrides: [playerIDProvider.overrideWithValue('1')],
              child: const Player(),
            ),
          ),
        ]),
      ));
}

class Player extends HookConsumerWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => const GameNavigator(
        connected: CreateOrJoinWidget(),
        lobby: LobbyWidget(),
        game: GameWidget(),
      );
}

class CreateOrJoinWidget extends HookConsumerWidget {
  const CreateOrJoinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerID = ref.watch(playerIDProvider);
    // This is needed to make sure that the gameClient provider is connected prior to creating the game, otherwise
    final allGames = ref.watch(gameInfoProvider).games;
    final gameClient = ref.watch(gameClientProvider);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text('Player $playerID'),
            const SizedBox(height: 20),
            if (playerID == '0')
              ElevatedButton(
                key: Key('Create Game Button $playerID'),
                onPressed: () async {
                  gameClient.setGameConfig(const GameConfig(
                    adminID: '0',
                    customNames: false,
                    gameType: 'tictactoe',
                    rounds: 2,
                    maxPlayers: 2,
                  ));
                  await gameClient.createGame();
                  await gameClient.joinGame();
                },
                child: const Text('Create Game'),
              ),
            if (playerID == '1') ...[
              SizedBox(
                width: 200,
                height: 30,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration:
                      const InputDecoration(hintText: 'Enter Game Code'),
                  onChanged: gameClient.setGameCode,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: gameClient.joinGame,
                child: const Text('Join Game'),
              )
            ],
            if (allGames != null)
              for (final info in allGames)
                ElevatedButton(
                  onPressed: () async {
                    gameClient.setGameCode(info.gameID);
                    await gameClient.joinGame();
                  },
                  child: Text(
                      'Started Game: ${info.gameID}, Players: ${info.players}'),
                ),
          ],
        ),
      ),
    );
  }
}

class LobbyWidget extends HookConsumerWidget {
  const LobbyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lobby = ref.watch(roundInfoProvider).lobby;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 40),
          const Text('Lobby'),
          Text('$lobby'),
          if (lobby?.creator ?? false)
            ElevatedButton(
              onPressed: () => ref.read(roundClientProvider).startGame(),
              child: const Text('Start Game'),
            ),
        ]),
      ),
    );
  }
}

class GameWidget extends HookConsumerWidget {
  const GameWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(roundInfoProvider);
    final gameStatus = gameState.status;
    final playerID = ref.watch(playerIDProvider);
    ref.listen<String?>(roundInfoProvider.select((i) => i.error),
        (prevError, error) {
      if (error != prevError && error != null && error.isNotEmpty) {
        showDialog(
          context: context,
          builder: (c) => Dialog(
            backgroundColor: Colors.white,
            child: Text(error.toString()),
          ),
        );
      }
    });
    if (gameState.game == null) {
      return const CircularProgressIndicator();
    }

    final g = gameState.game as GameState<TicTacToeGameEvent, TicTacToeGame>;

    final player = g.players.indexWhere((p) => p.id == playerID);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            Text('$gameState'),
            const SizedBox(height: 20),
            for (final r in [0, 1, 2])
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final c in [0, 1, 2])
                    GestureDetector(
                      key: Key('$playerID square $r $c'),
                      onTap: () async {
                        final _ = await ref.read(roundClientProvider).sendEvent(
                              TicTacToeGameEvent(
                                  player: player, location: r * 3 + c),
                            );
                      },
                      child: ColoredBox(
                        color: Colors.black,
                        child: Container(
                          width: 20,
                          height: 20,
                          color: Colors.white,
                          margin: const EdgeInsets.all(1),
                          child: Center(
                            child: Text(
                              g.game.board.xOrO(player, r * 3 + c),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            if (gameStatus == GameStatus.betweenRounds &&
                !g.readyPlayers.contains(playerID)) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final _ = await ref.read(roundClientProvider).newRound();
                },
                child: const Text('Next Round'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

extension TextX on IList<int?> {
  String xOrO(int playerID, int location) {
    if (this[location] == null) {
      return '';
    } else if (this[location] == 0) {
      return 'X';
    } else {
      return 'O';
    }
  }
}
