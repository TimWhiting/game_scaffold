import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'errors.freezed.dart';
part 'errors.g.dart';

/// Represents an error caused during a game by a person with id [person]
@JsonSerializable()
class GameError implements Exception {
  GameError(this.message, this.person) : super();
  factory GameError.fromJson(Map<String, dynamic> json) =>
      _$GameErrorFromJson(json);
  Map<String, dynamic> toJson() => _$GameErrorToJson(this);

  /// The [message] portion of the error
  String message;

  /// Which [person] (id) caused the error
  String person;
  @override
  String toString() => 'Player with id: $person caused error: $message';
}

/// Represents the union type of a game or an error, along with some helper getters to work with them
@freezed
abstract class GameOrError<T> with _$GameOrError {
  const GameOrError._();

  /// Represents a game
  const factory GameOrError.game(T game) = _GameOrErrorGame;

  /// Represets an error
  const factory GameOrError.error(GameError error) = _GameOrErrorError;

  /// Returns whether this instance is an error
  bool get isError => this is _GameOrErrorError;

  /// Returns the error or null
  GameError get error => when(error: (e) => e, game: (g) => null);

  /// Returns the error message or 'No Error'
  String get errorString => isError ? error.message : 'No Error';

  /// Returns the game value or null
  T get value => when(error: (e) => null, game: (g) => g);

  /// Returns whether this instance is a game
  bool get isGame => this is _GameOrErrorGame;
}
