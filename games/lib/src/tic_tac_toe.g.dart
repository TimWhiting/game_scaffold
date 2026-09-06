// GENERATED CODE - DO NOT MODIFY BY HAND

// dart format width=80

part of 'tic_tac_toe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicTacToeGameEvent _$TicTacToeGameEventFromJson(Map<String, dynamic> json) =>
    _TicTacToeGameEvent(
      player: (json['player'] as num).toInt(),
      location: (json['location'] as num).toInt(),
    );

Map<String, dynamic> _$TicTacToeGameEventToJson(_TicTacToeGameEvent instance) =>
    <String, dynamic>{'player': instance.player, 'location': instance.location};

_TicTacToeGame _$TicTacToeGameFromJson(Map<String, dynamic> json) =>
    _TicTacToeGame(
      board: IList<int?>.fromJson(
        json['board'],
        (value) => (value as num?)?.toInt(),
      ),
      currentPlayer: (json['currentPlayer'] as num).toInt(),
      type: json['type'] as String? ?? 'tictactoe',
    );

Map<String, dynamic> _$TicTacToeGameToJson(_TicTacToeGame instance) =>
    <String, dynamic>{
      'board': instance.board.toJson((value) => value),
      'currentPlayer': instance.currentPlayer,
      'type': instance.type,
    };
