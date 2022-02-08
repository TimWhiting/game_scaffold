// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tic_tac_toe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicTacToeGame _$$_TicTacToeGameFromJson(Map<String, dynamic> json) =>
    _$_TicTacToeGame(
      board:
          IList<String?>.fromJson(json['board'], (value) => value as String?),
      type: json['type'] as String? ?? 'tictactoe',
    );

Map<String, dynamic> _$$_TicTacToeGameToJson(_$_TicTacToeGame instance) =>
    <String, dynamic>{
      'board': instance.board.toJson(
        (value) => value,
      ),
      'type': instance.type,
    };

_$_TicTacToeGameEvent _$$_TicTacToeGameEventFromJson(
        Map<String, dynamic> json) =>
    _$_TicTacToeGameEvent(
      json['player'] as String,
      json['location'] as int,
    );

Map<String, dynamic> _$$_TicTacToeGameEventToJson(
        _$_TicTacToeGameEvent instance) =>
    <String, dynamic>{
      'player': instance.player,
      'location': instance.location,
    };
