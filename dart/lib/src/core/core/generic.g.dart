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
      IList<IList<double>>.fromJson(
          json['allRoundScores'],
          (value) => IList<double>.fromJson(
              value, (value) => (value as num).toDouble())),
      DateTime.parse(json['time'] as String),
      IList<GameMessage>.fromJson(json['messages'],
          (value) => GameMessage.fromJson(value as Map<String, dynamic>)),
      _$enumDecode(_$GameStatusEnumMap, json['status']),
      json['currentPlayerIndex'] as int?,
      json['round'] as int,
      json['isMultiPly'] as bool,
      json['isSimultaneousAction'] as bool,
    );

Map<String, dynamic> _$$_GenericGameToJson(_$_GenericGame instance) =>
    <String, dynamic>{
      'players': instance.players.toJson(
        (value) => value,
      ),
      'readyPlayers': instance.readyPlayers.toJson(
        (value) => value,
      ),
      'allRoundScores': instance.allRoundScores.toJson(
        (value) => value.toJson(
          (value) => value,
        ),
      ),
      'time': instance.time.toIso8601String(),
      'messages': instance.messages.toJson(
        (value) => value,
      ),
      'status': _$GameStatusEnumMap[instance.status],
      'currentPlayerIndex': instance.currentPlayerIndex,
      'round': instance.round,
      'isMultiPly': instance.isMultiPly,
      'isSimultaneousAction': instance.isSimultaneousAction,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$GameStatusEnumMap = {
  GameStatus.NotConnected: 'NotConnected',
  GameStatus.NotJoined: 'NotJoined',
  GameStatus.NotStarted: 'NotStarted',
  GameStatus.Started: 'Started',
  GameStatus.Finished: 'Finished',
  GameStatus.BetweenRounds: 'BetweenRounds',
};

_$GenericEventUndo _$$GenericEventUndoFromJson(Map<String, dynamic> json) =>
    _$GenericEventUndo();

Map<String, dynamic> _$$GenericEventUndoToJson(_$GenericEventUndo instance) =>
    <String, dynamic>{};

_$GenericEventStart _$$GenericEventStartFromJson(Map<String, dynamic> json) =>
    _$GenericEventStart();

Map<String, dynamic> _$$GenericEventStartToJson(_$GenericEventStart instance) =>
    <String, dynamic>{};

_$_GenericReadyNextRoundEvent _$$_GenericReadyNextRoundEventFromJson(
        Map<String, dynamic> json) =>
    _$_GenericReadyNextRoundEvent(
      json['player'] as String,
    );

Map<String, dynamic> _$$_GenericReadyNextRoundEventToJson(
        _$_GenericReadyNextRoundEvent instance) =>
    <String, dynamic>{
      'player': instance.player,
    };

_$GameMessage _$$GameMessageFromJson(Map<String, dynamic> json) =>
    _$GameMessage(
      json['message'] as String,
      from: json['from'] as String,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$$GameMessageToJson(_$GameMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'from': instance.from,
      'to': instance.to,
    };
