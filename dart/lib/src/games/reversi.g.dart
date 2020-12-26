// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reversi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReversiGame _$_$_ReversiGameFromJson(Map<String, dynamic> json) {
  return _$_ReversiGame(
    generic: json['generic'],
    board: (json['board'] as List)?.map((e) => e as String)?.toList(),
    type: json['type'] as String ?? 'Reversi',
  );
}

Map<String, dynamic> _$_$_ReversiGameToJson(_$_ReversiGame instance) =>
    <String, dynamic>{
      'generic': instance.generic,
      'board': instance.board,
      'type': instance.type,
    };

_$_ReversiGameEvent _$_$_ReversiGameEventFromJson(Map<String, dynamic> json) {
  return _$_ReversiGameEvent(
    json['id'] as String,
    json['location'] as int,
  );
}

Map<String, dynamic> _$_$_ReversiGameEventToJson(
        _$_ReversiGameEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
    };
