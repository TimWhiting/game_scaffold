// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tic_tac_toe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicTacToeGameEventImpl _$$TicTacToeGameEventImplFromJson(
        Map<String, dynamic> json) =>
    _$TicTacToeGameEventImpl(
      player: json['player'] as int,
      location: json['location'] as int,
    );

Map<String, dynamic> _$$TicTacToeGameEventImplToJson(
        _$TicTacToeGameEventImpl instance) =>
    <String, dynamic>{
      'player': instance.player,
      'location': instance.location,
    };

_$TicTacToeGameImpl _$$TicTacToeGameImplFromJson(Map<String, dynamic> json) =>
    _$TicTacToeGameImpl(
      board: IList<int?>.fromJson(json['board'], (value) => value as int?),
      currentPlayer: json['currentPlayer'] as int,
      type: json['type'] as String? ?? 'tictactoe',
    );

Map<String, dynamic> _$$TicTacToeGameImplToJson(_$TicTacToeGameImpl instance) =>
    <String, dynamic>{
      'board': instance.board.toJson(
        (value) => value,
      ),
      'currentPlayer': instance.currentPlayer,
      'type': instance.type,
    };
