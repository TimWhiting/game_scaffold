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

  _GameEventGame game(Event event) {
    return _GameEventGame(
      event,
    );
  }

  _GameEventGeneral general(GenericEvent event) {
    return _GameEventGeneral(
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
    required TResult Function(_GameEventGame value) game,
    required TResult Function(_GameEventGeneral value) general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventGame value)? game,
    TResult Function(_GameEventGeneral value)? general,
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
abstract class _$GameEventGameCopyWith<$Res> {
  factory _$GameEventGameCopyWith(
          _GameEventGame value, $Res Function(_GameEventGame) then) =
      __$GameEventGameCopyWithImpl<$Res>;
  $Res call({Event event});
}

/// @nodoc
class __$GameEventGameCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res>
    implements _$GameEventGameCopyWith<$Res> {
  __$GameEventGameCopyWithImpl(
      _GameEventGame _value, $Res Function(_GameEventGame) _then)
      : super(_value, (v) => _then(v as _GameEventGame));

  @override
  _GameEventGame get _value => super._value as _GameEventGame;

  @override
  $Res call({
    Object? event = freezed,
  }) {
    return _then(_GameEventGame(
      event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event,
    ));
  }
}

/// @nodoc
class _$_GameEventGame extends _GameEventGame {
  const _$_GameEventGame(this.event) : super._();

  @override
  final Event event;

  @override
  String toString() {
    return 'GameEvent.game(event: $event)';
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        (other is _GameEventGame &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(event);

  @JsonKey(ignore: true)
  @override
  _$GameEventGameCopyWith<_GameEventGame> get copyWith =>
      __$GameEventGameCopyWithImpl<_GameEventGame>(this, _$identity);

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
    required TResult Function(_GameEventGame value) game,
    required TResult Function(_GameEventGeneral value) general,
  }) {
    return game(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventGame value)? game,
    TResult Function(_GameEventGeneral value)? general,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(this);
    }
    return orElse();
  }
}

abstract class _GameEventGame extends GameEvent {
  const factory _GameEventGame(Event event) = _$_GameEventGame;
  const _GameEventGame._() : super._();

  Event get event => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GameEventGameCopyWith<_GameEventGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GameEventGeneralCopyWith<$Res> {
  factory _$GameEventGeneralCopyWith(
          _GameEventGeneral value, $Res Function(_GameEventGeneral) then) =
      __$GameEventGeneralCopyWithImpl<$Res>;
  $Res call({GenericEvent event});

  $GenericEventCopyWith<$Res> get event;
}

/// @nodoc
class __$GameEventGeneralCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res>
    implements _$GameEventGeneralCopyWith<$Res> {
  __$GameEventGeneralCopyWithImpl(
      _GameEventGeneral _value, $Res Function(_GameEventGeneral) _then)
      : super(_value, (v) => _then(v as _GameEventGeneral));

  @override
  _GameEventGeneral get _value => super._value as _GameEventGeneral;

  @override
  $Res call({
    Object? event = freezed,
  }) {
    return _then(_GameEventGeneral(
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
class _$_GameEventGeneral extends _GameEventGeneral {
  const _$_GameEventGeneral(this.event) : super._();

  @override
  final GenericEvent event;

  @override
  String toString() {
    return 'GameEvent.general(event: $event)';
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        (other is _GameEventGeneral &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(event);

  @JsonKey(ignore: true)
  @override
  _$GameEventGeneralCopyWith<_GameEventGeneral> get copyWith =>
      __$GameEventGeneralCopyWithImpl<_GameEventGeneral>(this, _$identity);

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
    required TResult Function(_GameEventGame value) game,
    required TResult Function(_GameEventGeneral value) general,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEventGame value)? game,
    TResult Function(_GameEventGeneral value)? general,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class _GameEventGeneral extends GameEvent {
  const factory _GameEventGeneral(GenericEvent event) = _$_GameEventGeneral;
  const _GameEventGeneral._() : super._();

  GenericEvent get event => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GameEventGeneralCopyWith<_GameEventGeneral> get copyWith =>
      throw _privateConstructorUsedError;
}
