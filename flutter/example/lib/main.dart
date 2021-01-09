import 'package:flutter/material.dart';
import 'package:game_scaffold/game_scaffold.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:game_scaffold_dart/games.dart';
import 'package:logging/logging.dart';

void main() {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerOnDeviceClients();
  Logger.root.clearListeners();
  Logger.root.level = Level.FINE;
  Logger.root.onRecord.listen((record) =>
      print('[${record.level}] ${record.loggerName}: ${record.message}'));
  runApp(ProviderScope(
    overrides: [
      gameLocationProvider
          .overrideWithProvider(StateProvider((_) => OnDeviceLocation)),
    ],
    child: TicTacToeApp(),
  ));
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
      ),
      home: TicTacToeWidget(),
    );
  }
}

class TicTacToeWidget extends StatelessWidget {
  const TicTacToeWidget();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Row(children: [
        Expanded(
          child: ProviderScope(
            overrides: [playerIDProvider.overrideAs((watch) => P1)],
            child: Player(),
          ),
        ),
        Container(width: 10, color: Colors.black),
        Expanded(
          child: ProviderScope(
            overrides: [playerIDProvider.overrideAs((watch) => P2)],
            child: Player(),
          ),
        ),
      ]),
    ));
  }
}

class Player extends GameHookWidget {
  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    return GameNavigator(
      connected: CreateOrJoinWidget(),
      lobby: LobbyWidget(),
      game: GameWidget(),
    );
  }
}

class CreateOrJoinWidget extends GameHookWidget {
  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    final playerID = gameProvider.playerID;
    final code = gameProvider.useGameCode;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('Player $playerID'),
            SizedBox(height: 20),
            if (playerID == P1)
              RaisedButton(
                child: Text('Create Game'),
                onPressed: () async {
                  final id = await context.gameClient(playerID).createGame(
                        config: GameConfig(
                          adminId: P1,
                          customNames: false,
                          gameType: 'tictactoe',
                          rounds: 2,
                          maxPlayers: 2,
                        ),
                      );
                  await context.gameClient(playerID).register(code: id);
                },
              ),
            if (playerID == P2) ...[
              SizedBox(
                width: 200,
                height: 30,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(hintText: 'Enter Game Code'),
                  onChanged: (text) => context.setGameCode(playerID, text),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () =>
                    context.gameClient(playerID).register(code: code),
                child: Text('Join Game'),
              )
            ]
          ],
        ),
      ),
    );
  }
}

class LobbyWidget extends GameHookWidget {
  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    final lobby = gameProvider.useLobbyInfo;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          SizedBox(height: 40),
          Text('Lobby'),
          Text('$lobby'),
        ]),
      ),
    );
  }
}

class GameWidget extends GameHookWidget {
  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    final gameState = gameProvider.useGameState as TicTacToeGame;
    final gameError = gameProvider.useGameError;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$gameState'),
            SizedBox(height: 20),
            for (final r in [0, 1, 2])
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final c in [0, 1, 2])
                    GestureDetector(
                      child: ColoredBox(
                        color: Colors.black,
                        child: Container(
                          width: 20,
                          height: 20,
                          color: Colors.white,
                          margin: EdgeInsets.all(1),
                          child: Center(
                            child: Text(
                              gameState.board
                                  .xOrO(gameProvider.playerID, r * 3 + c),
                            ),
                          ),
                        ),
                      ),
                      onTap: () =>
                          context.gameClient(gameProvider.playerID).sendEvent(
                                TicTacToeGameEvent(
                                    gameProvider.playerID, r * 3 + c),
                              ),
                    ),
                ],
              ),
            SizedBox(height: 20),
            Text('$gameError'),
          ],
        ),
      ),
    );
  }
}

extension TextX on KtList<String> {
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
