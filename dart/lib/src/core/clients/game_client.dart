import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../game_scaffold_dart.dart';
part 'game_client.freezed.dart';

final gameInfoProvider = Provider<GameClientInfo>(
  (ref) =>
      ref.watch(multiplayerGameClientProvider(ref.watch(playerIDProvider))),
  dependencies: [
    multiplayerGameClientProvider,
    playerIDProvider,
  ],
);

final gameClientProvider = Provider<MultiplayerGameClient>(
  (ref) => ref.watch(
      multiplayerGameClientProvider(ref.watch(playerIDProvider)).notifier),
  dependencies: [
    multiplayerGameClientProvider,
    playerIDProvider,
  ],
);

final multiplayerGameClientProvider = StateNotifierProvider.family<
    MultiplayerGameClient, GameClientInfo, PlayerID>(
  MultiplayerGameClient.new,
  dependencies: [
    singleConfig,
    gameService,
  ],
  name: 'MultiplayerGameClient',
);

class MultiplayerGameClient extends StateNotifier<GameClientInfo> {
  @override
  MultiplayerGameClient(this.ref, this.multiplayerID)
      : super(const GameClientInfo(null)) {
    final service = ref.watch(gameService);

    connect(service);
  }
  final PlayerID multiplayerID;
  final StateNotifierProviderRef ref;

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
        ref.listen(singleConfig, (_, value) {
          setGameConfig(value);
        });
        ref.onDispose(service.disconnect);
      } else {
        if (mounted) {
          state = state.copyWith(service: null);
        }
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
  bool get canCreateGame => connected && config != null;
  bool get canJoinGame => connected && code != null;
}
