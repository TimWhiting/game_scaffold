import 'package:riverpod/riverpod.dart';

import 'generic.dart';

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
