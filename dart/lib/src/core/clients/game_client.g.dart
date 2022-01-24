// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponse<T> _$$_ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_ApiResponse<T>(
      fromJsonT(json['success']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ApiResponseToJson<T>(
  _$_ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': toJsonT(instance.success),
      'runtimeType': instance.$type,
    };

_$_Error<T> _$$_ErrorFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_Error<T>(
      json['error'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ErrorToJson<T>(
  _$_Error<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };

_$CreateGameRequest _$$CreateGameRequestFromJson(Map<String, dynamic> json) =>
    _$CreateGameRequest(
      authID: json['authID'] as String,
      config: GameConfig.fromJson(json['config'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateGameRequestToJson(_$CreateGameRequest instance) =>
    <String, dynamic>{
      'authID': instance.authID,
      'config': instance.config,
      'runtimeType': instance.$type,
    };

_$DeleteGameRequest _$$DeleteGameRequestFromJson(Map<String, dynamic> json) =>
    _$DeleteGameRequest(
      playerID: json['playerID'] as String,
      authID: json['authID'] as String,
      code: json['code'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DeleteGameRequestToJson(_$DeleteGameRequest instance) =>
    <String, dynamic>{
      'playerID': instance.playerID,
      'authID': instance.authID,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$ListGamesRequest _$$ListGamesRequestFromJson(Map<String, dynamic> json) =>
    _$ListGamesRequest(
      authID: json['authID'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ListGamesRequestToJson(_$ListGamesRequest instance) =>
    <String, dynamic>{
      'authID': instance.authID,
      'runtimeType': instance.$type,
    };

_$ExitGameRequest _$$ExitGameRequestFromJson(Map<String, dynamic> json) =>
    _$ExitGameRequest(
      playerID: json['playerID'] as String,
      authID: json['authID'] as String,
      code: json['code'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ExitGameRequestToJson(_$ExitGameRequest instance) =>
    <String, dynamic>{
      'playerID': instance.playerID,
      'authID': instance.authID,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$JoinGameRequest _$$JoinGameRequestFromJson(Map<String, dynamic> json) =>
    _$JoinGameRequest(
      authID: json['authID'] as String,
      code: json['code'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$JoinGameRequestToJson(_$JoinGameRequest instance) =>
    <String, dynamic>{
      'authID': instance.authID,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$StartGameRequest _$$StartGameRequestFromJson(Map<String, dynamic> json) =>
    _$StartGameRequest(
      playerID: json['playerID'] as String,
      code: json['code'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StartGameRequestToJson(_$StartGameRequest instance) =>
    <String, dynamic>{
      'playerID': instance.playerID,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$WatchLobbyRequest _$$WatchLobbyRequestFromJson(Map<String, dynamic> json) =>
    _$WatchLobbyRequest(
      playerID: json['playerID'] as String,
      authID: json['authID'] as String,
      code: json['code'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WatchLobbyRequestToJson(_$WatchLobbyRequest instance) =>
    <String, dynamic>{
      'playerID': instance.playerID,
      'authID': instance.authID,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$CreateGameResponse _$$CreateGameResponseFromJson(Map<String, dynamic> json) =>
    _$CreateGameResponse(
      playerID: json['playerID'] as String,
      code: json['code'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateGameResponseToJson(
        _$CreateGameResponse instance) =>
    <String, dynamic>{
      'playerID': instance.playerID,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$DeleteGameResponse _$$DeleteGameResponseFromJson(Map<String, dynamic> json) =>
    _$DeleteGameResponse(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DeleteGameResponseToJson(
        _$DeleteGameResponse instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ListGamesResponse _$$ListGamesResponseFromJson(Map<String, dynamic> json) =>
    _$ListGamesResponse(
      games: IList<GameInfo>.fromJson(json['games'],
          (value) => GameInfo.fromJson(value as Map<String, dynamic>)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ListGamesResponseToJson(_$ListGamesResponse instance) =>
    <String, dynamic>{
      'games': instance.games.toJson(
        (value) => value,
      ),
      'runtimeType': instance.$type,
    };

_$ExitGameResponse _$$ExitGameResponseFromJson(Map<String, dynamic> json) =>
    _$ExitGameResponse(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ExitGameResponseToJson(_$ExitGameResponse instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$JoinGameResponse _$$JoinGameResponseFromJson(Map<String, dynamic> json) =>
    _$JoinGameResponse(
      playerID: json['playerID'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$JoinGameResponseToJson(_$JoinGameResponse instance) =>
    <String, dynamic>{
      'playerID': instance.playerID,
      'runtimeType': instance.$type,
    };

_$StartGameResponse _$$StartGameResponseFromJson(Map<String, dynamic> json) =>
    _$StartGameResponse(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StartGameResponseToJson(_$StartGameResponse instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$WatchLobbyResponse _$$WatchLobbyResponseFromJson(Map<String, dynamic> json) =>
    _$WatchLobbyResponse(
      gameInfo: GameInfo.fromJson(json['gameInfo'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WatchLobbyResponseToJson(
        _$WatchLobbyResponse instance) =>
    <String, dynamic>{
      'gameInfo': instance.gameInfo,
      'runtimeType': instance.$type,
    };
