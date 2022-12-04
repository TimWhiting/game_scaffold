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
      json['round'] as int,
    );

Map<String, dynamic> _$$_GenericGameToJson(_$_GenericGame instance) =>
    <String, dynamic>{
      'players': instance.players.toJson(
        (value) => value.toJson(),
      ),
      'readyPlayers': instance.readyPlayers.toJson(
        (value) => value,
      ),
      'time': instance.time.toIso8601String(),
      'status': _$GameStatusEnumMap[instance.status]!,
      'round': instance.round,
    };

const _$GameStatusEnumMap = {
  GameStatus.lobby: 'lobby',
  GameStatus.started: 'started',
  GameStatus.betweenRounds: 'betweenRounds',
  GameStatus.finished: 'finished',
};

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

_$_GameConfig _$$_GameConfigFromJson(Map<String, dynamic> json) =>
    _$_GameConfig(
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

Map<String, dynamic> _$$_GameConfigToJson(_$_GameConfig instance) =>
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

_$_GameInfo _$$_GameInfoFromJson(Map<String, dynamic> json) => _$_GameInfo(
      gameID: json['gameID'] as String,
      players:
          IList<String>.fromJson(json['players'], (value) => value as String),
      player: json['player'] as String,
      creator: json['creator'] as bool,
      config: GameConfig.fromJson(json['config'] as Map<String, dynamic>),
      status: $enumDecode(_$GameStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_GameInfoToJson(_$_GameInfo instance) =>
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

_$_Lobby _$$_LobbyFromJson(Map<String, dynamic> json) => _$_Lobby(
      code: json['code'] as String,
      players: ISet<Player>.fromJson(json['players'],
          (value) => Player.fromJson(value as Map<String, dynamic>)),
      config: GameConfig.fromJson(json['config'] as Map<String, dynamic>),
      gameStatus: $enumDecode(_$GameStatusEnumMap, json['gameStatus']),
    );

Map<String, dynamic> _$$_LobbyToJson(_$_Lobby instance) => <String, dynamic>{
      'code': instance.code,
      'players': instance.players.toJson(
        (value) => value.toJson(),
      ),
      'config': instance.config.toJson(),
      'gameStatus': _$GameStatusEnumMap[instance.gameStatus]!,
    };
