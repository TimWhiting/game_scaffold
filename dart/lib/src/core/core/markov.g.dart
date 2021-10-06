// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markov.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
