// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'game':
      return EventGame.fromJson(json);
    case 'undo':
      return UndoEvent.fromJson(json);
    case 'readyNextRound':
      return ReadyNextRoundEvent.fromJson(json);
    case 'message':
      return MessageEvent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Event',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  EventGame game(@GameEventConverter() GameEvent event) {
    return EventGame(
      event,
    );
  }

  UndoEvent undo() {
    return const UndoEvent();
  }

  ReadyNextRoundEvent readyNextRound(String player) {
    return ReadyNextRoundEvent(
      player,
    );
  }

  MessageEvent message(String message,
      {required String from, required String? to}) {
    return MessageEvent(
      message,
      from: from,
      to: to,
    );
  }

  Event fromJson(Map<String, Object?> json) {
    return Event.fromJson(json);
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@GameEventConverter() GameEvent event) game,
    required TResult Function() undo,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameEventConverter() GameEvent event)? game,
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameEventConverter() GameEvent event)? game,
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventGame value) game,
    required TResult Function(UndoEvent value) undo,
    required TResult Function(ReadyNextRoundEvent value) readyNextRound,
    required TResult Function(MessageEvent value) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EventGame value)? game,
    TResult Function(UndoEvent value)? undo,
    TResult Function(ReadyNextRoundEvent value)? readyNextRound,
    TResult Function(MessageEvent value)? message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventGame value)? game,
    TResult Function(UndoEvent value)? undo,
    TResult Function(ReadyNextRoundEvent value)? readyNextRound,
    TResult Function(MessageEvent value)? message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;
}

/// @nodoc
abstract class $EventGameCopyWith<$Res> {
  factory $EventGameCopyWith(EventGame value, $Res Function(EventGame) then) =
      _$EventGameCopyWithImpl<$Res>;
  $Res call({@GameEventConverter() GameEvent event});
}

/// @nodoc
class _$EventGameCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements $EventGameCopyWith<$Res> {
  _$EventGameCopyWithImpl(EventGame _value, $Res Function(EventGame) _then)
      : super(_value, (v) => _then(v as EventGame));

  @override
  EventGame get _value => super._value as EventGame;

  @override
  $Res call({
    Object? event = freezed,
  }) {
    return _then(EventGame(
      event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as GameEvent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventGame extends EventGame {
  const _$EventGame(@GameEventConverter() this.event, {String? $type})
      : $type = $type ?? 'game',
        super._();

  factory _$EventGame.fromJson(Map<String, dynamic> json) =>
      _$$EventGameFromJson(json);

  @override
  @GameEventConverter()
  final GameEvent event;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Event.game(event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventGame &&
            const DeepCollectionEquality().equals(other.event, event));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(event));

  @JsonKey(ignore: true)
  @override
  $EventGameCopyWith<EventGame> get copyWith =>
      _$EventGameCopyWithImpl<EventGame>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@GameEventConverter() GameEvent event) game,
    required TResult Function() undo,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return game(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameEventConverter() GameEvent event)? game,
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
  }) {
    return game?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameEventConverter() GameEvent event)? game,
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
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
    required TResult Function(EventGame value) game,
    required TResult Function(UndoEvent value) undo,
    required TResult Function(ReadyNextRoundEvent value) readyNextRound,
    required TResult Function(MessageEvent value) message,
  }) {
    return game(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EventGame value)? game,
    TResult Function(UndoEvent value)? undo,
    TResult Function(ReadyNextRoundEvent value)? readyNextRound,
    TResult Function(MessageEvent value)? message,
  }) {
    return game?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventGame value)? game,
    TResult Function(UndoEvent value)? undo,
    TResult Function(ReadyNextRoundEvent value)? readyNextRound,
    TResult Function(MessageEvent value)? message,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventGameToJson(this);
  }
}

abstract class EventGame extends Event {
  const factory EventGame(@GameEventConverter() GameEvent event) = _$EventGame;
  const EventGame._() : super._();

  factory EventGame.fromJson(Map<String, dynamic> json) = _$EventGame.fromJson;

  @GameEventConverter()
  GameEvent get event;
  @JsonKey(ignore: true)
  $EventGameCopyWith<EventGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UndoEventCopyWith<$Res> {
  factory $UndoEventCopyWith(UndoEvent value, $Res Function(UndoEvent) then) =
      _$UndoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UndoEventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements $UndoEventCopyWith<$Res> {
  _$UndoEventCopyWithImpl(UndoEvent _value, $Res Function(UndoEvent) _then)
      : super(_value, (v) => _then(v as UndoEvent));

  @override
  UndoEvent get _value => super._value as UndoEvent;
}

/// @nodoc
@JsonSerializable()
class _$UndoEvent extends UndoEvent {
  const _$UndoEvent({String? $type})
      : $type = $type ?? 'undo',
        super._();

  factory _$UndoEvent.fromJson(Map<String, dynamic> json) =>
      _$$UndoEventFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Event.undo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UndoEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@GameEventConverter() GameEvent event) game,
    required TResult Function() undo,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return undo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameEventConverter() GameEvent event)? game,
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
  }) {
    return undo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameEventConverter() GameEvent event)? game,
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
    required TResult orElse(),
  }) {
    if (undo != null) {
      return undo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventGame value) game,
    required TResult Function(UndoEvent value) undo,
    required TResult Function(ReadyNextRoundEvent value) readyNextRound,
    required TResult Function(MessageEvent value) message,
  }) {
    return undo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EventGame value)? game,
    TResult Function(UndoEvent value)? undo,
    TResult Function(ReadyNextRoundEvent value)? readyNextRound,
    TResult Function(MessageEvent value)? message,
  }) {
    return undo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventGame value)? game,
    TResult Function(UndoEvent value)? undo,
    TResult Function(ReadyNextRoundEvent value)? readyNextRound,
    TResult Function(MessageEvent value)? message,
    required TResult orElse(),
  }) {
    if (undo != null) {
      return undo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UndoEventToJson(this);
  }
}

abstract class UndoEvent extends Event {
  const factory UndoEvent() = _$UndoEvent;
  const UndoEvent._() : super._();

  factory UndoEvent.fromJson(Map<String, dynamic> json) = _$UndoEvent.fromJson;
}

/// @nodoc
abstract class $ReadyNextRoundEventCopyWith<$Res> {
  factory $ReadyNextRoundEventCopyWith(
          ReadyNextRoundEvent value, $Res Function(ReadyNextRoundEvent) then) =
      _$ReadyNextRoundEventCopyWithImpl<$Res>;
  $Res call({String player});
}

/// @nodoc
class _$ReadyNextRoundEventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements $ReadyNextRoundEventCopyWith<$Res> {
  _$ReadyNextRoundEventCopyWithImpl(
      ReadyNextRoundEvent _value, $Res Function(ReadyNextRoundEvent) _then)
      : super(_value, (v) => _then(v as ReadyNextRoundEvent));

  @override
  ReadyNextRoundEvent get _value => super._value as ReadyNextRoundEvent;

  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(ReadyNextRoundEvent(
      player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadyNextRoundEvent extends ReadyNextRoundEvent {
  const _$ReadyNextRoundEvent(this.player, {String? $type})
      : $type = $type ?? 'readyNextRound',
        super._();

  factory _$ReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =>
      _$$ReadyNextRoundEventFromJson(json);

  @override
  final String player;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Event.readyNextRound(player: $player)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReadyNextRoundEvent &&
            const DeepCollectionEquality().equals(other.player, player));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(player));

  @JsonKey(ignore: true)
  @override
  $ReadyNextRoundEventCopyWith<ReadyNextRoundEvent> get copyWith =>
      _$ReadyNextRoundEventCopyWithImpl<ReadyNextRoundEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@GameEventConverter() GameEvent event) game,
    required TResult Function() undo,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return readyNextRound(player);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameEventConverter() GameEvent event)? game,
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
  }) {
    return readyNextRound?.call(player);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameEventConverter() GameEvent event)? game,
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
    required TResult orElse(),
  }) {
    if (readyNextRound != null) {
      return readyNextRound(player);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventGame value) game,
    required TResult Function(UndoEvent value) undo,
    required TResult Function(ReadyNextRoundEvent value) readyNextRound,
    required TResult Function(MessageEvent value) message,
  }) {
    return readyNextRound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EventGame value)? game,
    TResult Function(UndoEvent value)? undo,
    TResult Function(ReadyNextRoundEvent value)? readyNextRound,
    TResult Function(MessageEvent value)? message,
  }) {
    return readyNextRound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventGame value)? game,
    TResult Function(UndoEvent value)? undo,
    TResult Function(ReadyNextRoundEvent value)? readyNextRound,
    TResult Function(MessageEvent value)? message,
    required TResult orElse(),
  }) {
    if (readyNextRound != null) {
      return readyNextRound(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadyNextRoundEventToJson(this);
  }
}

abstract class ReadyNextRoundEvent extends Event {
  const factory ReadyNextRoundEvent(String player) = _$ReadyNextRoundEvent;
  const ReadyNextRoundEvent._() : super._();

  factory ReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =
      _$ReadyNextRoundEvent.fromJson;

  String get player;
  @JsonKey(ignore: true)
  $ReadyNextRoundEventCopyWith<ReadyNextRoundEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEventCopyWith<$Res> {
  factory $MessageEventCopyWith(
          MessageEvent value, $Res Function(MessageEvent) then) =
      _$MessageEventCopyWithImpl<$Res>;
  $Res call({String message, String from, String? to});
}

/// @nodoc
class _$MessageEventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements $MessageEventCopyWith<$Res> {
  _$MessageEventCopyWithImpl(
      MessageEvent _value, $Res Function(MessageEvent) _then)
      : super(_value, (v) => _then(v as MessageEvent));

  @override
  MessageEvent get _value => super._value as MessageEvent;

  @override
  $Res call({
    Object? message = freezed,
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(MessageEvent(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageEvent extends MessageEvent {
  const _$MessageEvent(this.message,
      {required this.from, required this.to, String? $type})
      : $type = $type ?? 'message',
        super._();

  factory _$MessageEvent.fromJson(Map<String, dynamic> json) =>
      _$$MessageEventFromJson(json);

  @override
  final String message;
  @override
  final String from;
  @override
  final String? to;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Event.message(message: $message, from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageEvent &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to));

  @JsonKey(ignore: true)
  @override
  $MessageEventCopyWith<MessageEvent> get copyWith =>
      _$MessageEventCopyWithImpl<MessageEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@GameEventConverter() GameEvent event) game,
    required TResult Function() undo,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return message(this.message, from, to);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(@GameEventConverter() GameEvent event)? game,
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
  }) {
    return message?.call(this.message, from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@GameEventConverter() GameEvent event)? game,
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this.message, from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventGame value) game,
    required TResult Function(UndoEvent value) undo,
    required TResult Function(ReadyNextRoundEvent value) readyNextRound,
    required TResult Function(MessageEvent value) message,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EventGame value)? game,
    TResult Function(UndoEvent value)? undo,
    TResult Function(ReadyNextRoundEvent value)? readyNextRound,
    TResult Function(MessageEvent value)? message,
  }) {
    return message?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventGame value)? game,
    TResult Function(UndoEvent value)? undo,
    TResult Function(ReadyNextRoundEvent value)? readyNextRound,
    TResult Function(MessageEvent value)? message,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageEventToJson(this);
  }
}

abstract class MessageEvent extends Event {
  const factory MessageEvent(String message,
      {required String from, required String? to}) = _$MessageEvent;
  const MessageEvent._() : super._();

  factory MessageEvent.fromJson(Map<String, dynamic> json) =
      _$MessageEvent.fromJson;

  String get message;
  String get from;
  String? get to;
  @JsonKey(ignore: true)
  $MessageEventCopyWith<MessageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

Matrix _$MatrixFromJson(Map<String, dynamic> json) {
  return _Matrix.fromJson(json);
}

/// @nodoc
class _$MatrixTearOff {
  const _$MatrixTearOff();

  _Matrix call(List<List<Reward>> rewards) {
    return _Matrix(
      rewards,
    );
  }

  Matrix fromJson(Map<String, Object?> json) {
    return Matrix.fromJson(json);
  }
}

/// @nodoc
const $Matrix = _$MatrixTearOff();

/// @nodoc
mixin _$Matrix {
  List<List<Reward>> get rewards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatrixCopyWith<Matrix> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatrixCopyWith<$Res> {
  factory $MatrixCopyWith(Matrix value, $Res Function(Matrix) then) =
      _$MatrixCopyWithImpl<$Res>;
  $Res call({List<List<Reward>> rewards});
}

/// @nodoc
class _$MatrixCopyWithImpl<$Res> implements $MatrixCopyWith<$Res> {
  _$MatrixCopyWithImpl(this._value, this._then);

  final Matrix _value;
  // ignore: unused_field
  final $Res Function(Matrix) _then;

  @override
  $Res call({
    Object? rewards = freezed,
  }) {
    return _then(_value.copyWith(
      rewards: rewards == freezed
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<List<Reward>>,
    ));
  }
}

/// @nodoc
abstract class _$MatrixCopyWith<$Res> implements $MatrixCopyWith<$Res> {
  factory _$MatrixCopyWith(_Matrix value, $Res Function(_Matrix) then) =
      __$MatrixCopyWithImpl<$Res>;
  @override
  $Res call({List<List<Reward>> rewards});
}

/// @nodoc
class __$MatrixCopyWithImpl<$Res> extends _$MatrixCopyWithImpl<$Res>
    implements _$MatrixCopyWith<$Res> {
  __$MatrixCopyWithImpl(_Matrix _value, $Res Function(_Matrix) _then)
      : super(_value, (v) => _then(v as _Matrix));

  @override
  _Matrix get _value => super._value as _Matrix;

  @override
  $Res call({
    Object? rewards = freezed,
  }) {
    return _then(_Matrix(
      rewards == freezed
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<List<Reward>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Matrix implements _Matrix {
  const _$_Matrix(this.rewards);

  factory _$_Matrix.fromJson(Map<String, dynamic> json) =>
      _$$_MatrixFromJson(json);

  @override
  final List<List<Reward>> rewards;

  @override
  String toString() {
    return 'Matrix(rewards: $rewards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Matrix &&
            const DeepCollectionEquality().equals(other.rewards, rewards));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(rewards));

  @JsonKey(ignore: true)
  @override
  _$MatrixCopyWith<_Matrix> get copyWith =>
      __$MatrixCopyWithImpl<_Matrix>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatrixToJson(this);
  }
}

abstract class _Matrix implements Matrix {
  const factory _Matrix(List<List<Reward>> rewards) = _$_Matrix;

  factory _Matrix.fromJson(Map<String, dynamic> json) = _$_Matrix.fromJson;

  @override
  List<List<Reward>> get rewards;
  @override
  @JsonKey(ignore: true)
  _$MatrixCopyWith<_Matrix> get copyWith => throw _privateConstructorUsedError;
}

JointAction _$JointActionFromJson(Map<String, dynamic> json) {
  return _JointAction.fromJson(json);
}

/// @nodoc
class _$JointActionTearOff {
  const _$JointActionTearOff();

  _JointAction twoPlayer({required int p1, required int p2}) {
    return _JointAction(
      p1: p1,
      p2: p2,
    );
  }

  JointAction fromJson(Map<String, Object?> json) {
    return JointAction.fromJson(json);
  }
}

/// @nodoc
const $JointAction = _$JointActionTearOff();

/// @nodoc
mixin _$JointAction {
  int get p1 => throw _privateConstructorUsedError;
  int get p2 => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int p1, int p2) twoPlayer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int p1, int p2)? twoPlayer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int p1, int p2)? twoPlayer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JointAction value) twoPlayer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_JointAction value)? twoPlayer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JointAction value)? twoPlayer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JointActionCopyWith<JointAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JointActionCopyWith<$Res> {
  factory $JointActionCopyWith(
          JointAction value, $Res Function(JointAction) then) =
      _$JointActionCopyWithImpl<$Res>;
  $Res call({int p1, int p2});
}

/// @nodoc
class _$JointActionCopyWithImpl<$Res> implements $JointActionCopyWith<$Res> {
  _$JointActionCopyWithImpl(this._value, this._then);

  final JointAction _value;
  // ignore: unused_field
  final $Res Function(JointAction) _then;

  @override
  $Res call({
    Object? p1 = freezed,
    Object? p2 = freezed,
  }) {
    return _then(_value.copyWith(
      p1: p1 == freezed
          ? _value.p1
          : p1 // ignore: cast_nullable_to_non_nullable
              as int,
      p2: p2 == freezed
          ? _value.p2
          : p2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$JointActionCopyWith<$Res>
    implements $JointActionCopyWith<$Res> {
  factory _$JointActionCopyWith(
          _JointAction value, $Res Function(_JointAction) then) =
      __$JointActionCopyWithImpl<$Res>;
  @override
  $Res call({int p1, int p2});
}

/// @nodoc
class __$JointActionCopyWithImpl<$Res> extends _$JointActionCopyWithImpl<$Res>
    implements _$JointActionCopyWith<$Res> {
  __$JointActionCopyWithImpl(
      _JointAction _value, $Res Function(_JointAction) _then)
      : super(_value, (v) => _then(v as _JointAction));

  @override
  _JointAction get _value => super._value as _JointAction;

  @override
  $Res call({
    Object? p1 = freezed,
    Object? p2 = freezed,
  }) {
    return _then(_JointAction(
      p1: p1 == freezed
          ? _value.p1
          : p1 // ignore: cast_nullable_to_non_nullable
              as int,
      p2: p2 == freezed
          ? _value.p2
          : p2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JointAction implements _JointAction {
  const _$_JointAction({required this.p1, required this.p2});

  factory _$_JointAction.fromJson(Map<String, dynamic> json) =>
      _$$_JointActionFromJson(json);

  @override
  final int p1;
  @override
  final int p2;

  @override
  String toString() {
    return 'JointAction.twoPlayer(p1: $p1, p2: $p2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JointAction &&
            const DeepCollectionEquality().equals(other.p1, p1) &&
            const DeepCollectionEquality().equals(other.p2, p2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(p1),
      const DeepCollectionEquality().hash(p2));

  @JsonKey(ignore: true)
  @override
  _$JointActionCopyWith<_JointAction> get copyWith =>
      __$JointActionCopyWithImpl<_JointAction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int p1, int p2) twoPlayer,
  }) {
    return twoPlayer(p1, p2);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int p1, int p2)? twoPlayer,
  }) {
    return twoPlayer?.call(p1, p2);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int p1, int p2)? twoPlayer,
    required TResult orElse(),
  }) {
    if (twoPlayer != null) {
      return twoPlayer(p1, p2);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JointAction value) twoPlayer,
  }) {
    return twoPlayer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_JointAction value)? twoPlayer,
  }) {
    return twoPlayer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JointAction value)? twoPlayer,
    required TResult orElse(),
  }) {
    if (twoPlayer != null) {
      return twoPlayer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_JointActionToJson(this);
  }
}

abstract class _JointAction implements JointAction {
  const factory _JointAction({required int p1, required int p2}) =
      _$_JointAction;

  factory _JointAction.fromJson(Map<String, dynamic> json) =
      _$_JointAction.fromJson;

  @override
  int get p1;
  @override
  int get p2;
  @override
  @JsonKey(ignore: true)
  _$JointActionCopyWith<_JointAction> get copyWith =>
      throw _privateConstructorUsedError;
}

Reward _$RewardFromJson(Map<String, dynamic> json) {
  return _Reward.fromJson(json);
}

/// @nodoc
class _$RewardTearOff {
  const _$RewardTearOff();

  _Reward call({required double p1, required double p2}) {
    return _Reward(
      p1: p1,
      p2: p2,
    );
  }

  Reward fromJson(Map<String, Object?> json) {
    return Reward.fromJson(json);
  }
}

/// @nodoc
const $Reward = _$RewardTearOff();

/// @nodoc
mixin _$Reward {
  double get p1 => throw _privateConstructorUsedError;
  double get p2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RewardCopyWith<Reward> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardCopyWith<$Res> {
  factory $RewardCopyWith(Reward value, $Res Function(Reward) then) =
      _$RewardCopyWithImpl<$Res>;
  $Res call({double p1, double p2});
}

/// @nodoc
class _$RewardCopyWithImpl<$Res> implements $RewardCopyWith<$Res> {
  _$RewardCopyWithImpl(this._value, this._then);

  final Reward _value;
  // ignore: unused_field
  final $Res Function(Reward) _then;

  @override
  $Res call({
    Object? p1 = freezed,
    Object? p2 = freezed,
  }) {
    return _then(_value.copyWith(
      p1: p1 == freezed
          ? _value.p1
          : p1 // ignore: cast_nullable_to_non_nullable
              as double,
      p2: p2 == freezed
          ? _value.p2
          : p2 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$RewardCopyWith<$Res> implements $RewardCopyWith<$Res> {
  factory _$RewardCopyWith(_Reward value, $Res Function(_Reward) then) =
      __$RewardCopyWithImpl<$Res>;
  @override
  $Res call({double p1, double p2});
}

/// @nodoc
class __$RewardCopyWithImpl<$Res> extends _$RewardCopyWithImpl<$Res>
    implements _$RewardCopyWith<$Res> {
  __$RewardCopyWithImpl(_Reward _value, $Res Function(_Reward) _then)
      : super(_value, (v) => _then(v as _Reward));

  @override
  _Reward get _value => super._value as _Reward;

  @override
  $Res call({
    Object? p1 = freezed,
    Object? p2 = freezed,
  }) {
    return _then(_Reward(
      p1: p1 == freezed
          ? _value.p1
          : p1 // ignore: cast_nullable_to_non_nullable
              as double,
      p2: p2 == freezed
          ? _value.p2
          : p2 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reward implements _Reward {
  const _$_Reward({required this.p1, required this.p2});

  factory _$_Reward.fromJson(Map<String, dynamic> json) =>
      _$$_RewardFromJson(json);

  @override
  final double p1;
  @override
  final double p2;

  @override
  String toString() {
    return 'Reward(p1: $p1, p2: $p2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reward &&
            const DeepCollectionEquality().equals(other.p1, p1) &&
            const DeepCollectionEquality().equals(other.p2, p2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(p1),
      const DeepCollectionEquality().hash(p2));

  @JsonKey(ignore: true)
  @override
  _$RewardCopyWith<_Reward> get copyWith =>
      __$RewardCopyWithImpl<_Reward>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RewardToJson(this);
  }
}

abstract class _Reward implements Reward {
  const factory _Reward({required double p1, required double p2}) = _$_Reward;

  factory _Reward.fromJson(Map<String, dynamic> json) = _$_Reward.fromJson;

  @override
  double get p1;
  @override
  double get p2;
  @override
  @JsonKey(ignore: true)
  _$RewardCopyWith<_Reward> get copyWith => throw _privateConstructorUsedError;
}

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
class _$GameTearOff {
  const _$GameTearOff();

  _Game call(
      IList<Player> players,
      IList<String> readyPlayers,
      IList<IList<double>> allRoundScores,
      DateTime time,
      IList<MessageEvent> messages,
      GameStatus status,
      int? currentPlayerIndex,
      int round,
      bool isMultiPly,
      bool isSimultaneousAction,
      @GameStateConverter() GameState gameState) {
    return _Game(
      players,
      readyPlayers,
      allRoundScores,
      time,
      messages,
      status,
      currentPlayerIndex,
      round,
      isMultiPly,
      isSimultaneousAction,
      gameState,
    );
  }

  Game fromJson(Map<String, Object?> json) {
    return Game.fromJson(json);
  }
}

/// @nodoc
const $Game = _$GameTearOff();

/// @nodoc
mixin _$Game {
  IList<Player> get players => throw _privateConstructorUsedError;
  IList<String> get readyPlayers => throw _privateConstructorUsedError;
  IList<IList<double>> get allRoundScores => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  IList<MessageEvent> get messages => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  int? get currentPlayerIndex => throw _privateConstructorUsedError;
  int get round =>
      throw _privateConstructorUsedError; // ignore: avoid_positional_boolean_parameters
  bool get isMultiPly => throw _privateConstructorUsedError;
  bool get isSimultaneousAction => throw _privateConstructorUsedError;
  @GameStateConverter()
  GameState get gameState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res>;
  $Res call(
      {IList<Player> players,
      IList<String> readyPlayers,
      IList<IList<double>> allRoundScores,
      DateTime time,
      IList<MessageEvent> messages,
      GameStatus status,
      int? currentPlayerIndex,
      int round,
      bool isMultiPly,
      bool isSimultaneousAction,
      @GameStateConverter() GameState gameState});
}

/// @nodoc
class _$GameCopyWithImpl<$Res> implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  final Game _value;
  // ignore: unused_field
  final $Res Function(Game) _then;

  @override
  $Res call({
    Object? players = freezed,
    Object? readyPlayers = freezed,
    Object? allRoundScores = freezed,
    Object? time = freezed,
    Object? messages = freezed,
    Object? status = freezed,
    Object? currentPlayerIndex = freezed,
    Object? round = freezed,
    Object? isMultiPly = freezed,
    Object? isSimultaneousAction = freezed,
    Object? gameState = freezed,
  }) {
    return _then(_value.copyWith(
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<Player>,
      readyPlayers: readyPlayers == freezed
          ? _value.readyPlayers
          : readyPlayers // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      allRoundScores: allRoundScores == freezed
          ? _value.allRoundScores
          : allRoundScores // ignore: cast_nullable_to_non_nullable
              as IList<IList<double>>,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as IList<MessageEvent>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      currentPlayerIndex: currentPlayerIndex == freezed
          ? _value.currentPlayerIndex
          : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      round: round == freezed
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      isMultiPly: isMultiPly == freezed
          ? _value.isMultiPly
          : isMultiPly // ignore: cast_nullable_to_non_nullable
              as bool,
      isSimultaneousAction: isSimultaneousAction == freezed
          ? _value.isSimultaneousAction
          : isSimultaneousAction // ignore: cast_nullable_to_non_nullable
              as bool,
      gameState: gameState == freezed
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as GameState,
    ));
  }
}

/// @nodoc
abstract class _$GameCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$GameCopyWith(_Game value, $Res Function(_Game) then) =
      __$GameCopyWithImpl<$Res>;
  @override
  $Res call(
      {IList<Player> players,
      IList<String> readyPlayers,
      IList<IList<double>> allRoundScores,
      DateTime time,
      IList<MessageEvent> messages,
      GameStatus status,
      int? currentPlayerIndex,
      int round,
      bool isMultiPly,
      bool isSimultaneousAction,
      @GameStateConverter() GameState gameState});
}

/// @nodoc
class __$GameCopyWithImpl<$Res> extends _$GameCopyWithImpl<$Res>
    implements _$GameCopyWith<$Res> {
  __$GameCopyWithImpl(_Game _value, $Res Function(_Game) _then)
      : super(_value, (v) => _then(v as _Game));

  @override
  _Game get _value => super._value as _Game;

  @override
  $Res call({
    Object? players = freezed,
    Object? readyPlayers = freezed,
    Object? allRoundScores = freezed,
    Object? time = freezed,
    Object? messages = freezed,
    Object? status = freezed,
    Object? currentPlayerIndex = freezed,
    Object? round = freezed,
    Object? isMultiPly = freezed,
    Object? isSimultaneousAction = freezed,
    Object? gameState = freezed,
  }) {
    return _then(_Game(
      players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<Player>,
      readyPlayers == freezed
          ? _value.readyPlayers
          : readyPlayers // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      allRoundScores == freezed
          ? _value.allRoundScores
          : allRoundScores // ignore: cast_nullable_to_non_nullable
              as IList<IList<double>>,
      time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as IList<MessageEvent>,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      currentPlayerIndex == freezed
          ? _value.currentPlayerIndex
          : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      round == freezed
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      isMultiPly == freezed
          ? _value.isMultiPly
          : isMultiPly // ignore: cast_nullable_to_non_nullable
              as bool,
      isSimultaneousAction == freezed
          ? _value.isSimultaneousAction
          : isSimultaneousAction // ignore: cast_nullable_to_non_nullable
              as bool,
      gameState == freezed
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as GameState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Game extends _Game {
  const _$_Game(
      this.players,
      this.readyPlayers,
      this.allRoundScores,
      this.time,
      this.messages,
      this.status,
      this.currentPlayerIndex,
      this.round,
      this.isMultiPly,
      this.isSimultaneousAction,
      @GameStateConverter() this.gameState)
      : super._();

  factory _$_Game.fromJson(Map<String, dynamic> json) => _$$_GameFromJson(json);

  @override
  final IList<Player> players;
  @override
  final IList<String> readyPlayers;
  @override
  final IList<IList<double>> allRoundScores;
  @override
  final DateTime time;
  @override
  final IList<MessageEvent> messages;
  @override
  final GameStatus status;
  @override
  final int? currentPlayerIndex;
  @override
  final int round;
  @override // ignore: avoid_positional_boolean_parameters
  final bool isMultiPly;
  @override
  final bool isSimultaneousAction;
  @override
  @GameStateConverter()
  final GameState gameState;

  @override
  String toString() {
    return 'Game(players: $players, readyPlayers: $readyPlayers, allRoundScores: $allRoundScores, time: $time, messages: $messages, status: $status, currentPlayerIndex: $currentPlayerIndex, round: $round, isMultiPly: $isMultiPly, isSimultaneousAction: $isSimultaneousAction, gameState: $gameState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Game &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality()
                .equals(other.readyPlayers, readyPlayers) &&
            const DeepCollectionEquality()
                .equals(other.allRoundScores, allRoundScores) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.currentPlayerIndex, currentPlayerIndex) &&
            const DeepCollectionEquality().equals(other.round, round) &&
            const DeepCollectionEquality()
                .equals(other.isMultiPly, isMultiPly) &&
            const DeepCollectionEquality()
                .equals(other.isSimultaneousAction, isSimultaneousAction) &&
            const DeepCollectionEquality().equals(other.gameState, gameState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(readyPlayers),
      const DeepCollectionEquality().hash(allRoundScores),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(currentPlayerIndex),
      const DeepCollectionEquality().hash(round),
      const DeepCollectionEquality().hash(isMultiPly),
      const DeepCollectionEquality().hash(isSimultaneousAction),
      const DeepCollectionEquality().hash(gameState));

  @JsonKey(ignore: true)
  @override
  _$GameCopyWith<_Game> get copyWith =>
      __$GameCopyWithImpl<_Game>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameToJson(this);
  }
}

abstract class _Game extends Game {
  const factory _Game(
      IList<Player> players,
      IList<String> readyPlayers,
      IList<IList<double>> allRoundScores,
      DateTime time,
      IList<MessageEvent> messages,
      GameStatus status,
      int? currentPlayerIndex,
      int round,
      bool isMultiPly,
      bool isSimultaneousAction,
      @GameStateConverter() GameState gameState) = _$_Game;
  const _Game._() : super._();

  factory _Game.fromJson(Map<String, dynamic> json) = _$_Game.fromJson;

  @override
  IList<Player> get players;
  @override
  IList<String> get readyPlayers;
  @override
  IList<IList<double>> get allRoundScores;
  @override
  DateTime get time;
  @override
  IList<MessageEvent> get messages;
  @override
  GameStatus get status;
  @override
  int? get currentPlayerIndex;
  @override
  int get round;
  @override // ignore: avoid_positional_boolean_parameters
  bool get isMultiPly;
  @override
  bool get isSimultaneousAction;
  @override
  @GameStateConverter()
  GameState get gameState;
  @override
  @JsonKey(ignore: true)
  _$GameCopyWith<_Game> get copyWith => throw _privateConstructorUsedError;
}

GameConfig _$GameConfigFromJson(Map<String, dynamic> json) {
  return _GameConfig.fromJson(json);
}

/// @nodoc
class _$GameConfigTearOff {
  const _$GameConfigTearOff();

  _GameConfig call(
      {required String gameType,
      String? adminID,
      NameSet nameSet = NameSet.Basic,
      bool customNames = false,
      int rounds = 15,
      int minPlayers = 1,
      int maxPlayers = 10,
      bool autoStart = true,
      Map<String, Object?>? options}) {
    return _GameConfig(
      gameType: gameType,
      adminID: adminID,
      nameSet: nameSet,
      customNames: customNames,
      rounds: rounds,
      minPlayers: minPlayers,
      maxPlayers: maxPlayers,
      autoStart: autoStart,
      options: options,
    );
  }

  GameConfig fromJson(Map<String, Object?> json) {
    return GameConfig.fromJson(json);
  }
}

/// @nodoc
const $GameConfig = _$GameConfigTearOff();

/// @nodoc
mixin _$GameConfig {
  String get gameType => throw _privateConstructorUsedError;
  String? get adminID => throw _privateConstructorUsedError;
  NameSet get nameSet => throw _privateConstructorUsedError;
  bool get customNames => throw _privateConstructorUsedError;
  int get rounds => throw _privateConstructorUsedError;
  int get minPlayers => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  bool get autoStart => throw _privateConstructorUsedError;

  /// [options] must be json serializable
  Map<String, Object?>? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameConfigCopyWith<GameConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameConfigCopyWith<$Res> {
  factory $GameConfigCopyWith(
          GameConfig value, $Res Function(GameConfig) then) =
      _$GameConfigCopyWithImpl<$Res>;
  $Res call(
      {String gameType,
      String? adminID,
      NameSet nameSet,
      bool customNames,
      int rounds,
      int minPlayers,
      int maxPlayers,
      bool autoStart,
      Map<String, Object?>? options});
}

/// @nodoc
class _$GameConfigCopyWithImpl<$Res> implements $GameConfigCopyWith<$Res> {
  _$GameConfigCopyWithImpl(this._value, this._then);

  final GameConfig _value;
  // ignore: unused_field
  final $Res Function(GameConfig) _then;

  @override
  $Res call({
    Object? gameType = freezed,
    Object? adminID = freezed,
    Object? nameSet = freezed,
    Object? customNames = freezed,
    Object? rounds = freezed,
    Object? minPlayers = freezed,
    Object? maxPlayers = freezed,
    Object? autoStart = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      gameType: gameType == freezed
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      adminID: adminID == freezed
          ? _value.adminID
          : adminID // ignore: cast_nullable_to_non_nullable
              as String?,
      nameSet: nameSet == freezed
          ? _value.nameSet
          : nameSet // ignore: cast_nullable_to_non_nullable
              as NameSet,
      customNames: customNames == freezed
          ? _value.customNames
          : customNames // ignore: cast_nullable_to_non_nullable
              as bool,
      rounds: rounds == freezed
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      minPlayers: minPlayers == freezed
          ? _value.minPlayers
          : minPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: maxPlayers == freezed
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      autoStart: autoStart == freezed
          ? _value.autoStart
          : autoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

/// @nodoc
abstract class _$GameConfigCopyWith<$Res> implements $GameConfigCopyWith<$Res> {
  factory _$GameConfigCopyWith(
          _GameConfig value, $Res Function(_GameConfig) then) =
      __$GameConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {String gameType,
      String? adminID,
      NameSet nameSet,
      bool customNames,
      int rounds,
      int minPlayers,
      int maxPlayers,
      bool autoStart,
      Map<String, Object?>? options});
}

/// @nodoc
class __$GameConfigCopyWithImpl<$Res> extends _$GameConfigCopyWithImpl<$Res>
    implements _$GameConfigCopyWith<$Res> {
  __$GameConfigCopyWithImpl(
      _GameConfig _value, $Res Function(_GameConfig) _then)
      : super(_value, (v) => _then(v as _GameConfig));

  @override
  _GameConfig get _value => super._value as _GameConfig;

  @override
  $Res call({
    Object? gameType = freezed,
    Object? adminID = freezed,
    Object? nameSet = freezed,
    Object? customNames = freezed,
    Object? rounds = freezed,
    Object? minPlayers = freezed,
    Object? maxPlayers = freezed,
    Object? autoStart = freezed,
    Object? options = freezed,
  }) {
    return _then(_GameConfig(
      gameType: gameType == freezed
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      adminID: adminID == freezed
          ? _value.adminID
          : adminID // ignore: cast_nullable_to_non_nullable
              as String?,
      nameSet: nameSet == freezed
          ? _value.nameSet
          : nameSet // ignore: cast_nullable_to_non_nullable
              as NameSet,
      customNames: customNames == freezed
          ? _value.customNames
          : customNames // ignore: cast_nullable_to_non_nullable
              as bool,
      rounds: rounds == freezed
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      minPlayers: minPlayers == freezed
          ? _value.minPlayers
          : minPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: maxPlayers == freezed
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      autoStart: autoStart == freezed
          ? _value.autoStart
          : autoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameConfig implements _GameConfig {
  const _$_GameConfig(
      {required this.gameType,
      this.adminID,
      this.nameSet = NameSet.Basic,
      this.customNames = false,
      this.rounds = 15,
      this.minPlayers = 1,
      this.maxPlayers = 10,
      this.autoStart = true,
      this.options});

  factory _$_GameConfig.fromJson(Map<String, dynamic> json) =>
      _$$_GameConfigFromJson(json);

  @override
  final String gameType;
  @override
  final String? adminID;
  @JsonKey()
  @override
  final NameSet nameSet;
  @JsonKey()
  @override
  final bool customNames;
  @JsonKey()
  @override
  final int rounds;
  @JsonKey()
  @override
  final int minPlayers;
  @JsonKey()
  @override
  final int maxPlayers;
  @JsonKey()
  @override
  final bool autoStart;
  @override

  /// [options] must be json serializable
  final Map<String, Object?>? options;

  @override
  String toString() {
    return 'GameConfig(gameType: $gameType, adminID: $adminID, nameSet: $nameSet, customNames: $customNames, rounds: $rounds, minPlayers: $minPlayers, maxPlayers: $maxPlayers, autoStart: $autoStart, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameConfig &&
            const DeepCollectionEquality().equals(other.gameType, gameType) &&
            const DeepCollectionEquality().equals(other.adminID, adminID) &&
            const DeepCollectionEquality().equals(other.nameSet, nameSet) &&
            const DeepCollectionEquality()
                .equals(other.customNames, customNames) &&
            const DeepCollectionEquality().equals(other.rounds, rounds) &&
            const DeepCollectionEquality()
                .equals(other.minPlayers, minPlayers) &&
            const DeepCollectionEquality()
                .equals(other.maxPlayers, maxPlayers) &&
            const DeepCollectionEquality().equals(other.autoStart, autoStart) &&
            const DeepCollectionEquality().equals(other.options, options));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gameType),
      const DeepCollectionEquality().hash(adminID),
      const DeepCollectionEquality().hash(nameSet),
      const DeepCollectionEquality().hash(customNames),
      const DeepCollectionEquality().hash(rounds),
      const DeepCollectionEquality().hash(minPlayers),
      const DeepCollectionEquality().hash(maxPlayers),
      const DeepCollectionEquality().hash(autoStart),
      const DeepCollectionEquality().hash(options));

  @JsonKey(ignore: true)
  @override
  _$GameConfigCopyWith<_GameConfig> get copyWith =>
      __$GameConfigCopyWithImpl<_GameConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameConfigToJson(this);
  }
}

abstract class _GameConfig implements GameConfig {
  const factory _GameConfig(
      {required String gameType,
      String? adminID,
      NameSet nameSet,
      bool customNames,
      int rounds,
      int minPlayers,
      int maxPlayers,
      bool autoStart,
      Map<String, Object?>? options}) = _$_GameConfig;

  factory _GameConfig.fromJson(Map<String, dynamic> json) =
      _$_GameConfig.fromJson;

  @override
  String get gameType;
  @override
  String? get adminID;
  @override
  NameSet get nameSet;
  @override
  bool get customNames;
  @override
  int get rounds;
  @override
  int get minPlayers;
  @override
  int get maxPlayers;
  @override
  bool get autoStart;
  @override

  /// [options] must be json serializable
  Map<String, Object?>? get options;
  @override
  @JsonKey(ignore: true)
  _$GameConfigCopyWith<_GameConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

GameInfo _$GameInfoFromJson(Map<String, dynamic> json) {
  return _GameInfo.fromJson(json);
}

/// @nodoc
class _$GameInfoTearOff {
  const _$GameInfoTearOff();

  _GameInfo call(
      {required String gameId,
      required IList<String> players,
      required String player,
      required bool creator,
      required String gameType,
      required GameStatus status}) {
    return _GameInfo(
      gameId: gameId,
      players: players,
      player: player,
      creator: creator,
      gameType: gameType,
      status: status,
    );
  }

  GameInfo fromJson(Map<String, Object?> json) {
    return GameInfo.fromJson(json);
  }
}

/// @nodoc
const $GameInfo = _$GameInfoTearOff();

/// @nodoc
mixin _$GameInfo {
  String get gameId => throw _privateConstructorUsedError;
  IList<String> get players => throw _privateConstructorUsedError;
  String get player => throw _privateConstructorUsedError;
  bool get creator => throw _privateConstructorUsedError;
  String get gameType => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameInfoCopyWith<GameInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameInfoCopyWith<$Res> {
  factory $GameInfoCopyWith(GameInfo value, $Res Function(GameInfo) then) =
      _$GameInfoCopyWithImpl<$Res>;
  $Res call(
      {String gameId,
      IList<String> players,
      String player,
      bool creator,
      String gameType,
      GameStatus status});
}

/// @nodoc
class _$GameInfoCopyWithImpl<$Res> implements $GameInfoCopyWith<$Res> {
  _$GameInfoCopyWithImpl(this._value, this._then);

  final GameInfo _value;
  // ignore: unused_field
  final $Res Function(GameInfo) _then;

  @override
  $Res call({
    Object? gameId = freezed,
    Object? players = freezed,
    Object? player = freezed,
    Object? creator = freezed,
    Object? gameType = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      gameId: gameId == freezed
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as bool,
      gameType: gameType == freezed
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }
}

/// @nodoc
abstract class _$GameInfoCopyWith<$Res> implements $GameInfoCopyWith<$Res> {
  factory _$GameInfoCopyWith(_GameInfo value, $Res Function(_GameInfo) then) =
      __$GameInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String gameId,
      IList<String> players,
      String player,
      bool creator,
      String gameType,
      GameStatus status});
}

/// @nodoc
class __$GameInfoCopyWithImpl<$Res> extends _$GameInfoCopyWithImpl<$Res>
    implements _$GameInfoCopyWith<$Res> {
  __$GameInfoCopyWithImpl(_GameInfo _value, $Res Function(_GameInfo) _then)
      : super(_value, (v) => _then(v as _GameInfo));

  @override
  _GameInfo get _value => super._value as _GameInfo;

  @override
  $Res call({
    Object? gameId = freezed,
    Object? players = freezed,
    Object? player = freezed,
    Object? creator = freezed,
    Object? gameType = freezed,
    Object? status = freezed,
  }) {
    return _then(_GameInfo(
      gameId: gameId == freezed
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as bool,
      gameType: gameType == freezed
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameInfo implements _GameInfo {
  const _$_GameInfo(
      {required this.gameId,
      required this.players,
      required this.player,
      required this.creator,
      required this.gameType,
      required this.status});

  factory _$_GameInfo.fromJson(Map<String, dynamic> json) =>
      _$$_GameInfoFromJson(json);

  @override
  final String gameId;
  @override
  final IList<String> players;
  @override
  final String player;
  @override
  final bool creator;
  @override
  final String gameType;
  @override
  final GameStatus status;

  @override
  String toString() {
    return 'GameInfo(gameId: $gameId, players: $players, player: $player, creator: $creator, gameType: $gameType, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameInfo &&
            const DeepCollectionEquality().equals(other.gameId, gameId) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            const DeepCollectionEquality().equals(other.gameType, gameType) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gameId),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(gameType),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$GameInfoCopyWith<_GameInfo> get copyWith =>
      __$GameInfoCopyWithImpl<_GameInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameInfoToJson(this);
  }
}

abstract class _GameInfo implements GameInfo {
  const factory _GameInfo(
      {required String gameId,
      required IList<String> players,
      required String player,
      required bool creator,
      required String gameType,
      required GameStatus status}) = _$_GameInfo;

  factory _GameInfo.fromJson(Map<String, dynamic> json) = _$_GameInfo.fromJson;

  @override
  String get gameId;
  @override
  IList<String> get players;
  @override
  String get player;
  @override
  bool get creator;
  @override
  String get gameType;
  @override
  GameStatus get status;
  @override
  @JsonKey(ignore: true)
  _$GameInfoCopyWith<_GameInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Lobby _$LobbyFromJson(Map<String, dynamic> json) {
  return _Lobby.fromJson(json);
}

/// @nodoc
class _$LobbyTearOff {
  const _$LobbyTearOff();

  _Lobby call(
      {required String code,
      required ISet<Player> players,
      required GameConfig config,
      required GameStatus gameStatus}) {
    return _Lobby(
      code: code,
      players: players,
      config: config,
      gameStatus: gameStatus,
    );
  }

  Lobby fromJson(Map<String, Object?> json) {
    return Lobby.fromJson(json);
  }
}

/// @nodoc
const $Lobby = _$LobbyTearOff();

/// @nodoc
mixin _$Lobby {
  String get code => throw _privateConstructorUsedError;
  ISet<Player> get players => throw _privateConstructorUsedError;
  GameConfig get config => throw _privateConstructorUsedError;
  GameStatus get gameStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LobbyCopyWith<Lobby> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LobbyCopyWith<$Res> {
  factory $LobbyCopyWith(Lobby value, $Res Function(Lobby) then) =
      _$LobbyCopyWithImpl<$Res>;
  $Res call(
      {String code,
      ISet<Player> players,
      GameConfig config,
      GameStatus gameStatus});

  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$LobbyCopyWithImpl<$Res> implements $LobbyCopyWith<$Res> {
  _$LobbyCopyWithImpl(this._value, this._then);

  final Lobby _value;
  // ignore: unused_field
  final $Res Function(Lobby) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? players = freezed,
    Object? config = freezed,
    Object? gameStatus = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as ISet<Player>,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      gameStatus: gameStatus == freezed
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }

  @override
  $GameConfigCopyWith<$Res> get config {
    return $GameConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc
abstract class _$LobbyCopyWith<$Res> implements $LobbyCopyWith<$Res> {
  factory _$LobbyCopyWith(_Lobby value, $Res Function(_Lobby) then) =
      __$LobbyCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      ISet<Player> players,
      GameConfig config,
      GameStatus gameStatus});

  @override
  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$LobbyCopyWithImpl<$Res> extends _$LobbyCopyWithImpl<$Res>
    implements _$LobbyCopyWith<$Res> {
  __$LobbyCopyWithImpl(_Lobby _value, $Res Function(_Lobby) _then)
      : super(_value, (v) => _then(v as _Lobby));

  @override
  _Lobby get _value => super._value as _Lobby;

  @override
  $Res call({
    Object? code = freezed,
    Object? players = freezed,
    Object? config = freezed,
    Object? gameStatus = freezed,
  }) {
    return _then(_Lobby(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as ISet<Player>,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      gameStatus: gameStatus == freezed
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lobby implements _Lobby {
  const _$_Lobby(
      {required this.code,
      required this.players,
      required this.config,
      required this.gameStatus});

  factory _$_Lobby.fromJson(Map<String, dynamic> json) =>
      _$$_LobbyFromJson(json);

  @override
  final String code;
  @override
  final ISet<Player> players;
  @override
  final GameConfig config;
  @override
  final GameStatus gameStatus;

  @override
  String toString() {
    return 'Lobby(code: $code, players: $players, config: $config, gameStatus: $gameStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Lobby &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.config, config) &&
            const DeepCollectionEquality()
                .equals(other.gameStatus, gameStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(config),
      const DeepCollectionEquality().hash(gameStatus));

  @JsonKey(ignore: true)
  @override
  _$LobbyCopyWith<_Lobby> get copyWith =>
      __$LobbyCopyWithImpl<_Lobby>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LobbyToJson(this);
  }
}

abstract class _Lobby implements Lobby {
  const factory _Lobby(
      {required String code,
      required ISet<Player> players,
      required GameConfig config,
      required GameStatus gameStatus}) = _$_Lobby;

  factory _Lobby.fromJson(Map<String, dynamic> json) = _$_Lobby.fromJson;

  @override
  String get code;
  @override
  ISet<Player> get players;
  @override
  GameConfig get config;
  @override
  GameStatus get gameStatus;
  @override
  @JsonKey(ignore: true)
  _$LobbyCopyWith<_Lobby> get copyWith => throw _privateConstructorUsedError;
}
