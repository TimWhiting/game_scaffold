import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../game_scaffold_dart.dart';

part 'game_client.freezed.dart';
part 'game_client.g.dart';

@Riverpod(dependencies: [MultiplayerGameClient, CurrentPlayerID])
GameClientInfo gameInfo(GameInfoRef ref) => ref
    .watch(multiplayerGameClientProvider(ref.watch(currentPlayerIDProvider)));

@Riverpod(dependencies: [MultiplayerGameClient, CurrentPlayerID])
MultiplayerGameClient gameInfoClient(GameInfoRef ref) => ref.watch(
    multiplayerGameClientProvider(ref.watch(currentPlayerIDProvider)).notifier);

@Riverpod(dependencies: [SingleConfig, gameService])
class MultiplayerGameClient extends _$MultiplayerGameClient {
  @override
  GameClientInfo build(PlayerID multiplayerID) {
    this.multiplayerID = multiplayerID;
    final service = ref.watch(gameServiceProvider);

    connect(service);
    return const GameClientInfo(null);
  }

  @override
  late PlayerID multiplayerID;

  void exitGame() {
    state = state.copyWith(config: null, code: null);
    fetchOldGames();
  }

  void connect(GameService service) {
    service.connect().map((conn) {
      if (conn) {
        state = GameClientInfo(
          service,
          playerName: state.playerName,
          config: state.config,
          games: state.games,
          code: state.code,
        );
        fetchOldGames();
        ref.listen(singleConfigProvider, (_, value) {
          setGameConfig(value);
        });
        ref.onDispose(service.disconnect);
      } else {
        state = state.copyWith(service: null);
      }
    }).toList();
  }

  T service<T>(T Function(GameService) service) => state.connected
      ? service(state.service!)
      : throw Exception('Not connected');

  void setGameCode(GameCode code) => state = state.copyWith(code: code);
  void setPlayerName(PlayerName playerName) =>
      state = state.copyWith(playerName: playerName);
  void setGameConfig(GameConfig config) =>
      state = state.copyWith(config: config);
  void fetchOldGames() {
    service((c) async {
      state = state.copyWith(games: await c.getGames(multiplayerID));
    });
  }

  Future<GameCode> createGame() async {
    final code =
        await service((c) => c.createGame(multiplayerID, state.config!));
    setGameCode(code);
    return code;
  }

  Future<PlayerName?> joinGame() => service(
      (c) => c.joinGame(multiplayerID, state.code!, state.playerName ?? ''));

  Future<bool> deleteGame(GameCode code) => service((c) async {
        final result = await c.deleteGame(multiplayerID, code);
        state = state.copyWith(code: null, games: null);
        fetchOldGames();
        return result;
      });
}

@freezed
class GameClientInfo with _$GameClientInfo {
  const factory GameClientInfo(
    @protected GameService? service, {
    String? code,
    PlayerName? playerName,
    GameConfig? config,
    IList<GameInfo>? games,
  }) = _GameClientInfo;
  const GameClientInfo._();
  bool get connected => service != null;
  bool get canCreateGame => connected;
  bool get canJoinGame => connected;
}
