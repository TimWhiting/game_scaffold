import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension WidgetRefGameScaffoldX on WidgetRef {
  String get playerID => read(playerIDProvider);

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
  GameProvider get gameProvider => read(playerGameProvider(playerID));

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
