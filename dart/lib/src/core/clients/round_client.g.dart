// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendEventRequest<T> _$$SendEventRequestFromJson<T extends Event>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SendEventRequest<T>(
      playerID: json['playerID'] as String,
      code: json['code'] as String,
      event: fromJsonT(json['event']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SendEventRequestToJson<T extends Event>(
  _$SendEventRequest<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'playerID': instance.playerID,
      'code': instance.code,
      'event': toJsonT(instance.event),
      'runtimeType': instance.$type,
    };

_$WatchGameRequest<T> _$$WatchGameRequestFromJson<T extends Event>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$WatchGameRequest<T>(
      playerID: json['playerID'] as String,
      code: json['code'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WatchGameRequestToJson<T extends Event>(
  _$WatchGameRequest<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'playerID': instance.playerID,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$SendEventResponse<T> _$$SendEventResponseFromJson<T extends Game<Event>>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SendEventResponse<T>(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SendEventResponseToJson<T extends Game<Event>>(
  _$SendEventResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$WatchGameResponse<T> _$$WatchGameResponseFromJson<T extends Game<Event>>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$WatchGameResponse<T>(
      game: fromJsonT(json['game']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WatchGameResponseToJson<T extends Game<Event>>(
  _$WatchGameResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'game': toJsonT(instance.game),
      'runtimeType': instance.$type,
    };
