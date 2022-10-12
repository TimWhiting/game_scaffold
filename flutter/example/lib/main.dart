import 'package:flutter/material.dart';
import 'package:game_scaffold/game_scaffold.dart';
import 'package:game_scaffold_games/games.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

void main() {
  registerTicTacToe();
  Logger.root.clearListeners();
  Logger.root.level = Level.FINE;
  Logger.root.onRecord.listen((record) =>
      // ignore: avoid_print
      print('[${record.level}] ${record.loggerName}: ${record.message}'));
  runApp(ProviderScope(
    overrides: [
      GameProviders.clientType
          .overrideWithProvider(StateProvider((ref) => OnDeviceClient)),
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
              overrides: [GameProviders.playerID.overrideWithValue('0')],
              child: const Player(),
            ),
          ),
          Container(width: 10, color: Colors.black),
          Expanded(
            child: ProviderScope(
              overrides: [GameProviders.playerID.overrideWithValue('1')],
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
    final playerID = ref.watch(GameProviders.playerID);
    // This is needed to make sure that the gameClient provider is connected prior to creating the game, otherwise
    final allGames = ref.watch(GameProviders.allGames);

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
                  ref.read(GameProviders.config.notifier).state =
                      const GameConfig(
                    adminID: '0',
                    customNames: false,
                    gameType: 'tictactoe',
                    rounds: 2,
                    maxPlayers: 2,
                  );
                  await ref.refresh(GameProviders.createGame.future);
                  await ref.refresh(GameProviders.joinGame.future);
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
                  onChanged: (text) =>
                      ref.read(GameProviders.code.notifier).state = text,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ref.refresh(GameProviders.joinGame.future);
                },
                child: const Text('Join Game'),
              )
            ],
            if (allGames.value != null)
              for (final info in allGames.value!)
                ElevatedButton(
                  onPressed: () async {
                    ref.read(GameProviders.code.notifier).state = info.gameID;
                    await ref.refresh(GameProviders.joinGame.future);
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
    final lobby = ref.watch(GameProviders.lobby);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 40),
          const Text('Lobby'),
          Text('${lobby.value}'),
        ]),
      ),
    );
  }
}

class GameWidget extends HookConsumerWidget {
  const GameWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(GameProviders.game);
    final gameStatus = ref.watch(GameProviders.status);
    final playerID = ref.watch(GameProviders.playerID);
    ref.listen<AsyncValue<GameError>>(GameProviders.error, (prevError, error) {
      if (error != prevError) {
        showDialog(
          context: context,
          builder: (c) => Dialog(
            backgroundColor: Colors.white,
            child: Text(error.toString()),
          ),
        );
      }
    });
    return gameState.when(
      error: (e, st) => Text('$e, $st'),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (g) {
        g as GameState<TicTacToeGame>;
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
                          await ref.refresh(GameProviders.sendEvent(
                            ((player: player, location: r * 3 + c), ),
                          ).future);
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
                                (g as TicTacToeGame)
                                    .board
                                    .xOrO(player, r * 3 + c),
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
                    await ref.refresh(GameProviders.newRound.future);
                  },
                  child: const Text('Next Round'),
                ),
              ],
            ],
          ),
        ),
      );
      },
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
