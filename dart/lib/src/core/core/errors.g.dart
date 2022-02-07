// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameValue _$$GameValueFromJson(Map<String, dynamic> json) => _$GameValue(
      Game.fromJson(json['game'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GameValueToJson(_$GameValue instance) =>
    <String, dynamic>{
      'game': instance.game,
      'runtimeType': instance.$type,
    };

_$GameError _$$GameErrorFromJson(Map<String, dynamic> json) => _$GameError(
      json['message'] as String,
      json['person'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GameErrorToJson(_$GameError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'person': instance.person,
      'runtimeType': instance.$type,
    };
