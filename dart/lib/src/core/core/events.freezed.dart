// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameEventTearOff {
  const _$GameEventTearOff();

  GameEventGame game(Event event) {
    return GameEventGame(
      event,
    );
  }

  GameEventGeneral general(GenericEvent event) {
    return GameEventGeneral(
      event,
    );
  }
}

/// @nodoc
const $GameEvent = _$GameEventTearOff();

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Event event) game,
    required TResult Function(GenericEvent event) general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Event event)? game,
    TResult Function(GenericEvent event)? general,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameEventGame value) game,
    required TResult Function(GameEventGeneral value) general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameEventGame value)? game,
    TResult Function(GameEventGeneral value)? general,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEventCopyWith<$Res> {
  factory $GameEventCopyWith(GameEvent value, $Res Function(GameEvent) then) =
      _$GameEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameEventCopyWithImpl<$Res> implements $GameEventCopyWith<$Res> {
  _$GameEventCopyWithImpl(this._value, this._then);

  final GameEvent _value;
  // ignore: unused_field
  final $Res Function(GameEvent) _then;
}

/// @nodoc
abstract class $GameEventGameCopyWith<$Res> {
  factory $GameEventGameCopyWith(
          GameEventGame value, $Res Function(GameEventGame) then) =
      _$GameEventGameCopyWithImpl<$Res>;
  $Res call({Event event});
}

/// @nodoc
class _$GameEventGameCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res>
    implements $GameEventGameCopyWith<$Res> {
  _$GameEventGameCopyWithImpl(
      GameEventGame _value, $Res Function(GameEventGame) _then)
      : super(_value, (v) => _then(v as GameEventGame));

  @override
  GameEventGame get _value => super._value as GameEventGame;

  @override
  $Res call({
    Object? event = freezed,
  }) {
    return _then(GameEventGame(
      event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event,
    ));
  }
}

/// @nodoc
class _$GameEventGame extends GameEventGame {
  const _$GameEventGame(this.event) : super._();

  @override
  final Event event;

  @override
  String toString() {
    return 'GameEvent.game(event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameEventGame &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(event);

  @JsonKey(ignore: true)
  @override
  $GameEventGameCopyWith<GameEventGame> get copyWith =>
      _$GameEventGameCopyWithImpl<GameEventGame>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Event event) game,
    required TResult Function(GenericEvent event) general,
  }) {
    return game(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Event event)? game,
    TResult Function(GenericEvent event)? general,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameEventGame value) game,
    required TResult Function(GameEventGeneral value) general,
  }) {
    return game(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameEventGame value)? game,
    TResult Function(GameEventGeneral value)? general,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(this);
    }
    return orElse();
  }
}

abstract class GameEventGame extends GameEvent {
  const factory GameEventGame(Event event) = _$GameEventGame;
  const GameEventGame._() : super._();

  Event get event => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameEventGameCopyWith<GameEventGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEventGeneralCopyWith<$Res> {
  factory $GameEventGeneralCopyWith(
          GameEventGeneral value, $Res Function(GameEventGeneral) then) =
      _$GameEventGeneralCopyWithImpl<$Res>;
  $Res call({GenericEvent event});

  $GenericEventCopyWith<$Res> get event;
}

/// @nodoc
class _$GameEventGeneralCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res>
    implements $GameEventGeneralCopyWith<$Res> {
  _$GameEventGeneralCopyWithImpl(
      GameEventGeneral _value, $Res Function(GameEventGeneral) _then)
      : super(_value, (v) => _then(v as GameEventGeneral));

  @override
  GameEventGeneral get _value => super._value as GameEventGeneral;

  @override
  $Res call({
    Object? event = freezed,
  }) {
    return _then(GameEventGeneral(
      event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as GenericEvent,
    ));
  }

  @override
  $GenericEventCopyWith<$Res> get event {
    return $GenericEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc
class _$GameEventGeneral extends GameEventGeneral {
  const _$GameEventGeneral(this.event) : super._();

  @override
  final GenericEvent event;

  @override
  String toString() {
    return 'GameEvent.general(event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameEventGeneral &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(event);

  @JsonKey(ignore: true)
  @override
  $GameEventGeneralCopyWith<GameEventGeneral> get copyWith =>
      _$GameEventGeneralCopyWithImpl<GameEventGeneral>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Event event) game,
    required TResult Function(GenericEvent event) general,
  }) {
    return general(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Event event)? game,
    TResult Function(GenericEvent event)? general,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameEventGame value) game,
    required TResult Function(GameEventGeneral value) general,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameEventGame value)? game,
    TResult Function(GameEventGeneral value)? general,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class GameEventGeneral extends GameEvent {
  const factory GameEventGeneral(GenericEvent event) = _$GameEventGeneral;
  const GameEventGeneral._() : super._();

  GenericEvent get event => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameEventGeneralCopyWith<GameEventGeneral> get copyWith =>
      throw _privateConstructorUsedError;
}
