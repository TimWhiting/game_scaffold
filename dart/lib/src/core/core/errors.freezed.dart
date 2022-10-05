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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameOrError<G> _$GameOrErrorFromJson<G extends Game<Event>>(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
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
mixin _$GameOrError<G extends Game<Event>> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @GameConverter() G game, Map<String, double> rewards)
        game,
    required TResult Function(String message, String person) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameConverter() G game, Map<String, double> rewards)?
        game,
    TResult Function(String message, String person)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameConverter() G game, Map<String, double> rewards)?
        game,
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
abstract class _$$GameValueCopyWith<G extends Game<Event>, $Res> {
  factory _$$GameValueCopyWith(
          _$GameValue<G> value, $Res Function(_$GameValue<G>) then) =
      __$$GameValueCopyWithImpl<G, $Res>;
  $Res call({@GameConverter() G game, Map<String, double> rewards});
}

/// @nodoc
class __$$GameValueCopyWithImpl<G extends Game<Event>, $Res>
    extends _$GameOrErrorCopyWithImpl<G, $Res>
    implements _$$GameValueCopyWith<G, $Res> {
  __$$GameValueCopyWithImpl(
      _$GameValue<G> _value, $Res Function(_$GameValue<G>) _then)
      : super(_value, (v) => _then(v as _$GameValue<G>));

  @override
  _$GameValue<G> get _value => super._value as _$GameValue<G>;

  @override
  $Res call({
    Object? game = freezed,
    Object? rewards = freezed,
  }) {
    return _then(_$GameValue<G>(
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as G,
      rewards: rewards == freezed
          ? _value._rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameValue<G extends Game<Event>> extends GameValue<G> {
  const _$GameValue(
      {@GameConverter() required this.game,
      required final Map<String, double> rewards,
      final String? $type})
      : _rewards = rewards,
        $type = $type ?? 'game',
        super._();

  factory _$GameValue.fromJson(Map<String, dynamic> json) =>
      _$$GameValueFromJson(json);

  @override
  @GameConverter()
  final G game;
  final Map<String, double> _rewards;
  @override
  Map<String, double> get rewards {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rewards);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameOrError<$G>.game(game: $game, rewards: $rewards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameValue<G> &&
            const DeepCollectionEquality().equals(other.game, game) &&
            const DeepCollectionEquality().equals(other._rewards, _rewards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(game),
      const DeepCollectionEquality().hash(_rewards));

  @JsonKey(ignore: true)
  @override
  _$$GameValueCopyWith<G, _$GameValue<G>> get copyWith =>
      __$$GameValueCopyWithImpl<G, _$GameValue<G>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @GameConverter() G game, Map<String, double> rewards)
        game,
    required TResult Function(String message, String person) error,
  }) {
    return game(this.game, rewards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameConverter() G game, Map<String, double> rewards)?
        game,
    TResult Function(String message, String person)? error,
  }) {
    return game?.call(this.game, rewards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameConverter() G game, Map<String, double> rewards)?
        game,
    TResult Function(String message, String person)? error,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(this.game, rewards);
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
    return _$$GameValueToJson<G>(
      this,
    );
  }
}

abstract class GameValue<G extends Game<Event>> extends GameOrError<G> {
  const factory GameValue(
      {@GameConverter() required final G game,
      required final Map<String, double> rewards}) = _$GameValue<G>;
  const GameValue._() : super._();

  factory GameValue.fromJson(Map<String, dynamic> json) =
      _$GameValue<G>.fromJson;

  @GameConverter()
  G get game;
  Map<String, double> get rewards;
  @JsonKey(ignore: true)
  _$$GameValueCopyWith<G, _$GameValue<G>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameErrorCopyWith<G extends Game<Event>, $Res> {
  factory _$$GameErrorCopyWith(
          _$GameError<G> value, $Res Function(_$GameError<G>) then) =
      __$$GameErrorCopyWithImpl<G, $Res>;
  $Res call({String message, String person});
}

/// @nodoc
class __$$GameErrorCopyWithImpl<G extends Game<Event>, $Res>
    extends _$GameOrErrorCopyWithImpl<G, $Res>
    implements _$$GameErrorCopyWith<G, $Res> {
  __$$GameErrorCopyWithImpl(
      _$GameError<G> _value, $Res Function(_$GameError<G>) _then)
      : super(_value, (v) => _then(v as _$GameError<G>));

  @override
  _$GameError<G> get _value => super._value as _$GameError<G>;

  @override
  $Res call({
    Object? message = freezed,
    Object? person = freezed,
  }) {
    return _then(_$GameError<G>(
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
  const _$GameError(this.message, this.person, {final String? $type})
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
    return 'GameOrError<$G>.error(message: $message, person: $person)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameError<G> &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.person, person));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(person));

  @JsonKey(ignore: true)
  @override
  _$$GameErrorCopyWith<G, _$GameError<G>> get copyWith =>
      __$$GameErrorCopyWithImpl<G, _$GameError<G>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @GameConverter() G game, Map<String, double> rewards)
        game,
    required TResult Function(String message, String person) error,
  }) {
    return error(message, person);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameConverter() G game, Map<String, double> rewards)?
        game,
    TResult Function(String message, String person)? error,
  }) {
    return error?.call(message, person);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameConverter() G game, Map<String, double> rewards)?
        game,
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
    return _$$GameErrorToJson<G>(
      this,
    );
  }
}

abstract class GameError<G extends Game<Event>> extends GameOrError<G> {
  const factory GameError(final String message, final String person) =
      _$GameError<G>;
  const GameError._() : super._();

  factory GameError.fromJson(Map<String, dynamic> json) =
      _$GameError<G>.fromJson;

  String get message;
  String get person;
  @JsonKey(ignore: true)
  _$$GameErrorCopyWith<G, _$GameError<G>> get copyWith =>
      throw _privateConstructorUsedError;
}
