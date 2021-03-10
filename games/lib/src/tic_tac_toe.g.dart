// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tic_tac_toe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicTacToeGame _$_$_TicTacToeGameFromJson(Map<String, dynamic> json) {
  return _$_TicTacToeGame(
    generic: GenericGame.fromJson(json['generic'] as Map<String, dynamic>),
    board: unmodifiableStringList.fromJson(json['board'] as List),
    type: json['type'] as String? ?? 'tictactoe',
  );
}

Map<String, dynamic> _$_$_TicTacToeGameToJson(_$_TicTacToeGame instance) =>
    <String, dynamic>{
      'generic': instance.generic,
      'board': unmodifiableStringList.toJson(instance.board),
      'type': instance.type,
    };

_$_TicTacToeGameEvent _$_$_TicTacToeGameEventFromJson(
    Map<String, dynamic> json) {
  return _$_TicTacToeGameEvent(
    json['player'] as String,
    json['location'] as int,
  );
}

Map<String, dynamic> _$_$_TicTacToeGameEventToJson(
        _$_TicTacToeGameEvent instance) =>
    <String, dynamic>{
      'player': instance.player,
      'location': instance.location,
    };
