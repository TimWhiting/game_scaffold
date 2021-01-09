import 'package:flutter/material.dart';
import 'package:game_scaffold/game_scaffold.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:game_scaffold_dart/games.dart';

void main() {
  Game.registerGeneralEvents();
  TicTacToeGame.register();
  registerOnDeviceClients();

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
    final gameStatus = gameProvider.useGameStatus;

    switch (gameStatus) {
      case GameStatus.NotConnected:
      case GameStatus.NotJoined:
        return CreateOrJoinWidget();
      case GameStatus.NotStarted:
        return LobbyWidget();
      case GameStatus.Started:
      case GameStatus.Finished:
      case GameStatus.BetweenRounds:
        return GameWidget();
    }
    throw UnimplementedError('$gameStatus status in Player widget not handled');
  }
}

class CreateOrJoinWidget extends GameHookWidget {
  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    final playerID = gameProvider.playerID;
    final code = gameProvider.useGameCode;
    return Column(
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
            onPressed: () => context.gameClient(playerID).register(code: code),
            child: Text('Join Game'),
          )
        ]
      ],
    );
  }
}

class LobbyWidget extends GameHookWidget {
  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    final lobby = gameProvider.useLobbyInfo;
    return Column(children: [
      SizedBox(height: 40),
      Text('Lobby'),
      Text('$lobby'),
    ]);
  }
}

class GameWidget extends GameHookWidget {
  @override
  Widget buildWithGame(BuildContext context, GameProvider gameProvider) {
    final gameState = gameProvider.useGameState;
    return Text('$gameState');
  }
}
