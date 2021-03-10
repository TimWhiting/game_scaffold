// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenericGame _$_$_GenericGameFromJson(Map<String, dynamic> json) {
  return _$_GenericGame(
    unmodifiablePlayerList.fromJson(json['players'] as List),
    unmodifiableStringList.fromJson(json['readyPlayers'] as List),
    unmodifiableDoubleListList.fromJson(json['allRoundScores'] as List),
    DateTime.parse(json['time'] as String),
    unmodifiableGameMessageList.fromJson(json['messages'] as List),
    _$enumDecode(_$GameStatusEnumMap, json['gameStatus']),
    json['currentPlayerIndex'] as int?,
    json['round'] as int,
    json['isMultiPly'] as bool,
    json['isSimultaneousAction'] as bool,
  );
}

Map<String, dynamic> _$_$_GenericGameToJson(_$_GenericGame instance) =>
    <String, dynamic>{
      'players': unmodifiablePlayerList.toJson(instance.players),
      'readyPlayers': unmodifiableStringList.toJson(instance.readyPlayers),
      'allRoundScores':
          unmodifiableDoubleListList.toJson(instance.allRoundScores),
      'time': instance.time.toIso8601String(),
      'messages': unmodifiableGameMessageList.toJson(instance.messages),
      'gameStatus': _$GameStatusEnumMap[instance.gameStatus],
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

_$_GenericEventUndo _$_$_GenericEventUndoFromJson(Map<String, dynamic> json) {
  return _$_GenericEventUndo();
}

Map<String, dynamic> _$_$_GenericEventUndoToJson(
        _$_GenericEventUndo instance) =>
    <String, dynamic>{};

_$_GenericEventStart _$_$_GenericEventStartFromJson(Map<String, dynamic> json) {
  return _$_GenericEventStart();
}

Map<String, dynamic> _$_$_GenericEventStartToJson(
        _$_GenericEventStart instance) =>
    <String, dynamic>{};

_$_GenericReadyNextRoundEvent _$_$_GenericReadyNextRoundEventFromJson(
    Map<String, dynamic> json) {
  return _$_GenericReadyNextRoundEvent(
    json['player'] as String,
  );
}

Map<String, dynamic> _$_$_GenericReadyNextRoundEventToJson(
        _$_GenericReadyNextRoundEvent instance) =>
    <String, dynamic>{
      'player': instance.player,
    };

_$GameMessage _$_$GameMessageFromJson(Map<String, dynamic> json) {
  return _$GameMessage(
    json['message'] as String,
    from: json['from'] as String,
    to: json['to'] as String?,
  );
}

Map<String, dynamic> _$_$GameMessageToJson(_$GameMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'from': instance.from,
      'to': instance.to,
    };
