// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GameOrError<T> _$GameOrErrorFromJson<T extends Game<Event>>(
    Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'game':
      return GameValue<T>.fromJson(json);
    case 'error':
      return GameError<T>.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$GameOrErrorTearOff {
  const _$GameOrErrorTearOff();

// ignore: unused_element
  GameValue<T> game<T extends Game<Event>>(@GameConverter() T game) {
    return GameValue<T>(
      game,
    );
  }

// ignore: unused_element
  GameError<T> error<T extends Game<Event>>(String message, String person) {
    return GameError<T>(
      message,
      person,
    );
  }

// ignore: unused_element
  GameOrError<T> fromJson<T extends Game<Event>>(Map<String, Object> json) {
    return GameOrError<T>.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GameOrError = _$GameOrErrorTearOff();

/// @nodoc
mixin _$GameOrError<T extends Game<Event>> {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult game(@GameConverter() T game),
    @required TResult error(String message, String person),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult game(@GameConverter() T game),
    TResult error(String message, String person),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult game(GameValue<T> value),
    @required TResult error(GameError<T> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult game(GameValue<T> value),
    TResult error(GameError<T> value),
    @required TResult orElse(),
  });
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $GameOrErrorCopyWith<T extends Game<Event>, $Res> {
  factory $GameOrErrorCopyWith(
          GameOrError<T> value, $Res Function(GameOrError<T>) then) =
      _$GameOrErrorCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$GameOrErrorCopyWithImpl<T extends Game<Event>, $Res>
    implements $GameOrErrorCopyWith<T, $Res> {
  _$GameOrErrorCopyWithImpl(this._value, this._then);

  final GameOrError<T> _value;
  // ignore: unused_field
  final $Res Function(GameOrError<T>) _then;
}

/// @nodoc
abstract class $GameValueCopyWith<T extends Game<Event>, $Res> {
  factory $GameValueCopyWith(
          GameValue<T> value, $Res Function(GameValue<T>) then) =
      _$GameValueCopyWithImpl<T, $Res>;
  $Res call({@GameConverter() T game});
}

/// @nodoc
class _$GameValueCopyWithImpl<T extends Game<Event>, $Res>
    extends _$GameOrErrorCopyWithImpl<T, $Res>
    implements $GameValueCopyWith<T, $Res> {
  _$GameValueCopyWithImpl(
      GameValue<T> _value, $Res Function(GameValue<T>) _then)
      : super(_value, (v) => _then(v as GameValue<T>));

  @override
  GameValue<T> get _value => super._value as GameValue<T>;

  @override
  $Res call({
    Object game = freezed,
  }) {
    return _then(GameValue<T>(
      game == freezed ? _value.game : game as T,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$GameValue<T extends Game<Event>> extends GameValue<T> {
  const _$GameValue(@GameConverter() this.game)
      : assert(game != null),
        super._();

  factory _$GameValue.fromJson(Map<String, dynamic> json) =>
      _$_$GameValueFromJson(json);

  @override
  @GameConverter()
  final T game;

  @override
  String toString() {
    return 'GameOrError<$T>.game(game: $game)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameValue<T> &&
            (identical(other.game, game) ||
                const DeepCollectionEquality().equals(other.game, game)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(game);

  @JsonKey(ignore: true)
  @override
  $GameValueCopyWith<T, GameValue<T>> get copyWith =>
      _$GameValueCopyWithImpl<T, GameValue<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult game(@GameConverter() T game),
    @required TResult error(String message, String person),
  }) {
    assert(game != null);
    assert(error != null);
    return game(this.game);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult game(@GameConverter() T game),
    TResult error(String message, String person),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (game != null) {
      return game(this.game);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult game(GameValue<T> value),
    @required TResult error(GameError<T> value),
  }) {
    assert(game != null);
    assert(error != null);
    return game(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult game(GameValue<T> value),
    TResult error(GameError<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (game != null) {
      return game(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$GameValueToJson(this)..['runtimeType'] = 'game';
  }
}

abstract class GameValue<T extends Game<Event>> extends GameOrError<T> {
  const GameValue._() : super._();
  const factory GameValue(@GameConverter() T game) = _$GameValue<T>;

  factory GameValue.fromJson(Map<String, dynamic> json) =
      _$GameValue<T>.fromJson;

  @GameConverter()
  T get game;
  @JsonKey(ignore: true)
  $GameValueCopyWith<T, GameValue<T>> get copyWith;
}

/// @nodoc
abstract class $GameErrorCopyWith<T extends Game<Event>, $Res> {
  factory $GameErrorCopyWith(
          GameError<T> value, $Res Function(GameError<T>) then) =
      _$GameErrorCopyWithImpl<T, $Res>;
  $Res call({String message, String person});
}

/// @nodoc
class _$GameErrorCopyWithImpl<T extends Game<Event>, $Res>
    extends _$GameOrErrorCopyWithImpl<T, $Res>
    implements $GameErrorCopyWith<T, $Res> {
  _$GameErrorCopyWithImpl(
      GameError<T> _value, $Res Function(GameError<T>) _then)
      : super(_value, (v) => _then(v as GameError<T>));

  @override
  GameError<T> get _value => super._value as GameError<T>;

  @override
  $Res call({
    Object message = freezed,
    Object person = freezed,
  }) {
    return _then(GameError<T>(
      message == freezed ? _value.message : message as String,
      person == freezed ? _value.person : person as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$GameError<T extends Game<Event>> extends GameError<T> {
  const _$GameError(this.message, this.person)
      : assert(message != null),
        assert(person != null),
        super._();

  factory _$GameError.fromJson(Map<String, dynamic> json) =>
      _$_$GameErrorFromJson(json);

  @override
  final String message;
  @override
  final String person;

  @override
  String toString() {
    return 'GameOrError<$T>.error(message: $message, person: $person)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameError<T> &&
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
  $GameErrorCopyWith<T, GameError<T>> get copyWith =>
      _$GameErrorCopyWithImpl<T, GameError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult game(@GameConverter() T game),
    @required TResult error(String message, String person),
  }) {
    assert(game != null);
    assert(error != null);
    return error(message, person);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult game(@GameConverter() T game),
    TResult error(String message, String person),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message, person);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult game(GameValue<T> value),
    @required TResult error(GameError<T> value),
  }) {
    assert(game != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult game(GameValue<T> value),
    TResult error(GameError<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$GameErrorToJson(this)..['runtimeType'] = 'error';
  }
}

abstract class GameError<T extends Game<Event>> extends GameOrError<T> {
  const GameError._() : super._();
  const factory GameError(String message, String person) = _$GameError<T>;

  factory GameError.fromJson(Map<String, dynamic> json) =
      _$GameError<T>.fromJson;

  String get message;
  String get person;
  @JsonKey(ignore: true)
  $GameErrorCopyWith<T, GameError<T>> get copyWith;
}
