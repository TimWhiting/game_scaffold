// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameConfig _$$_GameConfigFromJson(Map<String, dynamic> json) =>
    _$_GameConfig(
      gameType: json['gameType'] as String,
      adminID: json['adminID'] as String?,
      nameSet: $enumDecodeNullable(_$NameSetEnumMap, json['nameSet']) ??
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
      'nameSet': _$NameSetEnumMap[instance.nameSet]!,
      'customNames': instance.customNames,
      'rounds': instance.rounds,
      'minPlayers': instance.minPlayers,
      'maxPlayers': instance.maxPlayers,
      'autoStart': instance.autoStart,
      'options': instance.options,
    };

const _$NameSetEnumMap = {
  NameSet.Basic: 'Basic',
};

_$_GameInfo _$$_GameInfoFromJson(Map<String, dynamic> json) => _$_GameInfo(
      gameID: json['gameID'] as String,
      players:
          IList<String>.fromJson(json['players'], (value) => value as String),
      player: json['player'] as String,
      creator: json['creator'] as bool,
      gameType: json['gameType'] as String,
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
      'gameType': instance.gameType,
      'status': _$GameStatusEnumMap[instance.status]!,
    };

const _$GameStatusEnumMap = {
  GameStatus.lobby: 'lobby',
  GameStatus.started: 'started',
  GameStatus.betweenRounds: 'betweenRounds',
  GameStatus.finished: 'finished',
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
        (value) => value,
      ),
      'config': instance.config,
      'gameStatus': _$GameStatusEnumMap[instance.gameStatus]!,
    };
