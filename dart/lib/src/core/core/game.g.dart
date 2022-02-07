// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventGame _$$EventGameFromJson(Map<String, dynamic> json) => _$EventGame(
      const GameEventConverter()
          .fromJson(json['event'] as Map<String, Object?>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EventGameToJson(_$EventGame instance) =>
    <String, dynamic>{
      'event': const GameEventConverter().toJson(instance.event),
      'runtimeType': instance.$type,
    };

_$UndoEvent _$$UndoEventFromJson(Map<String, dynamic> json) => _$UndoEvent(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UndoEventToJson(_$UndoEvent instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ReadyNextRoundEvent _$$ReadyNextRoundEventFromJson(
        Map<String, dynamic> json) =>
    _$ReadyNextRoundEvent(
      json['player'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReadyNextRoundEventToJson(
        _$ReadyNextRoundEvent instance) =>
    <String, dynamic>{
      'player': instance.player,
      'runtimeType': instance.$type,
    };

_$MessageEvent _$$MessageEventFromJson(Map<String, dynamic> json) =>
    _$MessageEvent(
      json['message'] as String,
      from: json['from'] as String,
      to: json['to'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MessageEventToJson(_$MessageEvent instance) =>
    <String, dynamic>{
      'message': instance.message,
      'from': instance.from,
      'to': instance.to,
      'runtimeType': instance.$type,
    };

_$_Matrix _$$_MatrixFromJson(Map<String, dynamic> json) => _$_Matrix(
      (json['rewards'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => Reward.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$$_MatrixToJson(_$_Matrix instance) => <String, dynamic>{
      'rewards': instance.rewards,
    };

_$_JointAction _$$_JointActionFromJson(Map<String, dynamic> json) =>
    _$_JointAction(
      p1: json['p1'] as int,
      p2: json['p2'] as int,
    );

Map<String, dynamic> _$$_JointActionToJson(_$_JointAction instance) =>
    <String, dynamic>{
      'p1': instance.p1,
      'p2': instance.p2,
    };

_$_Reward _$$_RewardFromJson(Map<String, dynamic> json) => _$_Reward(
      p1: (json['p1'] as num).toDouble(),
      p2: (json['p2'] as num).toDouble(),
    );

Map<String, dynamic> _$$_RewardToJson(_$_Reward instance) => <String, dynamic>{
      'p1': instance.p1,
      'p2': instance.p2,
    };

_$_Game _$$_GameFromJson(Map<String, dynamic> json) => _$_Game(
      IList<Player>.fromJson(json['players'],
          (value) => Player.fromJson(value as Map<String, dynamic>)),
      IList<String>.fromJson(json['readyPlayers'], (value) => value as String),
      IList<IList<double>>.fromJson(
          json['allRoundScores'],
          (value) => IList<double>.fromJson(
              value, (value) => (value as num).toDouble())),
      DateTime.parse(json['time'] as String),
      IList<MessageEvent>.fromJson(json['messages'],
          (value) => MessageEvent.fromJson(value as Map<String, dynamic>)),
      $enumDecode(_$GameStatusEnumMap, json['status']),
      json['currentPlayerIndex'] as int?,
      json['round'] as int,
      json['isMultiPly'] as bool,
      json['isSimultaneousAction'] as bool,
      const GameStateConverter()
          .fromJson(json['gameState'] as Map<String, Object?>),
    );

Map<String, dynamic> _$$_GameToJson(_$_Game instance) => <String, dynamic>{
      'players': instance.players.toJson(
        (value) => value,
      ),
      'readyPlayers': instance.readyPlayers.toJson(
        (value) => value,
      ),
      'allRoundScores': instance.allRoundScores.toJson(
        (value) => value.toJson(
          (value) => value,
        ),
      ),
      'time': instance.time.toIso8601String(),
      'messages': instance.messages.toJson(
        (value) => value,
      ),
      'status': _$GameStatusEnumMap[instance.status],
      'currentPlayerIndex': instance.currentPlayerIndex,
      'round': instance.round,
      'isMultiPly': instance.isMultiPly,
      'isSimultaneousAction': instance.isSimultaneousAction,
      'gameState': const GameStateConverter().toJson(instance.gameState),
    };

const _$GameStatusEnumMap = {
  GameStatus.Lobby: 'Lobby',
  GameStatus.Started: 'Started',
  GameStatus.BetweenRounds: 'BetweenRounds',
  GameStatus.Finished: 'Finished',
};

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
      'nameSet': _$NameSetEnumMap[instance.nameSet],
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
      gameId: json['gameId'] as String,
      players:
          IList<String>.fromJson(json['players'], (value) => value as String),
      player: json['player'] as String,
      creator: json['creator'] as bool,
      gameType: json['gameType'] as String,
      status: $enumDecode(_$GameStatusEnumMap, json['status']),
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
      'gameStatus': _$GameStatusEnumMap[instance.gameStatus],
    };
