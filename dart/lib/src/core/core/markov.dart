import 'package:freezed_annotation/freezed_annotation.dart';

import 'core.dart';

part 'markov.freezed.dart';
part 'markov.g.dart';

abstract class MarkovGame<T extends Event> extends Game<T> {
  int get numFeatures;
  IList<int> get features;
  int get markovId => features.hashCode;
  IList<Matrix> get actionRewards;
}

@freezed
class Matrix with _$Matrix {
  const factory Matrix(List<List<Reward>> rewards) = _Matrix;
  factory Matrix.fromJson(Map<String, dynamic> map) => _$MatrixFromJson(map);
}

@freezed
class JointAction with _$JointAction {
  const factory JointAction.twoPlayer({required int p1, required int p2}) =
      _JointAction;
  factory JointAction.fromJson(Map<String, dynamic> map) =>
      _$JointActionFromJson(map);
}

@freezed
class Reward with _$Reward {
  const factory Reward({required double p1, required double p2}) = _Reward;
  factory Reward.fromJson(Map<String, dynamic> map) => _$RewardFromJson(map);
}
