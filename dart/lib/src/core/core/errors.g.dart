// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameError _$GameErrorFromJson(Map<String, dynamic> json) {
  return GameError(
    json['message'] as String,
    json['person'] as String,
  );
}

Map<String, dynamic> _$GameErrorToJson(GameError instance) => <String, dynamic>{
      'message': instance.message,
      'person': instance.person,
    };
