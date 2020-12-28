import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core.dart';
part 'errors.freezed.dart';
part 'errors.g.dart';

/// Represents the union type of a game or an error, along with some helper getters to work with them
@freezed
abstract class GameOrError<T extends Game> with _$GameOrError {
  const GameOrError._();

  /// Represents a game
  const factory GameOrError.game(@GameConverter() T game) = GameValue;

  /// Represets an error
  const factory GameOrError.error(String message, String person) = GameError;

  /// Returns whether this instance is an error
  bool get isError => this is GameError;

  /// Returns the error or null
  GameError get error => map(error: (e) => e, game: (g) => null);

  /// Returns the error message or 'No Error'
  String get errorString => isError ? error.message : 'No Error';

  /// Returns the game value or null
  T get value => when(error: (m, p) => null, game: (g) => g);

  /// Returns whether this instance is a game
  bool get isGame => this is GameValue;
  factory GameOrError.fromJson(Map<String, dynamic> json) =>
      _$GameOrErrorFromJson(json);
}

extension GameOrErrorGameX on Game {
  GameOrError get gameValue => GameValue(this);
}

class GameConverter<T extends Game>
    implements JsonConverter<T, Map<String, dynamic>> {
  const GameConverter();
  @override
  T fromJson(Map<String, dynamic> json) => Game.fromJson(json) as T;

  @override
  Map<String, dynamic> toJson(Game object) => object.toJson();
}
