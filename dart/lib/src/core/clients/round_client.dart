import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core.dart';

part 'round_client.g.dart';
part 'round_client.freezed.dart';

@riverpod
class RoundClient extends _$RoundClient {
  @override
  RoundInfo build(PlayerID multiplayerID) {}

  void clearError() {
    state = state.copyWith(error: null);
  }
}

@freezed
class RoundInfo with _$RoundInfo {
  const factory RoundInfo({Lobby? lobby, GameState? game, String? error}) =
      _RoundInfo;
}
