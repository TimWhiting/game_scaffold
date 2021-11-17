// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameConfig _$$_GameConfigFromJson(Map<String, dynamic> json) =>
    _$_GameConfig(
      gameType: json['gameType'] as String,
      adminID: json['adminID'] as String?,
      nameSet: _$enumDecodeNullable(_$NameSetEnumMap, json['nameSet']) ??
          NameSet.Basic,
      customNames: json['customNames'] as bool? ?? false,
      rounds: json['rounds'] as int? ?? 15,
      minPlayers: json['minPlayers'] as int? ?? 1,
      maxPlayers: json['maxPlayers'] as int? ?? 10,
      autoStart: json['autoStart'] as bool? ?? true,
      options: json['options'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_GameConfigToJson(_$_GameConfig instance) =>
    <String, dynamic>{
      'gameType': instance.gameType,
      'adminID': instance.adminID,
      'nameSet': _$NameSetEnumMap[instance.nameSet],
      'customNames': instance.customNames,
      'rounds': instance.rounds,
      'minPlayers': instance.minPlayers,
      'maxPlayers': instance.maxPlayers,
      'autoStart': instance.autoStart,
      'options': instance.options,
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$NameSetEnumMap = {
  NameSet.Basic: 'Basic',
};

_$_GameInfo _$$_GameInfoFromJson(Map<String, dynamic> json) => _$_GameInfo(
      gameId: json['gameId'] as String,
      players:
          IList<String>.fromJson(json['players'], (value) => value as String),
      player: json['player'] as String,
      creator: json['creator'] as bool,
      gameType: json['gameType'] as String,
      status: _$enumDecode(_$GameStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_GameInfoToJson(_$_GameInfo instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'players': instance.players.toJson(
        (value) => value,
      ),
      'player': instance.player,
      'creator': instance.creator,
      'gameType': instance.gameType,
      'status': _$GameStatusEnumMap[instance.status],
    };

const _$GameStatusEnumMap = {
  GameStatus.Lobby: 'Lobby',
  GameStatus.Started: 'Started',
  GameStatus.BetweenRounds: 'BetweenRounds',
  GameStatus.Finished: 'Finished',
};

_$_Lobby _$$_LobbyFromJson(Map<String, dynamic> json) => _$_Lobby(
      code: json['code'] as String,
      players: ISet<Player>.fromJson(json['players'],
          (value) => Player.fromJson(value as Map<String, dynamic>)),
      config: GameConfig.fromJson(json['config'] as Map<String, dynamic>),
      gameStatus: _$enumDecode(_$GameStatusEnumMap, json['gameStatus']),
    );

Map<String, dynamic> _$$_LobbyToJson(_$_Lobby instance) => <String, dynamic>{
      'code': instance.code,
      'players': instance.players.toJson(
        (value) => value,
      ),
      'config': instance.config,
      'gameStatus': _$GameStatusEnumMap[instance.gameStatus],
    };
