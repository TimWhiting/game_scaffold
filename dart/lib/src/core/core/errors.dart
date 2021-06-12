import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod/riverpod.dart';

import '../core.dart';
part 'errors.freezed.dart';
part 'errors.g.dart';

/// Represents the union type of a game or an error, along with some helper getters to work with them
@freezed
class GameOrError<T extends Game> with _$GameOrError {
  const GameOrError._();

  /// Represents a game
  const factory GameOrError.game(@GameConverter() T game) = GameValue<T>;

  /// Represets an error
  const factory GameOrError.error(String message, PlayerID person) =
      GameError<T>;
  factory GameOrError.fromJson(Map<String, dynamic> json) =>
      _$GameOrErrorFromJson(json);

  /// Returns whether this instance is an error
  bool get isError => this is GameError;

  /// Returns the error or null
  GameError? get error => map(error: (e) => e, game: (g) => null);

  /// Returns the error message or 'No Error'
  String get errorString => isError ? error!.message : 'No Error';

  /// Returns the game value or null
  T? get value => when(error: (m, p) => null, game: (g) => g as T);

  /// Returns whether this instance is a game
  bool get isGame => this is GameValue;
}

extension GameOrErrorGameX<E extends Event> on Game<E> {
  GameOrError<G> gameValue<G extends Game<E>>() => GameValue(this as G);
}

class GameConverter<T extends Game>
    implements JsonConverter<T, Map<String, dynamic>> {
  const GameConverter();
  @override
  T fromJson(Map<String, dynamic> json) => Game.fromJson(json) as T;

  @override
  Map<String, dynamic> toJson(Game object) => object.toJson();
}

/// A companion [StateNotifier] to the [GameStateNotifier] that keeps track of the most recent error, and lets the client clear the error
class GameErrorNotifier extends StateNotifier<GameError?> {
  GameErrorNotifier() : super(null);

  /// Sets the error [state]
  set error(GameError? err) {
    state = err;
  }

  /// Gets the error that was set
  GameError? get error => state;

  /// Clears any error that was set
  void clearError() {
    state = null;
  }
}
