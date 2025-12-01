// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenericGame _$GenericGameFromJson(Map<String, dynamic> json) => _GenericGame(
  time: DateTime.parse(json['time'] as String),
  status: $enumDecode(_$GameStatusEnumMap, json['status']),
  round: (json['round'] as num).toInt(),
  players: json['players'] == null
      ? const IListConst([])
      : IList<Player>.fromJson(
          json['players'],
          (value) => Player.fromJson(value as Map<String, dynamic>),
        ),
  readyPlayers: json['readyPlayers'] == null
      ? const IListConst([])
      : IList<String>.fromJson(
          json['readyPlayers'],
          (value) => value as String,
        ),
);

Map<String, dynamic> _$GenericGameToJson(_GenericGame instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'status': _$GameStatusEnumMap[instance.status]!,
      'round': instance.round,
      'players': instance.players.toJson((value) => value.toJson()),
      'readyPlayers': instance.readyPlayers.toJson((value) => value),
    };

const _$GameStatusEnumMap = {
  GameStatus.lobby: 'lobby',
  GameStatus.started: 'started',
  GameStatus.betweenRounds: 'betweenRounds',
  GameStatus.finished: 'finished',
};

ReadyNextRound _$ReadyNextRoundFromJson(Map<String, dynamic> json) =>
    ReadyNextRound(
      json['player'] as String,
      type: json['type'] as String? ?? 'generic',
    );

Map<String, dynamic> _$ReadyNextRoundToJson(ReadyNextRound instance) =>
    <String, dynamic>{'player': instance.player, 'type': instance.type};

_GameConfig _$GameConfigFromJson(Map<String, dynamic> json) => _GameConfig(
  gameType: json['gameType'] as String,
  adminID: json['adminID'] as String?,
  nameSet:
      $enumDecodeNullable(_$NameSetEnumMap, json['nameSet']) ?? NameSet.basic,
  customNames: json['customNames'] as bool? ?? false,
  rounds: (json['rounds'] as num?)?.toInt() ?? 15,
  minPlayers: (json['minPlayers'] as num?)?.toInt() ?? 1,
  maxPlayers: (json['maxPlayers'] as num?)?.toInt() ?? 20,
  autoStart: json['autoStart'] as bool? ?? true,
  options: json['options'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$GameConfigToJson(_GameConfig instance) =>
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

const _$NameSetEnumMap = {NameSet.basic: 'basic'};

_GameInfo _$GameInfoFromJson(Map<String, dynamic> json) => _GameInfo(
  gameID: json['gameID'] as String,
  players: IList<String>.fromJson(json['players'], (value) => value as String),
  player: json['player'] as String,
  creator: json['creator'] as bool,
  config: GameConfig.fromJson(json['config'] as Map<String, dynamic>),
  status: $enumDecode(_$GameStatusEnumMap, json['status']),
);

Map<String, dynamic> _$GameInfoToJson(_GameInfo instance) => <String, dynamic>{
  'gameID': instance.gameID,
  'players': instance.players.toJson((value) => value),
  'player': instance.player,
  'creator': instance.creator,
  'config': instance.config.toJson(),
  'status': _$GameStatusEnumMap[instance.status]!,
};

_Lobby _$LobbyFromJson(Map<String, dynamic> json) => _Lobby(
  code: json['code'] as String,
  config: GameConfig.fromJson(json['config'] as Map<String, dynamic>),
  gameStatus: $enumDecode(_$GameStatusEnumMap, json['gameStatus']),
  players: json['players'] == null
      ? const ISetConst({})
      : ISet<Player>.fromJson(
          json['players'],
          (value) => Player.fromJson(value as Map<String, dynamic>),
        ),
);

Map<String, dynamic> _$LobbyToJson(_Lobby instance) => <String, dynamic>{
  'code': instance.code,
  'config': instance.config.toJson(),
  'gameStatus': _$GameStatusEnumMap[instance.gameStatus]!,
  'players': instance.players.toJson((value) => value.toJson()),
};
