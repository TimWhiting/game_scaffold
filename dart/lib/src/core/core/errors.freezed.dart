// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameOrError<G> _$GameOrErrorFromJson<G extends Game<Event>>(
    Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'game':
      return GameValue<G>.fromJson(json);
    case 'error':
      return GameError<G>.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GameOrError',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$GameOrErrorTearOff {
  const _$GameOrErrorTearOff();

  GameValue<G> game<G extends Game<Event>>(@GameConverter() G game) {
    return GameValue<G>(
      game,
    );
  }

  GameError<G> error<G extends Game<Event>>(String message, String person) {
    return GameError<G>(
      message,
      person,
    );
  }

  GameOrError<G> fromJson<G extends Game<Event>>(Map<String, Object> json) {
    return GameOrError<G>.fromJson(json);
  }
}

/// @nodoc
const $GameOrError = _$GameOrErrorTearOff();

/// @nodoc
mixin _$GameOrError<G extends Game<Event>> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@GameConverter() G game) game,
    required TResult Function(String message, String person) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameConverter() G game)? game,
    TResult Function(String message, String person)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameConverter() G game)? game,
    TResult Function(String message, String person)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameValue<G> value) game,
    required TResult Function(GameError<G> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameValue<G> value)? game,
    TResult Function(GameError<G> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameValue<G> value)? game,
    TResult Function(GameError<G> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameOrErrorCopyWith<G extends Game<Event>, $Res> {
  factory $GameOrErrorCopyWith(
          GameOrError<G> value, $Res Function(GameOrError<G>) then) =
      _$GameOrErrorCopyWithImpl<G, $Res>;
}

/// @nodoc
class _$GameOrErrorCopyWithImpl<G extends Game<Event>, $Res>
    implements $GameOrErrorCopyWith<G, $Res> {
  _$GameOrErrorCopyWithImpl(this._value, this._then);

  final GameOrError<G> _value;
  // ignore: unused_field
  final $Res Function(GameOrError<G>) _then;
}

/// @nodoc
abstract class $GameValueCopyWith<G extends Game<Event>, $Res> {
  factory $GameValueCopyWith(
          GameValue<G> value, $Res Function(GameValue<G>) then) =
      _$GameValueCopyWithImpl<G, $Res>;
  $Res call({@GameConverter() G game});
}

/// @nodoc
class _$GameValueCopyWithImpl<G extends Game<Event>, $Res>
    extends _$GameOrErrorCopyWithImpl<G, $Res>
    implements $GameValueCopyWith<G, $Res> {
  _$GameValueCopyWithImpl(
      GameValue<G> _value, $Res Function(GameValue<G>) _then)
      : super(_value, (v) => _then(v as GameValue<G>));

  @override
  GameValue<G> get _value => super._value as GameValue<G>;

  @override
  $Res call({
    Object? game = freezed,
  }) {
    return _then(GameValue<G>(
      game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as G,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameValue<G extends Game<Event>> extends GameValue<G> {
  const _$GameValue(@GameConverter() this.game) : super._();

  factory _$GameValue.fromJson(Map<String, dynamic> json) =>
      _$$GameValueFromJson(json);

  @override
  @GameConverter()
  final G game;

  @override
  String toString() {
    return 'GameOrError<$G>.game(game: $game)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameValue<G> &&
            (identical(other.game, game) ||
                const DeepCollectionEquality().equals(other.game, game)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(game);

  @JsonKey(ignore: true)
  @override
  $GameValueCopyWith<G, GameValue<G>> get copyWith =>
      _$GameValueCopyWithImpl<G, GameValue<G>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@GameConverter() G game) game,
    required TResult Function(String message, String person) error,
  }) {
    return game(this.game);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameConverter() G game)? game,
    TResult Function(String message, String person)? error,
  }) {
    return game?.call(this.game);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameConverter() G game)? game,
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
    required TResult Function(GameValue<G> value) game,
    required TResult Function(GameError<G> value) error,
  }) {
    return game(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameValue<G> value)? game,
    TResult Function(GameError<G> value)? error,
  }) {
    return game?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameValue<G> value)? game,
    TResult Function(GameError<G> value)? error,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GameValueToJson(this)..['runtimeType'] = 'game';
  }
}

abstract class GameValue<G extends Game<Event>> extends GameOrError<G> {
  const factory GameValue(@GameConverter() G game) = _$GameValue<G>;
  const GameValue._() : super._();

  factory GameValue.fromJson(Map<String, dynamic> json) =
      _$GameValue<G>.fromJson;

  @GameConverter()
  G get game => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameValueCopyWith<G, GameValue<G>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameErrorCopyWith<G extends Game<Event>, $Res> {
  factory $GameErrorCopyWith(
          GameError<G> value, $Res Function(GameError<G>) then) =
      _$GameErrorCopyWithImpl<G, $Res>;
  $Res call({String message, String person});
}

/// @nodoc
class _$GameErrorCopyWithImpl<G extends Game<Event>, $Res>
    extends _$GameOrErrorCopyWithImpl<G, $Res>
    implements $GameErrorCopyWith<G, $Res> {
  _$GameErrorCopyWithImpl(
      GameError<G> _value, $Res Function(GameError<G>) _then)
      : super(_value, (v) => _then(v as GameError<G>));

  @override
  GameError<G> get _value => super._value as GameError<G>;

  @override
  $Res call({
    Object? message = freezed,
    Object? person = freezed,
  }) {
    return _then(GameError<G>(
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
class _$GameError<G extends Game<Event>> extends GameError<G> {
  const _$GameError(this.message, this.person) : super._();

  factory _$GameError.fromJson(Map<String, dynamic> json) =>
      _$$GameErrorFromJson(json);

  @override
  final String message;
  @override
  final String person;

  @override
  String toString() {
    return 'GameOrError<$G>.error(message: $message, person: $person)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameError<G> &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.person, person) ||
                const DeepCollectionEquality().equals(other.person, person)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(person);

  @JsonKey(ignore: true)
  @override
  $GameErrorCopyWith<G, GameError<G>> get copyWith =>
      _$GameErrorCopyWithImpl<G, GameError<G>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@GameConverter() G game) game,
    required TResult Function(String message, String person) error,
  }) {
    return error(message, person);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameConverter() G game)? game,
    TResult Function(String message, String person)? error,
  }) {
    return error?.call(message, person);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameConverter() G game)? game,
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
    required TResult Function(GameValue<G> value) game,
    required TResult Function(GameError<G> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameValue<G> value)? game,
    TResult Function(GameError<G> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameValue<G> value)? game,
    TResult Function(GameError<G> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GameErrorToJson(this)..['runtimeType'] = 'error';
  }
}

abstract class GameError<G extends Game<Event>> extends GameOrError<G> {
  const factory GameError(String message, String person) = _$GameError<G>;
  const GameError._() : super._();

  factory GameError.fromJson(Map<String, dynamic> json) =
      _$GameError<G>.fromJson;

  String get message => throw _privateConstructorUsedError;
  String get person => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameErrorCopyWith<G, GameError<G>> get copyWith =>
      throw _privateConstructorUsedError;
}
