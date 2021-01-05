import 'package:flutter/material.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/all.dart';

extension BuildContextGameScaffoldX on BuildContext {
  /// Setup parameters
  void setAddress(String address) => read(selectedAddress).state = address;
  String get address => read(selectedAddress).state;

  /// Setup parameters
  set clientImplementation(String implementation) =>
      read(gameLocationProvider).state = implementation;
  String get clientImplementation => read(gameLocationProvider).state;

  GameProvider gameProvider(String id) => read(playerGameProvider(id));

  /// Client
  GameServerClient gameClient(GameProvider g) =>
      read(g.gameServerClientProvider);

  /// Server information
  GameInfo currentGameInfo(GameProvider g) => read(g.gameInfoProvider).state;
  GameInfo lobbyInfo(GameProvider g) => read(g.gameLobbyProvider).state;

  Future<List<GameInfo>> gameInfos(GameProvider g) =>
      read(g.gamesProvider.future);

  /// Game setup information
  GameConfig gameConfig(GameProvider g) => read(g.gameConfigProvider).state;
  void setGameConfig(GameConfig config, GameProvider g) =>
      read(g.gameConfigProvider).state = config;
  String gameCode(GameProvider g) => read(g.gameCodeProvider).state;
  void setGameCode(GameProvider g, String code) =>
      read(g.gameCodeProvider).state = code;

  /// Game information
  Game gameState(GameProvider g) => read(g.gameStateProvider).state;
  GameStatus gameStatus(GameProvider g) => read(g.gameStatusProvider).state;
  bool gameTurn(GameProvider g) => read(g.gameTurnProvider);
  String gameName(GameProvider g) => read(g.gameNameProvider);
  String playerName(GameProvider g) => read(g.playerNameProvider).state;
}

String usePlayerID() => useProvider(playerIDProvider);

/// Setup parameters
String useAddress(String id) => useProvider(selectedAddress).state;

GameProvider useGameProvider(String id) => useProvider(playerGameProvider(id));

/// Client
GameServerClient useGameClient(GameProvider g) =>
    useProvider(g.gameServerClientProvider);

/// Server information
GameInfo useCurrentGameInfo(GameProvider g) =>
    useProvider(g.gameInfoProvider).state;
GameInfo useLobbyInfo(GameProvider g) => useProvider(g.gameLobbyProvider).state;
Future<List<GameInfo>> useGameInfos(GameProvider g) =>
    useProvider(g.gamesProvider.future);

/// Game setup information
GameConfig useGameConfig(GameProvider g) =>
    useProvider(g.gameConfigProvider).state;
String useGameCode(GameProvider g) => useProvider(g.gameCodeProvider).state;

/// Game information
Game useGameState(GameProvider g) => useProvider(g.gameStateProvider).state;
GameStatus useGameStatus(GameProvider g) =>
    useProvider(g.gameStatusProvider).state;
bool useGameTurn(GameProvider g) => useProvider(g.gameTurnProvider);
String useGameName(GameProvider g) => useProvider(g.gameNameProvider);
String usePlayerName(GameProvider g) => useProvider(g.playerNameProvider).state;
