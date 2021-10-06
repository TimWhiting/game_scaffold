// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameConfig _$$_GameConfigFromJson(Map<String, dynamic> json) =>
    _$_GameConfig(
      gameType: json['gameType'] as String,
      adminId: json['adminId'] as String?,
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
      'adminId': instance.adminId,
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
    };
