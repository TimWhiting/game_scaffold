import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension BuildContextGameScaffoldX on BuildContext {
  String get id => read(playerIDProvider);

  /// Setup parameters
  set address(Uri address) => read(selectedAddress).state = address;
  Uri get address => read(selectedAddress).state;
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
  AsyncValue<GameInfo> get lobbyInfo => read(gameProvider.gameLobbyProvider);

  LoadingFuture<IList<GameInfo>> get gameInfos =>
      read(gameProvider.gamesProvider);

  /// Game setup information
  GameConfig get gameConfig => read(gameProvider.gameConfigProvider).state;
  set gameConfig(GameConfig config) =>
      read(gameProvider.gameConfigProvider).state = config;
  String get gameCode => read(gameProvider.gameCodeProvider).state;
  set gameCode(String code) => read(gameProvider.gameCodeProvider).state = code;

  /// Game information
  AsyncValue<Game> get gameState => read(gameProvider.gameStateProvider);
  Game get game => gameState.data!.value;
  GameError? get gameError => read(gameProvider.gameErrorProvider);
  GameStatus get gameStatus => read(gameProvider.gameStatusProvider).state;
  set gameStatus(GameStatus status) =>
      read(gameProvider.gameStatusProvider).state = status;
  bool get gameTurn => read(gameProvider.gameTurnProvider);
  String get gameName => read(gameProvider.gameNameProvider);
  String get playerName => read(gameProvider.playerNameProvider).state;
}

extension GameProviderHooksX on GameProvider {
  /// Client
  GameServerClient get useGameClient => useProvider(gameServerClientProvider);

  /// Server information
  AsyncValue<GameInfo> get useLobbyInfo => useProvider(gameLobbyProvider);

  LoadingFuture<IList<GameInfo>> get useGameInfos => useProvider(gamesProvider);

  /// Game setup information
  GameConfig get useGameConfig => useProvider(gameConfigProvider).state;
  set gameConfig(GameConfig config) =>
      useProvider(gameConfigProvider).state = config;
  String get useGameCode => useProvider(gameCodeProvider).state;
  set gameCode(String code) => useProvider(gameCodeProvider).state = code;

  /// Game information
  AsyncValue<Game> get useGameStateAsync => useProvider(gameStateProvider);
  Game get useGameState => useGameStateAsync.data!.value;
  GameError? get useGameError => useProvider(gameErrorProvider);
  GameStatus get useGameStatus => useProvider(gameStatusProvider).state;
  bool get useGameTurn => useProvider(gameTurnProvider);
  String get useGameName => useProvider(gameNameProvider);
  String get usePlayerName => useProvider(playerNameProvider).state;
}

String usePlayerID() => useProvider(playerIDProvider);

/// Setup parameters
Uri useAddress(String id) => useProvider(selectedAddress).state;

GameProvider useGameProvider(String id) => useProvider(playerGameProvider(id));

/// Client
GameServerClient useGameClient(GameProvider g) =>
    useProvider(g.gameServerClientProvider);

/// Server information
AsyncValue<GameInfo> useLobbyInfo(GameProvider g) =>
    useProvider(g.gameLobbyProvider);
LoadingFuture<IList<GameInfo>> useGameInfos(GameProvider g) =>
    useProvider(g.gamesProvider);

/// Game setup information
GameConfig useGameConfig(GameProvider g) =>
    useProvider(g.gameConfigProvider).state;
String useGameCode(GameProvider g) => useProvider(g.gameCodeProvider).state;

/// Game information
AsyncValue<Game> useGameStateAsync(GameProvider g) =>
    useProvider(g.gameStateProvider);
Game useGameState(GameProvider g) =>
    useProvider(g.gameStateProvider).data!.value;
GameError? useGameError(GameProvider g) => useProvider(g.gameErrorProvider);
GameStatus useGameStatus(GameProvider g) =>
    useProvider(g.gameStatusProvider).state;
bool useGameTurn(GameProvider g) => useProvider(g.gameTurnProvider);
String useGameName(GameProvider g) => useProvider(g.gameNameProvider);
String usePlayerName(GameProvider g) => useProvider(g.playerNameProvider).state;
