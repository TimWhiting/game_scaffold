import 'package:flutter/material.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension BuildContextGameScaffoldX on BuildContext {
  /// Setup parameters
  set address(String address) => read(selectedAddress).state = address;
  String get address => read(selectedAddress).state;

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
  GameConfig get gameConfig => read(gameConfigProvider).state;
  set gameConfig(GameConfig config) => read(gameConfigProvider).state = config;
  String gameCode(String id) => read(gameCodeProvider(id)).state;

  /// Game information
  Game gameState(String id) => read(gameStateProvider(id)).state;
  GameStatus gameStatus(String id) => read(gameStatusProvider(id)).state;
  bool gameTurn(String id) => read(gameTurnProvider(id));
  String get gameName => read(gameNameProvider);
  String playerName(String id) => read(playerNameProvider(id)).state;
}
