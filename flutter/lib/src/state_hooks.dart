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

  /// Client
  GameServerClient get watchGameClient => watch(gameServerClientProvider);
  GameServerClient get gameClient => read(gameServerClientProvider);

  /// Server information
  AsyncValue<GameInfo> get lobbyInfo => read(gameLobbyProvider);
  AsyncValue<GameInfo> get watchLobbyInfo => watch(gameLobbyProvider);

  LoadingFuture<IList<GameInfo>> get gameInfos => read(gamesProvider);
  LoadingFuture<IList<GameInfo>> get watchGameInfos => watch(gamesProvider);
  LastOrLoadingStateNotifier<IList<GameInfo>> get watchGameInfoNotifier =>
      watch(gamesProvider.notifier);
  LastOrLoadingStateNotifier<IList<GameInfo>> get gameInfoNotifier =>
      read(gamesProvider.notifier);

  /// Game setup information
  GameConfig get gameConfig => read(gameConfigProvider).state;
  GameConfig get watchGameConfig => watch(gameConfigProvider).state;
  set gameConfig(GameConfig config) => read(gameConfigProvider).state = config;
  String get gameCode => read(gameCodeProvider).state;
  String get watchGameCode => watch(gameCodeProvider).state;
  set gameCode(String code) => read(gameCodeProvider).state = code;

  /// Game information
  AsyncValue<Game> get gameState => read(gameStateProvider);
  AsyncValue<Game> get watchGameState => watch(gameStateProvider);
  Game get game => gameState.asData!.value;
  Game get watchGame => watchGameState.asData!.value;
  GameError? get gameError => read(gameErrorProvider);
  GameError? get watchGameError => watch(gameErrorProvider);
  GameStatus get gameStatus => read(gameStatusProvider).state;
  GameStatus get watchGameStatus => watch(gameStatusProvider).state;

  set gameStatus(GameStatus status) => read(gameStatusProvider).state = status;
  bool get gameTurn => read(gameTurnProvider);
  bool get watchGameTurn => watch(gameTurnProvider);
  String get gameName => read(gameNameProvider);
  String get watchGameName => watch(gameNameProvider);
  String get playerName => read(playerNameProvider).state;
  String get watchPlayerName => watch(playerNameProvider).state;
  set playerName(String name) => read(playerNameProvider).state = name;
}
