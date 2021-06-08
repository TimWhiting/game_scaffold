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
      gameLocationProvider
          .overrideWithProvider(StateProvider((_) => OnDeviceLocation)),
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
              overrides: [playerIDProvider.overrideAs((watch) => P1)],
              child: const Player(),
            ),
          ),
          Container(width: 10, color: Colors.black),
          Expanded(
            child: ProviderScope(
              overrides: [playerIDProvider.overrideAs((watch) => P2)],
              child: const Player(),
            ),
          ),
        ]),
      ));
}

class Player extends GameHookWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) =>
      const GameNavigator(
        connected: CreateOrJoinWidget(),
        lobby: LobbyWidget(),
        game: GameWidget(),
      );
}

class CreateOrJoinWidget extends GameHookWidget {
  const CreateOrJoinWidget({Key? key}) : super(key: key);

  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    final playerID = gameProvider.playerID;
    final code = gameProvider.useGameCode;
    // This is needed to make sure that the gameClient provider is connected prior to creating the game, otherwise
    final _ = gameProvider.useGameClient;
    final allGames = gameProvider.useGameInfos;

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
                  final id = await context.gameClient.createGame(
                    config: const GameConfig(
                      adminId: P1,
                      customNames: false,
                      gameType: 'tictactoe',
                      rounds: 2,
                      maxPlayers: 2,
                    ),
                  );
                  await context.gameClient.register(code: id);
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
                  onChanged: (text) => context.gameCode = text,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.gameClient.register(code: code),
                child: const Text('Join Game'),
              )
            ],
            if (allGames.hasData)
              for (final info in allGames.value)
                Text('Started Game: ${info.gameId}, Players: ${info.players}'),
          ],
        ),
      ),
    );
  }
}

class LobbyWidget extends GameHookWidget {
  const LobbyWidget({Key? key}) : super(key: key);
  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    final lobby = gameProvider.useLobbyInfo;
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

class GameWidget extends GameHookWidget {
  const GameWidget({Key? key}) : super(key: key);
  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    final gameState = gameProvider.useGameState as TicTacToeGame;
    final gameStatus = gameProvider.useGameStatus;
    final gameError = gameProvider.useGameError;
    return Scaffold(
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
                      key: Key('${gameProvider.playerID} square $r $c'),
                      onTap: () => context.gameClient.sendEvent(
                        TicTacToeGameEvent(gameProvider.playerID, r * 3 + c),
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
                              gameState.board
                                  .xOrO(gameProvider.playerID, r * 3 + c),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            if (gameStatus == GameStatus.BetweenRounds &&
                !gameState.readyPlayers.contains(gameProvider.playerID)) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.gameClient.newRound(),
                child: const Text('Next Round'),
              ),
            ],
            const SizedBox(height: 20),
            Text('$gameError'),
          ],
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
