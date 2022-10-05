// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Event event) game,
    required TResult Function(GenericEvent event) general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Event event)? game,
    TResult Function(GenericEvent event)? general,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameEventGame value)? game,
    TResult Function(GameEventGeneral value)? general,
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
abstract class _$$GameEventGameCopyWith<$Res> {
  factory _$$GameEventGameCopyWith(
          _$GameEventGame value, $Res Function(_$GameEventGame) then) =
      __$$GameEventGameCopyWithImpl<$Res>;
  $Res call({Event event});
}

/// @nodoc
class __$$GameEventGameCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res>
    implements _$$GameEventGameCopyWith<$Res> {
  __$$GameEventGameCopyWithImpl(
      _$GameEventGame _value, $Res Function(_$GameEventGame) _then)
      : super(_value, (v) => _then(v as _$GameEventGame));

  @override
  _$GameEventGame get _value => super._value as _$GameEventGame;

  @override
  $Res call({
    Object? event = freezed,
  }) {
    return _then(_$GameEventGame(
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
        (other.runtimeType == runtimeType &&
            other is _$GameEventGame &&
            const DeepCollectionEquality().equals(other.event, event));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(event));

  @JsonKey(ignore: true)
  @override
  _$$GameEventGameCopyWith<_$GameEventGame> get copyWith =>
      __$$GameEventGameCopyWithImpl<_$GameEventGame>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Event event)? game,
    TResult Function(GenericEvent event)? general,
  }) {
    return game?.call(event);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameEventGame value)? game,
    TResult Function(GameEventGeneral value)? general,
  }) {
    return game?.call(this);
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
  const factory GameEventGame(final Event event) = _$GameEventGame;
  const GameEventGame._() : super._();

  Event get event;
  @JsonKey(ignore: true)
  _$$GameEventGameCopyWith<_$GameEventGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameEventGeneralCopyWith<$Res> {
  factory _$$GameEventGeneralCopyWith(
          _$GameEventGeneral value, $Res Function(_$GameEventGeneral) then) =
      __$$GameEventGeneralCopyWithImpl<$Res>;
  $Res call({GenericEvent event});

  $GenericEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$GameEventGeneralCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res>
    implements _$$GameEventGeneralCopyWith<$Res> {
  __$$GameEventGeneralCopyWithImpl(
      _$GameEventGeneral _value, $Res Function(_$GameEventGeneral) _then)
      : super(_value, (v) => _then(v as _$GameEventGeneral));

  @override
  _$GameEventGeneral get _value => super._value as _$GameEventGeneral;

  @override
  $Res call({
    Object? event = freezed,
  }) {
    return _then(_$GameEventGeneral(
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
        (other.runtimeType == runtimeType &&
            other is _$GameEventGeneral &&
            const DeepCollectionEquality().equals(other.event, event));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(event));

  @JsonKey(ignore: true)
  @override
  _$$GameEventGeneralCopyWith<_$GameEventGeneral> get copyWith =>
      __$$GameEventGeneralCopyWithImpl<_$GameEventGeneral>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Event event)? game,
    TResult Function(GenericEvent event)? general,
  }) {
    return general?.call(event);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameEventGame value)? game,
    TResult Function(GameEventGeneral value)? general,
  }) {
    return general?.call(this);
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
  const factory GameEventGeneral(final GenericEvent event) = _$GameEventGeneral;
  const GameEventGeneral._() : super._();

  GenericEvent get event;
  @JsonKey(ignore: true)
  _$$GameEventGeneralCopyWith<_$GameEventGeneral> get copyWith =>
      throw _privateConstructorUsedError;
}
