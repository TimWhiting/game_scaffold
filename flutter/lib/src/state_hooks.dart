import 'package:flutter/material.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/all.dart';

extension BuildContextGameScaffoldX on BuildContext {
  /// Setup parameters
  void setAddress(String address, String id) =>
      read(selectedAddress(id)).state = address;
  String address(String id) => read(selectedAddress(id)).state;

  /// Setup parameters
  set clientImplementation(String implementation) =>
      read(gameLocationProvider).state = implementation;
  String get clientImplementation => read(gameLocationProvider).state;

  /// Clients
  ServerClient serverClient(String id) => read(gameServerClientProvider(id));
  GameClient gameClient(String id) => read(gameClientProvider(id));

  /// Server information
  GameInfo currentGameInfo(String id) => read(gameInfoProvider(id)).state;
  Future<List<GameInfo>> gameInfos(String id) => read(gamesProvider(id).future);

  /// Game setup information
  GameConfig gameConfig(String id) => read(gameConfigProvider(id)).state;
  void setGameConfig(GameConfig config, String id) =>
      read(gameConfigProvider(id)).state = config;
  String gameCode(String id) => read(gameCodeProvider(id)).state;

  /// Game information
  Game gameState(String id) => read(gameStateProvider(id)).state;
  GameStatus gameStatus(String id) => read(gameStatusProvider(id)).state;
  bool gameTurn(String id) => read(gameTurnProvider(id));
  String gameName(String id) => read(gameNameProvider(id));
  String playerName(String id) => read(playerNameProvider(id)).state;
}

extension WidgetsReaderGameScaffoldX on ScopedReader {
  String get id => this(playerIDProvider);

  /// Setup parameters
  set address(String address) => this(selectedAddress(id)).state = address;
  String get address => this(selectedAddress(id)).state;

  /// Setup parameters
  set clientImplementation(String implementation) =>
      this(gameLocationProvider).state = implementation;
  String get clientImplementation => this(gameLocationProvider).state;

  /// Clients
  ServerClient get serverClient => this(gameServerClientProvider(id));
  GameClient get gameClient => this(gameClientProvider(id));

  /// Server information
  GameInfo get currentGameInfo => this(gameInfoProvider(id)).state;
  Future<List<GameInfo>> get gameInfos => this(gamesProvider(id).future);

  /// Game setup information
  GameConfig get gameConfig => this(gameConfigProvider(id)).state;
  set gameConfig(GameConfig config) =>
      this(gameConfigProvider(id)).state = config;
  String get gameCode => this(gameCodeProvider(id)).state;

  /// Game information
  Game get gameState => this(gameStateProvider(id)).state;
  GameStatus get gameStatus => this(gameStatusProvider(id)).state;
  bool get gameTurn => this(gameTurnProvider(id));
  String get gameName => this(gameNameProvider(id));
  String get playerName => this(playerNameProvider(id)).state;
}

String usePlayerID() => useProvider(playerIDProvider);

/// Setup parameters
String useAddress(String id) => useProvider(selectedAddress(id)).state;

/// Clients
ServerClient useServerClient(String id) =>
    useProvider(gameServerClientProvider(id));
GameClient useGameClient(String id) => useProvider(gameClientProvider(id));

/// Server information
GameInfo useCurrentGameInfo(String id) =>
    useProvider(gameInfoProvider(id)).state;
GameInfo useLobbyInfo(String id) => useProvider(gameLobbyProvider(id)).state;
Future<List<GameInfo>> useGameInfos(String id) =>
    useProvider(gamesProvider(id).future);

/// Game setup information
GameConfig useGameConfig(String id) =>
    useProvider(gameConfigProvider(id)).state;
String useGameCode(String id) => useProvider(gameCodeProvider(id)).state;

/// Game information
Game useGameState(String id) => useProvider(gameStateProvider(id)).state;
GameStatus useGameStatus(String id) =>
    useProvider(gameStatusProvider(id)).state;
bool useGameTurn(String id) => useProvider(gameTurnProvider(id));
String useGameName(String id) => useProvider(gameNameProvider(id));
String usePlayerName(String id) => useProvider(playerNameProvider(id)).state;
