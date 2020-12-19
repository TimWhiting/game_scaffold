import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'game.dart';
part 'errors.g.dart';

@JsonSerializable()
class GameError implements Exception {
  GameError(this.message, this.person) : super();
  factory GameError.fromJson(Map<String, dynamic> json) =>
      _$GameErrorFromJson(json);
  Map<String, dynamic> toJson() => _$GameErrorToJson(this);

  String message;
  PlayerID person;
  @override
  String toString() => '$person caused error; $message';
}

extension GameErrorCheckers<T> on Either<GameError, T> {
  bool get isError => isLeft();
  GameError get error => fold((l) => l, (r) => null);
  String get errorString => isError ? error.message : 'No Error';
  T get value => getOrElse(null);
  bool get isOkay => isRight();
}
