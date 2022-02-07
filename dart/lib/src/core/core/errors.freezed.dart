// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameOrError _$GameOrErrorFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'game':
      return GameValue.fromJson(json);
    case 'error':
      return GameError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GameOrError',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$GameOrErrorTearOff {
  const _$GameOrErrorTearOff();

  GameValue game(Game game) {
    return GameValue(
      game,
    );
  }

  GameError error(String message, String person) {
    return GameError(
      message,
      person,
    );
  }

  GameOrError fromJson(Map<String, Object?> json) {
    return GameOrError.fromJson(json);
  }
}

/// @nodoc
const $GameOrError = _$GameOrErrorTearOff();

/// @nodoc
mixin _$GameOrError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Game game) game,
    required TResult Function(String message, String person) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Game game)? game,
    TResult Function(String message, String person)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Game game)? game,
    TResult Function(String message, String person)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameValue value) game,
    required TResult Function(GameError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameValue value)? game,
    TResult Function(GameError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameValue value)? game,
    TResult Function(GameError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameOrErrorCopyWith<$Res> {
  factory $GameOrErrorCopyWith(
          GameOrError value, $Res Function(GameOrError) then) =
      _$GameOrErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameOrErrorCopyWithImpl<$Res> implements $GameOrErrorCopyWith<$Res> {
  _$GameOrErrorCopyWithImpl(this._value, this._then);

  final GameOrError _value;
  // ignore: unused_field
  final $Res Function(GameOrError) _then;
}

/// @nodoc
abstract class $GameValueCopyWith<$Res> {
  factory $GameValueCopyWith(GameValue value, $Res Function(GameValue) then) =
      _$GameValueCopyWithImpl<$Res>;
  $Res call({Game game});

  $GameCopyWith<$Res> get game;
}

/// @nodoc
class _$GameValueCopyWithImpl<$Res> extends _$GameOrErrorCopyWithImpl<$Res>
    implements $GameValueCopyWith<$Res> {
  _$GameValueCopyWithImpl(GameValue _value, $Res Function(GameValue) _then)
      : super(_value, (v) => _then(v as GameValue));

  @override
  GameValue get _value => super._value as GameValue;

  @override
  $Res call({
    Object? game = freezed,
  }) {
    return _then(GameValue(
      game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game,
    ));
  }

  @override
  $GameCopyWith<$Res> get game {
    return $GameCopyWith<$Res>(_value.game, (value) {
      return _then(_value.copyWith(game: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GameValue extends GameValue {
  const _$GameValue(this.game, {String? $type})
      : $type = $type ?? 'game',
        super._();

  factory _$GameValue.fromJson(Map<String, dynamic> json) =>
      _$$GameValueFromJson(json);

  @override
  final Game game;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameOrError.game(game: $game)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameValue &&
            const DeepCollectionEquality().equals(other.game, game));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(game));

  @JsonKey(ignore: true)
  @override
  $GameValueCopyWith<GameValue> get copyWith =>
      _$GameValueCopyWithImpl<GameValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Game game) game,
    required TResult Function(String message, String person) error,
  }) {
    return game(this.game);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Game game)? game,
    TResult Function(String message, String person)? error,
  }) {
    return game?.call(this.game);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Game game)? game,
    TResult Function(String message, String person)? error,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(this.game);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameValue value) game,
    required TResult Function(GameError value) error,
  }) {
    return game(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameValue value)? game,
    TResult Function(GameError value)? error,
  }) {
    return game?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameValue value)? game,
    TResult Function(GameError value)? error,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GameValueToJson(this);
  }
}

abstract class GameValue extends GameOrError {
  const factory GameValue(Game game) = _$GameValue;
  const GameValue._() : super._();

  factory GameValue.fromJson(Map<String, dynamic> json) = _$GameValue.fromJson;

  Game get game;
  @JsonKey(ignore: true)
  $GameValueCopyWith<GameValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameErrorCopyWith<$Res> {
  factory $GameErrorCopyWith(GameError value, $Res Function(GameError) then) =
      _$GameErrorCopyWithImpl<$Res>;
  $Res call({String message, String person});
}

/// @nodoc
class _$GameErrorCopyWithImpl<$Res> extends _$GameOrErrorCopyWithImpl<$Res>
    implements $GameErrorCopyWith<$Res> {
  _$GameErrorCopyWithImpl(GameError _value, $Res Function(GameError) _then)
      : super(_value, (v) => _then(v as GameError));

  @override
  GameError get _value => super._value as GameError;

  @override
  $Res call({
    Object? message = freezed,
    Object? person = freezed,
  }) {
    return _then(GameError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      person == freezed
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameError extends GameError {
  const _$GameError(this.message, this.person, {String? $type})
      : $type = $type ?? 'error',
        super._();

  factory _$GameError.fromJson(Map<String, dynamic> json) =>
      _$$GameErrorFromJson(json);

  @override
  final String message;
  @override
  final String person;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameOrError.error(message: $message, person: $person)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameError &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.person, person));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(person));

  @JsonKey(ignore: true)
  @override
  $GameErrorCopyWith<GameError> get copyWith =>
      _$GameErrorCopyWithImpl<GameError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Game game) game,
    required TResult Function(String message, String person) error,
  }) {
    return error(message, person);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Game game)? game,
    TResult Function(String message, String person)? error,
  }) {
    return error?.call(message, person);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Game game)? game,
    TResult Function(String message, String person)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, person);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameValue value) game,
    required TResult Function(GameError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameValue value)? game,
    TResult Function(GameError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameValue value)? game,
    TResult Function(GameError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GameErrorToJson(this);
  }
}

abstract class GameError extends GameOrError {
  const factory GameError(String message, String person) = _$GameError;
  const GameError._() : super._();

  factory GameError.fromJson(Map<String, dynamic> json) = _$GameError.fromJson;

  String get message;
  String get person;
  @JsonKey(ignore: true)
  $GameErrorCopyWith<GameError> get copyWith =>
      throw _privateConstructorUsedError;
}
