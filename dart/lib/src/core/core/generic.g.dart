// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenericGame _$_$_GenericGameFromJson(Map<String, dynamic> json) {
  return _$_GenericGame(
    json['players'] != null
        ? KtList<Player>.from((json['players'] as List).map((e) =>
            e == null ? null : Player.fromJson(e as Map<String, dynamic>)))
        : null,
    json['readyPlayers'] != null
        ? KtList<String>.from(
            (json['readyPlayers'] as List).map((e) => e as String))
        : null,
    json['allRoundScores'] != null
        ? KtList<KtList<double>>.from((json['allRoundScores'] as List).map(
            (e) => e != null
                ? KtList<double>.from(
                    (e as List).map((e) => (e as num)?.toDouble()))
                : null))
        : null,
    json['time'] == null ? null : DateTime.parse(json['time'] as String),
    json['messages'] != null
        ? KtList<GameMessage>.from((json['messages'] as List).map((e) =>
            e == null ? null : GameMessage.fromJson(e as Map<String, dynamic>)))
        : null,
    _$enumDecodeNullable(_$GameStatusEnumMap, json['gameStatus']),
    json['currentPlayerIndex'] as int,
    json['round'] as int,
  );
}

Map<String, dynamic> _$_$_GenericGameToJson(_$_GenericGame instance) =>
    <String, dynamic>{
      'players': instance.players?.asList(),
      'readyPlayers': instance.readyPlayers?.asList(),
      'allRoundScores':
          instance.allRoundScores?.map((e) => e?.asList())?.iter?.toList(),
      'time': instance.time?.toIso8601String(),
      'messages': instance.messages?.asList(),
      'gameStatus': _$GameStatusEnumMap[instance.gameStatus],
      'currentPlayerIndex': instance.currentPlayerIndex,
      'round': instance.round,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
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
    to: json['to'] as String,
  );
}

Map<String, dynamic> _$_$GameMessageToJson(_$GameMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'from': instance.from,
      'to': instance.to,
    };
