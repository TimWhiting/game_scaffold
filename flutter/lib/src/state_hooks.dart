import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension WidgetRefGameScaffoldX on WidgetRef {
  String get playerID => watch(playerIDProvider);

  /// Setup parameters
  set address(Uri address) => read(selectedAddress).state = address;
  Uri get address => watch(selectedAddress).state;
  set singleGameConfig(GameConfig config) =>
      read(singleConfigProvider).state = config;
  GameConfig get singleGameConfig => watch(singleConfigProvider).state;

  /// Setup parameters
  set clientImplementation(String implementation) =>
      read(gameLocationProvider).state = implementation;
  String get clientImplementation => watch(gameLocationProvider).state;
  GameProvider get gameProvider => watch(playerGameProvider(playerID));

  /// Client
  GameServerClient get gameClient =>
      watch(gameProvider.gameServerClientProvider);

  /// Server information
  AsyncValue<GameInfo> get lobbyInfo => watch(gameProvider.gameLobbyProvider);

  LoadingFuture<IList<GameInfo>> get gameInfos =>
      watch(gameProvider.gamesProvider);
  LastOrLoadingStateNotifier<IList<GameInfo>> get gameInfoNotifier =>
      watch(gameProvider.gamesProvider.notifier);

  /// Game setup information
  GameConfig get gameConfig => watch(gameProvider.gameConfigProvider).state;
  set gameConfig(GameConfig config) =>
      read(gameProvider.gameConfigProvider).state = config;
  String get gameCode => watch(gameProvider.gameCodeProvider).state;
  set gameCode(String code) => read(gameProvider.gameCodeProvider).state = code;

  /// Game information
  AsyncValue<Game> get gameState => watch(gameProvider.gameStateProvider);
  Game get game => gameState.data!.value;
  GameError? get gameError => watch(gameProvider.gameErrorProvider);
  GameStatus get gameStatus => watch(gameProvider.gameStatusProvider).state;
  set gameStatus(GameStatus status) =>
      read(gameProvider.gameStatusProvider).state = status;
  bool get gameTurn => watch(gameProvider.gameTurnProvider);
  String get gameName => watch(gameProvider.gameNameProvider);
  String get playerName => watch(gameProvider.playerNameProvider).state;
}
