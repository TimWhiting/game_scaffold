// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameValue<G> _$$GameValueFromJson<G extends Game<Event>>(
        Map<String, dynamic> json) =>
    _$GameValue<G>(
      GameConverter<G>().fromJson(json['game'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameValueToJson<G extends Game<Event>>(
        _$GameValue<G> instance) =>
    <String, dynamic>{
      'game': GameConverter<G>().toJson(instance.game),
    };

_$GameError<G> _$$GameErrorFromJson<G extends Game<Event>>(
        Map<String, dynamic> json) =>
    _$GameError<G>(
      json['message'] as String,
      json['person'] as String,
    );

Map<String, dynamic> _$$GameErrorToJson<G extends Game<Event>>(
        _$GameError<G> instance) =>
    <String, dynamic>{
      'message': instance.message,
      'person': instance.person,
    };
