import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core.dart';
part 'reversi.freezed.dart';
part 'reversi.g.dart';

@freezed
abstract class ReversiGame with _$ReversiGame implements Game {
  const ReversiGame._();
  static const width = 8;
  const factory ReversiGame({
    KtList<Player> players,
    DateTime time,
    KtList<GameMessage> messages,
    GameStatus gameStatus,
    int currentPlayerIndex,
    int round,
    List<PlayerID> board,
  }) = _ReversiGame;
  factory ReversiGame.fromJson(Map<String, dynamic> map) =>
      _$ReversiGameFromJson(map);

  @override
  Game next(Event event, Reader container) {
    return this;
  }

  @override
  Game moveNextRound(Reader container) {
    return this;
  }

  @override
  Game addMessage(GameMessage msg) {
    // TODO: implement addMessage
    throw UnimplementedError();
  }

  @override
  void register() {
    Game.registerGameType(
      'ReversiGame',
      name: 'Reversi',
      fromJson: (json) => ReversiGame.fromJson(json),
      intialState: (config, players) => ReversiGame(),
      gameEventFromJson: (j) => ReversiGameEvent.fromJson(j).asGameEvent,
    );
  }
}

@freezed
abstract class ReversiGameEvent with _$ReversiGameEvent implements Event {
  const factory ReversiGameEvent(PlayerID id, int location) = _ReversiGameEvent;
  factory ReversiGameEvent.fromJson(Map<String, dynamic> map) =>
      _$ReversiGameEventFromJson(map);
}
