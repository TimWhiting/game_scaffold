import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'errors.freezed.dart';
part 'errors.g.dart';

@JsonSerializable()
class GameError implements Exception {
  GameError(this.message, this.person) : super();
  factory GameError.fromJson(Map<String, dynamic> json) =>
      _$GameErrorFromJson(json);
  Map<String, dynamic> toJson() => _$GameErrorToJson(this);

  String message;
  String person;
  @override
  String toString() => '$person caused error; $message';
}

@freezed
abstract class GameOrError<T> with _$GameOrError {
  const GameOrError._();
  const factory GameOrError.game(T game) = _GameOrErrorGame;
  const factory GameOrError.error(GameError error) = _GameOrErrorError;

  bool get isError => this is _GameOrErrorError;
  GameError get error => when(error: (e) => e, game: (g) => null);
  String get errorString => isError ? error.message : 'No Error';
  T get value => when(error: (e) => null, game: (g) => g);
  bool get isGame => this is _GameOrErrorGame;
}
