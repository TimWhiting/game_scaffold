import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../game_scaffold_dart.dart';

part 'round_client.freezed.dart';
part 'round_client.g.dart';

@Riverpod(dependencies: [MultiplayerRoundClient, CurrentPlayerID])
RoundInfo roundInfo(RoundInfoRef ref) => ref
    .watch(multiplayerRoundClientProvider(ref.watch(currentPlayerIDProvider)));

@Riverpod(dependencies: [MultiplayerRoundClient, CurrentPlayerID])
MultiplayerRoundClient roundClient(RoundClientRef ref) =>
    ref.watch(multiplayerRoundClientProvider(ref.watch(currentPlayerIDProvider))
        .notifier);

extension on GameClientInfo {
  RoundInfo get initial =>
      RoundInfo(null, code: this.code ?? '', playerName: this.playerName ?? '');
}

@Riverpod(dependencies: [
  SingleConfig,
  MultiplayerGameClient,
  roundService,
  CurrentPlayerID,
])
class MultiplayerRoundClient extends _$MultiplayerRoundClient {
  @override
  RoundInfo build(PlayerID multiplayerID) {
    this.multiplayerID = multiplayerID;
    final service = ref.watch(roundServiceProvider(multiplayerID));
    state = ref.watch(multiplayerGameClientProvider(multiplayerID)).initial;
    if (state.code.isNotEmpty && state.code.length == 4) {
      connect(service);
    }
    return state;
  }

  @override
  late PlayerID multiplayerID;

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

  Future<bool> sendEvent<E extends Event>(E e) =>
      service((c) => c.sendEvent(multiplayerID, state.code, e));

  Future<bool> newRound() =>
      service((c) => c.newRound(multiplayerID, state.code));

  Future<bool> exitGame() {
    final result = service((c) => c.exitGame(multiplayerID, state.code));
    ref.read(multiplayerGameClientProvider(multiplayerID).notifier).exitGame();
    return result;
  }
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
  GameStatus? get status => inLobby ? GameStatus.lobby : game?.status;
  String? get gameType => game?.game.type;
}
