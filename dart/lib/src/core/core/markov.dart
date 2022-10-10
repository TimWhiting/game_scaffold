import 'package:freezed_annotation/freezed_annotation.dart';

import 'core.dart';

part 'markov.freezed.dart';

abstract class MarkovGame<T extends Event> {
  int get numFeatures;
  IList<int> get features;
  int get markovId => features.hashCode;
  IList<Matrix> get actionRewards;
}

@freezed
class Matrix with _$Matrix {
  const factory Matrix(List<List<JointReward>> rewards) = _Matrix;

  factory Matrix.fromJson(JsonMap map) => Matrix([for (final row in map['rewards'] as List) [for (final reward in row as List) (reward as JsonMap).toReward()]]); 

  @override
  JsonMap toJson() => {'rewards': [for (final row in rewards) [for (final reward in row) reward.toJson()]]};
}

extension ToReward on JsonMap {
  JointReward toReward() => (this['p1'] as double, this['p2'] as double);
}

extension ToJsonReward on JointReward {
  JsonMap toJson() => {'p1': $0, 'p2': $1};
}

typedef JointAction = (int p1, int p2);
typedef JointReward = (double p1, double p2);