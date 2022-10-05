// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenericGame _$$_GenericGameFromJson(Map<String, dynamic> json) =>
    _$_GenericGame(
      IList<Player>.fromJson(json['players'],
          (value) => Player.fromJson(value as Map<String, dynamic>)),
      IList<String>.fromJson(json['readyPlayers'], (value) => value as String),
      DateTime.parse(json['time'] as String),
      $enumDecode(_$GameStatusEnumMap, json['status']),
      json['currentPlayerIndex'] as int?,
      json['round'] as int,
    );

Map<String, dynamic> _$$_GenericGameToJson(_$_GenericGame instance) =>
    <String, dynamic>{
      'players': instance.players.toJson(
        (value) => value,
      ),
      'readyPlayers': instance.readyPlayers.toJson(
        (value) => value,
      ),
      'time': instance.time.toIso8601String(),
      'status': _$GameStatusEnumMap[instance.status]!,
      'currentPlayerIndex': instance.currentPlayerIndex,
      'round': instance.round,
    };

const _$GameStatusEnumMap = {
  GameStatus.lobby: 'lobby',
  GameStatus.started: 'started',
  GameStatus.betweenRounds: 'betweenRounds',
  GameStatus.finished: 'finished',
};

_$GenericEventUndo _$$GenericEventUndoFromJson(Map<String, dynamic> json) =>
    _$GenericEventUndo(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GenericEventUndoToJson(_$GenericEventUndo instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_GenericReadyNextRoundEvent _$$_GenericReadyNextRoundEventFromJson(
        Map<String, dynamic> json) =>
    _$_GenericReadyNextRoundEvent(
      json['player'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_GenericReadyNextRoundEventToJson(
        _$_GenericReadyNextRoundEvent instance) =>
    <String, dynamic>{
      'player': instance.player,
      'runtimeType': instance.$type,
    };

_$GameMessage _$$GameMessageFromJson(Map<String, dynamic> json) =>
    _$GameMessage(
      json['message'] as String,
      from: json['from'] as String,
      to: json['to'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GameMessageToJson(_$GameMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'from': instance.from,
      'to': instance.to,
      'runtimeType': instance.$type,
    };
