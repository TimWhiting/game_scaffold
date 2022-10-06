import 'package:freezed_annotation/freezed_annotation.dart';

import 'core.dart';

part 'markov.freezed.dart';
part 'markov.g.dart';

abstract class MarkovGame<T extends Event> {
  int get numFeatures;
  IList<int> get features;
  int get markovId => features.hashCode;
  IList<Matrix> get actionRewards;
}

@freezed
class Matrix with _$Matrix {
  const factory Matrix(List<List<JointReward>> rewards) = _Matrix;
  factory Matrix.fromJson(Map<String, dynamic> map) => _$MatrixFromJson(map);
}

typedef JointAction = (int p1, int p2);
typedef JointReward = (double p1, double p2);