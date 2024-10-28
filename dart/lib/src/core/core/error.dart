import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'core.dart';

typedef MaybeError<T> = Either<GameError, T>;

extension ToMaybeError<T> on T {
  MaybeError<T> error(GameError err) => Left(err);
  MaybeError<T> get success => Right(this);
}

extension MaybeErrorX<T> on MaybeError<T> {
  bool get hasError => isLeft();
  bool get hasValue => isRight();
}

// The error representation on the frontend / sending to frontend.
final class GameError {
  const GameError({required this.message, required this.player});
  factory GameError.fromJson(JsonMap json) => GameError(
      message: json['message'] as String, player: json['player'] as PlayerID);
  final String message;
  final PlayerID player;
  JsonMap toJson() => {'message': message, 'player': player};
}

/// A error notifier that lets the client clear the error
mixin GameErrorNotifier on $Notifier<GameError?> {
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

