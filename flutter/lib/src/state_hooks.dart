import 'package:flutter/material.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension BuildContextGameScaffoldX on BuildContext {
  /// Setup parameters
  set address(String address) => read(selectedAddress).state = address;
  String get address => read(selectedAddress).state;
  set singleGameConfig(GameConfig config) =>
      read(singleConfigProvider).state = config;
  GameConfig get singleGameConfig => read(singleConfigProvider).state;

  /// Setup parameters
  set clientImplementation(String implementation) =>
      read(gameLocationProvider).state = implementation;
  String get clientImplementation => read(gameLocationProvider).state;
  GameProvider gameProvider(String id) => read(playerGameProvider(id));

  /// Client
  GameServerClient gameClient(String id) =>
      read(gameProvider(id).gameServerClientProvider);

  /// Server information
  GameInfo currentGameInfo(String id) =>
      read(gameProvider(id).gameInfoProvider).state;
  GameInfo lobbyInfo(String id) =>
      read(gameProvider(id).gameLobbyProvider).state;

  Future<List<GameInfo>> gameInfos(String id) =>
      read(gameProvider(id).gamesProvider.future);

  /// Game setup information
  GameConfig gameConfig(String id) =>
      read(gameProvider(id).gameConfigProvider).state;
  void setGameConfig(GameConfig config, String id) =>
      read(gameProvider(id).gameConfigProvider).state = config;
  String gameCode(String id) => read(gameProvider(id).gameCodeProvider).state;
  void setGameCode(String id, String code) =>
      read(gameProvider(id).gameCodeProvider).state = code;

  /// Game information
  Game gameState(String id) => read(gameProvider(id).gameStateProvider).state;
  GameError gameError(String id) =>
      read(gameProvider(id).gameErrorProvider).state;
  GameStatus gameStatus(String id) =>
      read(gameProvider(id).gameStatusProvider).state;
  void setGameStatus(String id, GameStatus status) =>
      read(gameProvider(id).gameStatusProvider).state = status;
  bool gameTurn(String id) => read(gameProvider(id).gameTurnProvider);
  String gameName(String id) => read(gameProvider(id).gameNameProvider);
  String playerName(String id) =>
      read(gameProvider(id).playerNameProvider).state;
}

extension GameProviderHooksX on GameProvider {
  /// Client
  GameServerClient get useGameClient => useProvider(gameServerClientProvider);

  /// Server information
  GameInfo get useCurrentGameInfo => useProvider(gameInfoProvider).state;
  GameInfo get useLobbyInfo => useProvider(gameLobbyProvider).state;

  Future<List<GameInfo>> get useGameInfos => useProvider(gamesProvider.future);

  /// Game setup information
  GameConfig get useGameConfig => useProvider(gameConfigProvider).state;
  set gameConfig(GameConfig config) =>
      useProvider(gameConfigProvider).state = config;
  String get useGameCode => useProvider(gameCodeProvider).state;
  set gameCode(String code) => useProvider(gameCodeProvider).state = code;

  /// Game information
  Game get useGameState => useProvider(gameStateProvider).state;
  GameError get useGameError => useProvider(gameErrorProvider).state;
  GameStatus get useGameStatus => useProvider(gameStatusProvider).state;
  bool get useGameTurn => useProvider(gameTurnProvider);
  String get useGameName => useProvider(gameNameProvider);
  String get usePlayerName => useProvider(playerNameProvider).state;
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
GameError useGameError(GameProvider g) =>
    useProvider(g.gameErrorProvider).state;
GameStatus useGameStatus(GameProvider g) =>
    useProvider(g.gameStatusProvider).state;
bool useGameTurn(GameProvider g) => useProvider(g.gameTurnProvider);
String useGameName(GameProvider g) => useProvider(g.gameNameProvider);
String usePlayerName(GameProvider g) => useProvider(g.playerNameProvider).state;

abstract class GameHookWidget extends HookWidget {
  const GameHookWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerID = usePlayerID();
    final gameProvider = useGameProvider(playerID);
    return buildWithGame(context, gameProvider);
  }

  Widget buildWithGame(
    BuildContext context,
    GameProvider gameProvider,
  );
}
