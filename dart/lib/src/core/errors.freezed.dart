// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GameOrErrorTearOff {
  const _$GameOrErrorTearOff();

// ignore: unused_element
  _GameOrErrorGame<T> game<T>(T game) {
    return _GameOrErrorGame<T>(
      game,
    );
  }

// ignore: unused_element
  _GameOrErrorError<T> error<T>(GameError error) {
    return _GameOrErrorError<T>(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GameOrError = _$GameOrErrorTearOff();

/// @nodoc
mixin _$GameOrError<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result game(T game),
    @required Result error(GameError error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result game(T game),
    Result error(GameError error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result game(_GameOrErrorGame<T> value),
    @required Result error(_GameOrErrorError<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result game(_GameOrErrorGame<T> value),
    Result error(_GameOrErrorError<T> value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $GameOrErrorCopyWith<T, $Res> {
  factory $GameOrErrorCopyWith(
          GameOrError<T> value, $Res Function(GameOrError<T>) then) =
      _$GameOrErrorCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$GameOrErrorCopyWithImpl<T, $Res>
    implements $GameOrErrorCopyWith<T, $Res> {
  _$GameOrErrorCopyWithImpl(this._value, this._then);

  final GameOrError<T> _value;
  // ignore: unused_field
  final $Res Function(GameOrError<T>) _then;
}

/// @nodoc
abstract class _$GameOrErrorGameCopyWith<T, $Res> {
  factory _$GameOrErrorGameCopyWith(
          _GameOrErrorGame<T> value, $Res Function(_GameOrErrorGame<T>) then) =
      __$GameOrErrorGameCopyWithImpl<T, $Res>;
  $Res call({T game});
}

/// @nodoc
class __$GameOrErrorGameCopyWithImpl<T, $Res>
    extends _$GameOrErrorCopyWithImpl<T, $Res>
    implements _$GameOrErrorGameCopyWith<T, $Res> {
  __$GameOrErrorGameCopyWithImpl(
      _GameOrErrorGame<T> _value, $Res Function(_GameOrErrorGame<T>) _then)
      : super(_value, (v) => _then(v as _GameOrErrorGame<T>));

  @override
  _GameOrErrorGame<T> get _value => super._value as _GameOrErrorGame<T>;

  @override
  $Res call({
    Object game = freezed,
  }) {
    return _then(_GameOrErrorGame<T>(
      game == freezed ? _value.game : game as T,
    ));
  }
}

/// @nodoc
class _$_GameOrErrorGame<T> extends _GameOrErrorGame<T> {
  const _$_GameOrErrorGame(this.game)
      : assert(game != null),
        super._();

  @override
  final T game;

  @override
  String toString() {
    return 'GameOrError<$T>.game(game: $game)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameOrErrorGame<T> &&
            (identical(other.game, game) ||
                const DeepCollectionEquality().equals(other.game, game)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(game);

  @override
  _$GameOrErrorGameCopyWith<T, _GameOrErrorGame<T>> get copyWith =>
      __$GameOrErrorGameCopyWithImpl<T, _GameOrErrorGame<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result game(T game),
    @required Result error(GameError error),
  }) {
    assert(game != null);
    assert(error != null);
    return game(this.game);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result game(T game),
    Result error(GameError error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (game != null) {
      return game(this.game);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result game(_GameOrErrorGame<T> value),
    @required Result error(_GameOrErrorError<T> value),
  }) {
    assert(game != null);
    assert(error != null);
    return game(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result game(_GameOrErrorGame<T> value),
    Result error(_GameOrErrorError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (game != null) {
      return game(this);
    }
    return orElse();
  }
}

abstract class _GameOrErrorGame<T> extends GameOrError<T> {
  const _GameOrErrorGame._() : super._();
  const factory _GameOrErrorGame(T game) = _$_GameOrErrorGame<T>;

  T get game;
  _$GameOrErrorGameCopyWith<T, _GameOrErrorGame<T>> get copyWith;
}

/// @nodoc
abstract class _$GameOrErrorErrorCopyWith<T, $Res> {
  factory _$GameOrErrorErrorCopyWith(_GameOrErrorError<T> value,
          $Res Function(_GameOrErrorError<T>) then) =
      __$GameOrErrorErrorCopyWithImpl<T, $Res>;
  $Res call({GameError error});
}

/// @nodoc
class __$GameOrErrorErrorCopyWithImpl<T, $Res>
    extends _$GameOrErrorCopyWithImpl<T, $Res>
    implements _$GameOrErrorErrorCopyWith<T, $Res> {
  __$GameOrErrorErrorCopyWithImpl(
      _GameOrErrorError<T> _value, $Res Function(_GameOrErrorError<T>) _then)
      : super(_value, (v) => _then(v as _GameOrErrorError<T>));

  @override
  _GameOrErrorError<T> get _value => super._value as _GameOrErrorError<T>;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(_GameOrErrorError<T>(
      error == freezed ? _value.error : error as GameError,
    ));
  }
}

/// @nodoc
class _$_GameOrErrorError<T> extends _GameOrErrorError<T> {
  const _$_GameOrErrorError(this.error)
      : assert(error != null),
        super._();

  @override
  final GameError error;

  @override
  String toString() {
    return 'GameOrError<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameOrErrorError<T> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  _$GameOrErrorErrorCopyWith<T, _GameOrErrorError<T>> get copyWith =>
      __$GameOrErrorErrorCopyWithImpl<T, _GameOrErrorError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result game(T game),
    @required Result error(GameError error),
  }) {
    assert(game != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result game(T game),
    Result error(GameError error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result game(_GameOrErrorGame<T> value),
    @required Result error(_GameOrErrorError<T> value),
  }) {
    assert(game != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result game(_GameOrErrorGame<T> value),
    Result error(_GameOrErrorError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _GameOrErrorError<T> extends GameOrError<T> {
  const _GameOrErrorError._() : super._();
  const factory _GameOrErrorError(GameError error) = _$_GameOrErrorError<T>;

  GameError get error;
  _$GameOrErrorErrorCopyWith<T, _GameOrErrorError<T>> get copyWith;
}
