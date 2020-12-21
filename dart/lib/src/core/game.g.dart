// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Player _$_$_PlayerFromJson(Map<String, dynamic> json) {
  return _$_Player(
    json['id'] == null
        ? null
        : PlayerID.fromJson(json['id'] as Map<String, dynamic>),
    name: json['name'] as String ?? '',
  );
}

Map<String, dynamic> _$_$_PlayerToJson(_$_Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_GenericGame _$_$_GenericGameFromJson(Map<String, dynamic> json) {
  return _$_GenericGame(
    json['players'] != null
        ? KtList<Player>.from((json['players'] as List).map((e) =>
            e == null ? null : Player.fromJson(e as Map<String, dynamic>)))
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

_$_PlayerID _$_$_PlayerIDFromJson(Map<String, dynamic> json) {
  return _$_PlayerID(
    json['id'] as String,
  );
}

Map<String, dynamic> _$_$_PlayerIDToJson(_$_PlayerID instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

_$_GeneralEventUndo _$_$_GeneralEventUndoFromJson(Map<String, dynamic> json) {
  return _$_GeneralEventUndo();
}

Map<String, dynamic> _$_$_GeneralEventUndoToJson(
        _$_GeneralEventUndo instance) =>
    <String, dynamic>{};

_$_GeneralEventStart _$_$_GeneralEventStartFromJson(Map<String, dynamic> json) {
  return _$_GeneralEventStart();
}

Map<String, dynamic> _$_$_GeneralEventStartToJson(
        _$_GeneralEventStart instance) =>
    <String, dynamic>{};

_$_GeneralReadyNextRoundEvent _$_$_GeneralReadyNextRoundEventFromJson(
    Map<String, dynamic> json) {
  return _$_GeneralReadyNextRoundEvent(
    json['player'] == null
        ? null
        : PlayerID.fromJson(json['player'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_GeneralReadyNextRoundEventToJson(
        _$_GeneralReadyNextRoundEvent instance) =>
    <String, dynamic>{
      'player': instance.player,
    };

_$GameMessage _$_$GameMessageFromJson(Map<String, dynamic> json) {
  return _$GameMessage(
    json['message'] as String,
    from: json['from'] == null
        ? null
        : PlayerID.fromJson(json['from'] as Map<String, dynamic>),
    to: json['to'] == null
        ? null
        : PlayerID.fromJson(json['to'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$GameMessageToJson(_$GameMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'from': instance.from,
      'to': instance.to,
    };

_$_GameConfig _$_$_GameConfigFromJson(Map<String, dynamic> json) {
  return _$_GameConfig(
    nameSet: _$enumDecodeNullable(_$NameSetEnumMap, json['nameSet']),
    customNames: json['customNames'] as bool ?? false,
    adminId: json['adminId'] as String,
    gameType: json['gameType'] as String,
    rounds: json['rounds'] as int ?? 15,
    options: json['options'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$_$_GameConfigToJson(_$_GameConfig instance) =>
    <String, dynamic>{
      'nameSet': _$NameSetEnumMap[instance.nameSet],
      'customNames': instance.customNames,
      'adminId': instance.adminId,
      'gameType': instance.gameType,
      'rounds': instance.rounds,
      'options': instance.options,
    };

const _$NameSetEnumMap = {
  NameSet.Basic: 'Basic',
};

_$_GameInfo _$_$_GameInfoFromJson(Map<String, dynamic> json) {
  return _$_GameInfo(
    json['gameId'] as String,
    (json['players'] as List)?.map((e) => e as String)?.toList(),
    json['player'] as String,
    json['creator'] as bool,
    json['gameType'] as String,
  );
}

Map<String, dynamic> _$_$_GameInfoToJson(_$_GameInfo instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'players': instance.players,
      'player': instance.player,
      'creator': instance.creator,
      'gameType': instance.gameType,
    };
