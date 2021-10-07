import 'package:flutter/material.dart';
import 'package:game_scaffold/game_scaffold.dart';
import 'package:game_scaffold_games/games.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

void main() {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerOnDeviceClients();

  Logger.root.clearListeners();
  Logger.root.level = Level.FINE;
  Logger.root.onRecord.listen((record) =>
      // ignore: avoid_print
      print('[${record.level}] ${record.loggerName}: ${record.message}'));
  runApp(ProviderScope(
    overrides: [
      GameProviders.clientType
          .overrideWithValue(StateController(OnDeviceClient)),
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
              overrides: [GameProviders.playerID.overrideWithValue(P1)],
              child: const Player(),
            ),
          ),
          Container(width: 10, color: Colors.black),
          Expanded(
            child: ProviderScope(
              overrides: [GameProviders.playerID.overrideWithValue(P2)],
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
    final code = ref.watch(GameProviders.code).state;
    // This is needed to make sure that the gameClient provider is connected prior to creating the game, otherwise
    final gameClient = ref.watch(GameProviders.client);
    final allGames = ref.watch(GameProviders.games);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text('Player $playerID'),
            const SizedBox(height: 20),
            if (playerID == P1)
              ElevatedButton(
                key: Key('Create Game Button $playerID'),
                onPressed: () async {
                  final id = await gameClient.createGame(
                    config: const GameConfig(
                      adminId: P1,
                      customNames: false,
                      gameType: 'tictactoe',
                      rounds: 2,
                      maxPlayers: 2,
                    ),
                  );
                  await gameClient.register(code: id);
                },
                child: const Text('Create Game'),
              ),
            if (playerID == P2) ...[
              SizedBox(
                width: 200,
                height: 30,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration:
                      const InputDecoration(hintText: 'Enter Game Code'),
                  onChanged: (text) =>
                      ref.read(GameProviders.code).state = text,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    ref.read(GameProviders.client).register(code: code),
                child: const Text('Join Game'),
              )
            ],
            if (allGames.hasData)
              for (final info in allGames.value)
                ElevatedButton(
                  onPressed: () {
                    ref.read(GameProviders.client).register(code: info.gameId);
                  },
                  child: Text(
                      'Started Game: ${info.gameId}, Players: ${info.players}'),
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
          Text('$lobby'),
        ]),
      ),
    );
  }
}

class GameWidget extends HookConsumerWidget {
  const GameWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(GameProviders.state);
    final gameStatus = ref.watch(GameProviders.status).state;
    final playerID = ref.watch(GameProviders.playerID);
    ref.listen(GameProviders.error, (error) {
      if (error != null) {
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
      error: (e, st, _) => Text('$e, $st'),
      loading: (_) => const Center(child: CircularProgressIndicator()),
      data: (g) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
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
                        onTap: () => ref.read(GameProviders.client).sendEvent(
                              TicTacToeGameEvent(playerID, r * 3 + c),
                            ),
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
                                    .xOrO(playerID, r * 3 + c),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              if (gameStatus == GameStatus.BetweenRounds &&
                  !g.readyPlayers.contains(playerID)) ...[
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => ref.read(GameProviders.client).newRound(),
                  child: const Text('Next Round'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

extension TextX on IList<String?> {
  String xOrO(String playerID, int location) {
    if (this[location] == null) {
      return '';
    } else if (this[location] == P1) {
      return 'X';
    } else {
      return 'O';
    }
  }
}
