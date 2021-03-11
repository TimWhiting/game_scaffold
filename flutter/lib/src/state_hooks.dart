import 'package:flutter/material.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension BuildContextGameScaffoldX on BuildContext {
  String get id => read(playerIDProvider);

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
  GameProvider get gameProvider => read(playerGameProvider(id));

  /// Client
  GameServerClient get gameClient =>
      read(gameProvider.gameServerClientProvider);

  /// Server information
  GameInfo? get currentGameInfo => read(gameProvider.gameInfoProvider).state;
  GameInfo? get lobbyInfo => read(gameProvider.gameLobbyProvider).state;

  Future<IList<GameInfo>> get gameInfos =>
      read(gameProvider.gamesProvider.future);

  /// Game setup information
  GameConfig get gameConfig => read(gameProvider.gameConfigProvider).state;
  void setGameConfig(GameConfig config) =>
      read(gameProvider.gameConfigProvider).state = config;
  String get gameCode => read(gameProvider.gameCodeProvider).state;
  void setGameCode(String code) =>
      read(gameProvider.gameCodeProvider).state = code;

  /// Game information
  Game? get gameState => read(gameProvider.gameStateProvider).state;
  GameError? get gameError => read(gameProvider.gameErrorProvider).state;
  GameStatus get gameStatus => read(gameProvider.gameStatusProvider).state;
  void setGameStatus(GameStatus status) =>
      read(gameProvider.gameStatusProvider).state = status;
  bool get gameTurn => read(gameProvider.gameTurnProvider);
  String get gameName => read(gameProvider.gameNameProvider);
  String? get playerName => read(gameProvider.playerNameProvider).state;
}

extension GameProviderHooksX on GameProvider {
  /// Client
  GameServerClient get useGameClient => useProvider(gameServerClientProvider);

  /// Server information
  GameInfo? get useCurrentGameInfo => useProvider(gameInfoProvider).state;
  GameInfo? get useLobbyInfo => useProvider(gameLobbyProvider).state;

  Future<IList<GameInfo>> get useGameInfos => useProvider(gamesProvider.future);

  /// Game setup information
  GameConfig get useGameConfig => useProvider(gameConfigProvider).state;
  set gameConfig(GameConfig config) =>
      useProvider(gameConfigProvider).state = config;
  String get useGameCode => useProvider(gameCodeProvider).state;
  set gameCode(String code) => useProvider(gameCodeProvider).state = code;

  /// Game information
  Game? get useGameState => useProvider(gameStateProvider).state;
  GameError? get useGameError => useProvider(gameErrorProvider).state;
  GameStatus get useGameStatus => useProvider(gameStatusProvider).state;
  bool get useGameTurn => useProvider(gameTurnProvider);
  String get useGameName => useProvider(gameNameProvider);
  String? get usePlayerName => useProvider(playerNameProvider).state;
}

String usePlayerID() => useProvider(playerIDProvider);

/// Setup parameters
String useAddress(String id) => useProvider(selectedAddress).state;

GameProvider useGameProvider(String id) => useProvider(playerGameProvider(id));

/// Client
GameServerClient useGameClient(GameProvider g) =>
    useProvider(g.gameServerClientProvider);

/// Server information
GameInfo? useCurrentGameInfo(GameProvider g) =>
    useProvider(g.gameInfoProvider).state;
GameInfo? useLobbyInfo(GameProvider g) =>
    useProvider(g.gameLobbyProvider).state;
Future<IList<GameInfo>> useGameInfos(GameProvider g) =>
    useProvider(g.gamesProvider.future);

/// Game setup information
GameConfig useGameConfig(GameProvider g) =>
    useProvider(g.gameConfigProvider).state;
String useGameCode(GameProvider g) => useProvider(g.gameCodeProvider).state;

/// Game information
Game? useGameState(GameProvider g) => useProvider(g.gameStateProvider).state;
GameError? useGameError(GameProvider g) =>
    useProvider(g.gameErrorProvider).state;
GameStatus useGameStatus(GameProvider g) =>
    useProvider(g.gameStatusProvider).state;
bool useGameTurn(GameProvider g) => useProvider(g.gameTurnProvider);
String useGameName(GameProvider g) => useProvider(g.gameNameProvider);
String? usePlayerName(GameProvider g) =>
    useProvider(g.playerNameProvider).state;
