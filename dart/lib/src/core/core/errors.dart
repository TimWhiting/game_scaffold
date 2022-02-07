import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

import '../core.dart';
part 'errors.freezed.dart';
part 'errors.g.dart';

/// Represents the union type of a game or an error, along with some helper getters to work with them
@freezed
class GameOrError with _$GameOrError {
  const GameOrError._();

  /// Represents a game
  const factory GameOrError.game(Game game) = GameValue;

  /// Represets an error
  const factory GameOrError.error(String message, PlayerID person) = GameError;
  factory GameOrError.fromJson(Map<String, dynamic> json) => _$GameOrErrorFromJson(json);

  /// Returns whether this instance is an error
  bool get isError => this is GameError;

  /// Returns the error or null
  GameError? get error => map(error: (e) => e, game: (g) => null);

  /// Returns the error message or 'No Error'
  String get errorString => isError ? error!.message : 'No Error';

  /// Returns the game value or null
  Game? get value => when(error: (m, p) => null, game: (g) => g);

  /// Returns whether this instance is a game
  bool get isGame => this is GameValue;
}

/// A [StateNotifier] that keeps track of the most recent error, and lets the client clear the error
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
