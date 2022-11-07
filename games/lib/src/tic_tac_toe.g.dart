// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tic_tac_toe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicTacToeGameEvent _$$_TicTacToeGameEventFromJson(
        Map<String, dynamic> json) =>
    _$_TicTacToeGameEvent(
      player: json['player'] as int,
      location: json['location'] as int,
    );

Map<String, dynamic> _$$_TicTacToeGameEventToJson(
        _$_TicTacToeGameEvent instance) =>
    <String, dynamic>{
      'player': instance.player,
      'location': instance.location,
    };

_$_TicTacToeGame _$$_TicTacToeGameFromJson(Map<String, dynamic> json) =>
    _$_TicTacToeGame(
      board: IList<int?>.fromJson(json['board'], (value) => value as int?),
      currentPlayer: json['currentPlayer'] as int,
    );

Map<String, dynamic> _$$_TicTacToeGameToJson(_$_TicTacToeGame instance) =>
    <String, dynamic>{
      'board': instance.board.toJson(
        (value) => value,
      ),
      'currentPlayer': instance.currentPlayer,
    };
