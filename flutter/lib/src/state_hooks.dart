import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension WidgetRefGameScaffoldX on WidgetRef {
  String get watchPlayerID => watch(playerIDProvider);
  String get playerID => read(playerIDProvider);

  /// Setup parameters
  set address(Uri address) => read(selectedAddress).state = address;
  Uri get watchAddress => watch(selectedAddress).state;
  Uri get address => read(selectedAddress).state;
  set singleGameConfig(GameConfig config) =>
      read(singleConfigProvider).state = config;
  GameConfig get watchSingleGameConfig => watch(singleConfigProvider).state;
  GameConfig get singleGameConfig => read(singleConfigProvider).state;

  /// Setup parameters
  set clientImplementation(String implementation) =>
      read(gameLocationProvider).state = implementation;
  String get watchClientImplementation => watch(gameLocationProvider).state;
  String get clientImplementation => read(gameLocationProvider).state;
  GameProvider get gameProvider => read(playerGameProvider(playerID));
  GameProvider get watchGameProvider =>
      watch(playerGameProvider(watchPlayerID));

  /// Client
  GameServerClient get watchGameClient =>
      watch(watchGameProvider.gameServerClientProvider);
  GameServerClient get gameClient =>
      read(gameProvider.gameServerClientProvider);

  /// Server information
  AsyncValue<GameInfo> get lobbyInfo => read(gameProvider.gameLobbyProvider);
  AsyncValue<GameInfo> get watchLobbyInfo =>
      watch(watchGameProvider.gameLobbyProvider);

  LoadingFuture<IList<GameInfo>> get gameInfos =>
      read(gameProvider.gamesProvider);
  LoadingFuture<IList<GameInfo>> get watchGameInfos =>
      watch(watchGameProvider.gamesProvider);
  LastOrLoadingStateNotifier<IList<GameInfo>> get watchGameInfoNotifier =>
      watch(watchGameProvider.gamesProvider.notifier);
  LastOrLoadingStateNotifier<IList<GameInfo>> get gameInfoNotifier =>
      read(gameProvider.gamesProvider.notifier);

  /// Game setup information
  GameConfig get gameConfig => read(gameProvider.gameConfigProvider).state;
  GameConfig get watchGameConfig =>
      watch(watchGameProvider.gameConfigProvider).state;
  set gameConfig(GameConfig config) =>
      read(gameProvider.gameConfigProvider).state = config;
  String get gameCode => read(gameProvider.gameCodeProvider).state;
  String get watchGameCode => watch(watchGameProvider.gameCodeProvider).state;
  set gameCode(String code) => read(gameProvider.gameCodeProvider).state = code;

  /// Game information
  AsyncValue<Game> get gameState => read(gameProvider.gameStateProvider);
  AsyncValue<Game> get watchGameState =>
      watch(watchGameProvider.gameStateProvider);
  Game get game => gameState.data!.value;
  Game get watchGame => watchGameState.data!.value;
  GameError? get gameError => read(gameProvider.gameErrorProvider);
  GameError? get watchGameError => watch(watchGameProvider.gameErrorProvider);
  GameStatus get gameStatus => read(gameProvider.gameStatusProvider).state;
  GameStatus get watchGameStatus =>
      watch(watchGameProvider.gameStatusProvider).state;

  set gameStatus(GameStatus status) =>
      read(gameProvider.gameStatusProvider).state = status;
  bool get gameTurn => read(gameProvider.gameTurnProvider);
  bool get watchGameTurn => watch(watchGameProvider.gameTurnProvider);
  String get gameName => read(gameProvider.gameNameProvider);
  String get watchGameName => watch(watchGameProvider.gameNameProvider);
  String get playerName => read(gameProvider.playerNameProvider).state;
  String get watchPlayerName =>
      watch(watchGameProvider.playerNameProvider).state;
  set playerName(String name) =>
      read(gameProvider.playerNameProvider).state = name;
}
