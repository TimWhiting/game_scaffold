// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameValue<T> _$$GameValueFromJson<T extends Game<Event>>(
        Map<String, dynamic> json) =>
    _$GameValue<T>(
      GameConverter<T>().fromJson(json['game'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameValueToJson<T extends Game<Event>>(
        _$GameValue<T> instance) =>
    <String, dynamic>{
      'game': GameConverter<T>().toJson(instance.game),
    };

_$GameError<T> _$$GameErrorFromJson<T extends Game<Event>>(
        Map<String, dynamic> json) =>
    _$GameError<T>(
      json['message'] as String,
      json['person'] as String,
    );

Map<String, dynamic> _$$GameErrorToJson<T extends Game<Event>>(
        _$GameError<T> instance) =>
    <String, dynamic>{
      'message': instance.message,
      'person': instance.person,
    };
