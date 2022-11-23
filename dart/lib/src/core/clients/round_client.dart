import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../game_scaffold_dart.dart';

part 'round_client.freezed.dart';

final roundInfoProvider = Provider.autoDispose<RoundInfo>(
  (ref) =>
      ref.watch(multiplayerRoundClientProvider(ref.watch(playerIDProvider))),
  dependencies: [
    multiplayerRoundClientProvider,
    playerIDProvider,
  ],
);

final roundClientProvider = Provider.autoDispose<MultiplayerRoundClient>(
  (ref) => ref.watch(
      multiplayerRoundClientProvider(ref.watch(playerIDProvider)).notifier),
  dependencies: [
    multiplayerRoundClientProvider,
    playerIDProvider,
  ],
);

final multiplayerRoundClientProvider =
    StateNotifierProvider.family<MultiplayerRoundClient, RoundInfo, PlayerID>(
  MultiplayerRoundClient.new,
  dependencies: [
    singleConfig,
    gameService,
  ],
);

extension on GameClientInfo {
  RoundInfo get initial =>
      RoundInfo(null, code: code!, playerName: playerName!);
}

class MultiplayerRoundClient extends StateNotifier<RoundInfo> {
  @override
  MultiplayerRoundClient(this.ref, this.multiplayerID)
      : super(ref.read(multiplayerGameClientProvider(multiplayerID)).initial) {
    final service = ref.watch(roundService);

    connect(service);
  }
  final PlayerID multiplayerID;
  final StateNotifierProviderRef ref;

  void connect(RoundService service) {
    service.connect().map((conn) {
      if (conn) {
        state = state.copyWith(service: service);
        StreamSubscription<GameError>? error;
        StreamSubscription<GameState>? round;
        final lobby = service.gameLobby(multiplayerID, state.code).listen((e) {
          if (e.status == GameStatus.started &&
              error == null &&
              round == null) {
            error = service.errorStream(multiplayerID, state.code).listen((e) {
              state = state.copyWith(error: e.message);
            });
            round = service.gameStream(multiplayerID, state.code).listen((e) {
              state = state.copyWith(game: e);
            });
          }
          state = state.copyWith(lobby: e);
        });

        ref.onDispose(() {
          service.disconnect();
          lobby.cancel();
          error?.cancel();
          round?.cancel();
        });
      } else {
        state = state.copyWith(service: null);
      }
    }).toList();
  }

  T service<T>(T Function(RoundService) service) => state.connected
      ? service(state.service!)
      : throw Exception('Not connected');

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<bool> startGame() async =>
      state.connected &&
      await service(
        (c) => c.startGame(multiplayerID, state.code),
      );
}

@freezed
class RoundInfo with _$RoundInfo {
  const factory RoundInfo(
    @protected RoundService? service, {
    required String code,
    required PlayerName playerName,
    GameInfo? lobby,
    GameState? game,
    String? error,
  }) = _RoundInfo;
  const RoundInfo._();
  bool get connected => service != null;
  bool get isStarted => game != null;
  bool get hasError => error != null;
  bool get inLobby => lobby != null && !isStarted;
}
