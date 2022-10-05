// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameValue<G> _$$GameValueFromJson<G extends Game<Event>>(
        Map<String, dynamic> json) =>
    _$GameValue<G>(
      game: GameConverter<G>().fromJson(json['game'] as Map<String, dynamic>),
      rewards: (json['rewards'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GameValueToJson<G extends Game<Event>>(
        _$GameValue<G> instance) =>
    <String, dynamic>{
      'game': GameConverter<G>().toJson(instance.game),
      'rewards': instance.rewards,
      'runtimeType': instance.$type,
    };

_$GameError<G> _$$GameErrorFromJson<G extends Game<Event>>(
        Map<String, dynamic> json) =>
    _$GameError<G>(
      json['message'] as String,
      json['person'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GameErrorToJson<G extends Game<Event>>(
        _$GameError<G> instance) =>
    <String, dynamic>{
      'message': instance.message,
      'person': instance.person,
      'runtimeType': instance.$type,
    };
