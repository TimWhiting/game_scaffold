// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reversi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReversiGame _$_$_ReversiGameFromJson(Map<String, dynamic> json) {
  return _$_ReversiGame(
    generic: json['generic'] == null
        ? null
        : GenericGame.fromJson(json['generic'] as Map<String, dynamic>),
    players: json['players'] != null
        ? KtList<Player>.from((json['players'] as List).map((e) =>
            e == null ? null : Player.fromJson(e as Map<String, dynamic>)))
        : null,
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    messages: json['messages'] != null
        ? KtList<GameMessage>.from((json['messages'] as List).map((e) =>
            e == null ? null : GameMessage.fromJson(e as Map<String, dynamic>)))
        : null,
    gameStatus: _$enumDecodeNullable(_$GameStatusEnumMap, json['gameStatus']),
    currentPlayerIndex: json['currentPlayerIndex'] as int,
    round: json['round'] as int,
    board: (json['board'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_ReversiGameToJson(_$_ReversiGame instance) =>
    <String, dynamic>{
      'generic': instance.generic,
      'players': instance.players?.asList(),
      'time': instance.time?.toIso8601String(),
      'messages': instance.messages?.asList(),
      'gameStatus': _$GameStatusEnumMap[instance.gameStatus],
      'currentPlayerIndex': instance.currentPlayerIndex,
      'round': instance.round,
      'board': instance.board,
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
