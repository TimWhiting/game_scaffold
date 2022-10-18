import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core.dart';
import 'clients.dart';
part 'game_client.freezed.dart';
part 'game_client.g.dart';

final gameInfoProvider = Provider.autoDispose<GameClientInfo>(
  (ref) =>
      ref.watch(multiplayerGameClientProvider(ref.watch(playerIDProvider))),
  dependencies: [
    multiplayerGameClientProvider,
    playerIDProvider,
  ],
);

final gameClientProvider = Provider.autoDispose<MultiplayerGameClient>(
  (ref) => ref.watch(
      multiplayerGameClientProvider(ref.watch(playerIDProvider)).notifier),
  dependencies: [
    multiplayerGameClientProvider,
    playerIDProvider,
  ],
);

@riverpod
class MultiplayerGameClient extends _$MultiplayerGameClient {
  @override
  GameClientInfo build(PlayerID multiplayerID) {
    connect();
    return const GameClientInfo(null);
  }

  void connect() {
    final service = ref.read(gameService);
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
        ref.listen(singleConfig, (_, value) {
          setGameConfig(value);
        });
        ref.onDispose(service.disconnect);
      } else {
        state = state.copyWith(_service: null);
      }
    });
  }

  T service<T>(T Function(GameService) service) => state.connected
      ? service(state._service!)
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
    GameService? _service, {
    String? code,
    PlayerName? playerName,
    GameConfig? config,
    IList<GameInfo>? games,
  }) = _GameClientInfo;
  const GameClientInfo._();
  bool get connected => _service != null;
  bool get canCreateGame => connected && config != null;
  bool get canJoinGame => connected && code != null;
}
