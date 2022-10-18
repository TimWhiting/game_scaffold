import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core.dart';
import 'clients.dart';

part 'round_client.g.dart';
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

@riverpod
class MultiplayerRoundClient extends _$MultiplayerRoundClient {
  @override
  RoundInfo build(PlayerID multiplayerID) {
    final gameInfo = ref.read(multiplayerGameClientProvider(multiplayerID));
    connect();
    return RoundInfo(
      null,
      code: gameInfo.code!,
      playerName: gameInfo.playerName!,
    );
  }

  void connect() {
    final service = ref.read(roundService);
    service.connect().map((conn) {
      if (conn) {
        state = state.copyWith(_service: service);
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
        state = state.copyWith(_service: null);
      }
    });
  }

  T service<T>(T Function(RoundService) service) => state.connected
      ? service(state._service!)
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
    RoundService? _service, {
    required String code,
    required PlayerName playerName,
    GameInfo? lobby,
    GameState? game,
    String? error,
  }) = _RoundInfo;
  const RoundInfo._();
  bool get connected => _service != null;
  bool get isStarted => game != null;
  bool get hasError => error != null;
  bool get inLobby => lobby != null && !isStarted;
}
