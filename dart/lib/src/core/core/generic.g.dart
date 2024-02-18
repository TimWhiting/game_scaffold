// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericGameImpl _$$GenericGameImplFromJson(Map<String, dynamic> json) =>
    _$GenericGameImpl(
      time: DateTime.parse(json['time'] as String),
      status: $enumDecode(_$GameStatusEnumMap, json['status']),
      round: json['round'] as int,
      players: json['players'] == null
          ? ilistempty
          : IList<Player>.fromJson(json['players'],
              (value) => Player.fromJson(value as Map<String, dynamic>)),
      readyPlayers: json['readyPlayers'] == null
          ? ilistempty
          : IList<String>.fromJson(
              json['readyPlayers'], (value) => value as String),
    );

Map<String, dynamic> _$$GenericGameImplToJson(_$GenericGameImpl instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'status': _$GameStatusEnumMap[instance.status]!,
      'round': instance.round,
      'players': instance.players.toJson(
        (value) => value.toJson(),
      ),
      'readyPlayers': instance.readyPlayers.toJson(
        (value) => value,
      ),
    };

const _$GameStatusEnumMap = {
  GameStatus.lobby: 'lobby',
  GameStatus.started: 'started',
  GameStatus.betweenRounds: 'betweenRounds',
  GameStatus.finished: 'finished',
};

_$GenericReadyNextRoundEventImpl _$$GenericReadyNextRoundEventImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericReadyNextRoundEventImpl(
      json['player'] as String,
      type: json['type'] as String? ?? 'generic',
    );

Map<String, dynamic> _$$GenericReadyNextRoundEventImplToJson(
        _$GenericReadyNextRoundEventImpl instance) =>
    <String, dynamic>{
      'player': instance.player,
      'type': instance.type,
    };

_$GameConfigImpl _$$GameConfigImplFromJson(Map<String, dynamic> json) =>
    _$GameConfigImpl(
      gameType: json['gameType'] as String,
      adminID: json['adminID'] as String?,
      nameSet: $enumDecodeNullable(_$NameSetEnumMap, json['nameSet']) ??
          NameSet.basic,
      customNames: json['customNames'] as bool? ?? false,
      rounds: json['rounds'] as int? ?? 15,
      minPlayers: json['minPlayers'] as int? ?? 1,
      maxPlayers: json['maxPlayers'] as int? ?? 10,
      autoStart: json['autoStart'] as bool? ?? true,
      options: json['options'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$GameConfigImplToJson(_$GameConfigImpl instance) =>
    <String, dynamic>{
      'gameType': instance.gameType,
      'adminID': instance.adminID,
      'nameSet': _$NameSetEnumMap[instance.nameSet]!,
      'customNames': instance.customNames,
      'rounds': instance.rounds,
      'minPlayers': instance.minPlayers,
      'maxPlayers': instance.maxPlayers,
      'autoStart': instance.autoStart,
      'options': instance.options,
    };

const _$NameSetEnumMap = {
  NameSet.basic: 'basic',
};

_$GameInfoImpl _$$GameInfoImplFromJson(Map<String, dynamic> json) =>
    _$GameInfoImpl(
      gameID: json['gameID'] as String,
      players:
          IList<String>.fromJson(json['players'], (value) => value as String),
      player: json['player'] as String,
      creator: json['creator'] as bool,
      config: GameConfig.fromJson(json['config'] as Map<String, dynamic>),
      status: $enumDecode(_$GameStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$GameInfoImplToJson(_$GameInfoImpl instance) =>
    <String, dynamic>{
      'gameID': instance.gameID,
      'players': instance.players.toJson(
        (value) => value,
      ),
      'player': instance.player,
      'creator': instance.creator,
      'config': instance.config.toJson(),
      'status': _$GameStatusEnumMap[instance.status]!,
    };

_$LobbyImpl _$$LobbyImplFromJson(Map<String, dynamic> json) => _$LobbyImpl(
      code: json['code'] as String,
      config: GameConfig.fromJson(json['config'] as Map<String, dynamic>),
      gameStatus: $enumDecode(_$GameStatusEnumMap, json['gameStatus']),
      players: json['players'] == null
          ? isetempty
          : ISet<Player>.fromJson(json['players'],
              (value) => Player.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$LobbyImplToJson(_$LobbyImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'config': instance.config.toJson(),
      'gameStatus': _$GameStatusEnumMap[instance.gameStatus]!,
      'players': instance.players.toJson(
        (value) => value.toJson(),
      ),
    };
