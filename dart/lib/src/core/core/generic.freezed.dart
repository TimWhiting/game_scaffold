// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'generic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericGame _$GenericGameFromJson(Map<String, dynamic> json) {
  return _GenericGame.fromJson(json);
}

/// @nodoc
mixin _$GenericGame {
  IList<Player> get players => throw _privateConstructorUsedError;
  IList<String> get readyPlayers => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericGameCopyWith<GenericGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericGameCopyWith<$Res> {
  factory $GenericGameCopyWith(
          GenericGame value, $Res Function(GenericGame) then) =
      _$GenericGameCopyWithImpl<$Res>;
  $Res call(
      {IList<Player> players,
      IList<String> readyPlayers,
      DateTime time,
      GameStatus status,
      int round});
}

/// @nodoc
class _$GenericGameCopyWithImpl<$Res> implements $GenericGameCopyWith<$Res> {
  _$GenericGameCopyWithImpl(this._value, this._then);

  final GenericGame _value;
  // ignore: unused_field
  final $Res Function(GenericGame) _then;

  @override
  $Res call({
    Object? players = freezed,
    Object? readyPlayers = freezed,
    Object? time = freezed,
    Object? status = freezed,
    Object? round = freezed,
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
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      round: round == freezed
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_GenericGameCopyWith<$Res>
    implements $GenericGameCopyWith<$Res> {
  factory _$$_GenericGameCopyWith(
          _$_GenericGame value, $Res Function(_$_GenericGame) then) =
      __$$_GenericGameCopyWithImpl<$Res>;
  @override
  $Res call(
      {IList<Player> players,
      IList<String> readyPlayers,
      DateTime time,
      GameStatus status,
      int round});
}

/// @nodoc
class __$$_GenericGameCopyWithImpl<$Res> extends _$GenericGameCopyWithImpl<$Res>
    implements _$$_GenericGameCopyWith<$Res> {
  __$$_GenericGameCopyWithImpl(
      _$_GenericGame _value, $Res Function(_$_GenericGame) _then)
      : super(_value, (v) => _then(v as _$_GenericGame));

  @override
  _$_GenericGame get _value => super._value as _$_GenericGame;

  @override
  $Res call({
    Object? players = freezed,
    Object? readyPlayers = freezed,
    Object? time = freezed,
    Object? status = freezed,
    Object? round = freezed,
  }) {
    return _then(_$_GenericGame(
      players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<Player>,
      readyPlayers == freezed
          ? _value.readyPlayers
          : readyPlayers // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      round == freezed
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericGame extends _GenericGame {
  const _$_GenericGame(
      this.players, this.readyPlayers, this.time, this.status, this.round)
      : super._();

  factory _$_GenericGame.fromJson(Map<String, dynamic> json) =>
      _$$_GenericGameFromJson(json);

  @override
  final IList<Player> players;
  @override
  final IList<String> readyPlayers;
  @override
  final DateTime time;
  @override
  final GameStatus status;
  @override
  final int round;

  @override
  String toString() {
    return 'GenericGame(players: $players, readyPlayers: $readyPlayers, time: $time, status: $status, round: $round)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericGame &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality()
                .equals(other.readyPlayers, readyPlayers) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.round, round));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(readyPlayers),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(round));

  @JsonKey(ignore: true)
  @override
  _$$_GenericGameCopyWith<_$_GenericGame> get copyWith =>
      __$$_GenericGameCopyWithImpl<_$_GenericGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenericGameToJson(
      this,
    );
  }
}

abstract class _GenericGame extends GenericGame {
  const factory _GenericGame(
      final IList<Player> players,
      final IList<String> readyPlayers,
      final DateTime time,
      final GameStatus status,
      final int round) = _$_GenericGame;
  const _GenericGame._() : super._();

  factory _GenericGame.fromJson(Map<String, dynamic> json) =
      _$_GenericGame.fromJson;

  @override
  IList<Player> get players;
  @override
  IList<String> get readyPlayers;
  @override
  DateTime get time;
  @override
  GameStatus get status;
  @override
  int get round;
  @override
  @JsonKey(ignore: true)
  _$$_GenericGameCopyWith<_$_GenericGame> get copyWith =>
      throw _privateConstructorUsedError;
}

GenericEvent _$GenericEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'undo':
      return GenericEventUndo.fromJson(json);
    case 'readyNextRound':
      return _GenericReadyNextRoundEvent.fromJson(json);
    case 'message':
      return GameMessage.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GenericEvent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$GenericEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() undo,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericEventUndo value) undo,
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
    required TResult Function(GameMessage value) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GenericEventUndo value)? undo,
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    TResult Function(GameMessage value)? message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericEventUndo value)? undo,
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    TResult Function(GameMessage value)? message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericEventCopyWith<$Res> {
  factory $GenericEventCopyWith(
          GenericEvent value, $Res Function(GenericEvent) then) =
      _$GenericEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GenericEventCopyWithImpl<$Res> implements $GenericEventCopyWith<$Res> {
  _$GenericEventCopyWithImpl(this._value, this._then);

  final GenericEvent _value;
  // ignore: unused_field
  final $Res Function(GenericEvent) _then;
}

/// @nodoc
abstract class _$$GenericEventUndoCopyWith<$Res> {
  factory _$$GenericEventUndoCopyWith(
          _$GenericEventUndo value, $Res Function(_$GenericEventUndo) then) =
      __$$GenericEventUndoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GenericEventUndoCopyWithImpl<$Res>
    extends _$GenericEventCopyWithImpl<$Res>
    implements _$$GenericEventUndoCopyWith<$Res> {
  __$$GenericEventUndoCopyWithImpl(
      _$GenericEventUndo _value, $Res Function(_$GenericEventUndo) _then)
      : super(_value, (v) => _then(v as _$GenericEventUndo));

  @override
  _$GenericEventUndo get _value => super._value as _$GenericEventUndo;
}

/// @nodoc
@JsonSerializable()
class _$GenericEventUndo extends GenericEventUndo {
  const _$GenericEventUndo({final String? $type})
      : $type = $type ?? 'undo',
        super._();

  factory _$GenericEventUndo.fromJson(Map<String, dynamic> json) =>
      _$$GenericEventUndoFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenericEvent.undo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GenericEventUndo);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() undo,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return undo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
  }) {
    return undo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(GenericEventUndo value) undo,
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
    required TResult Function(GameMessage value) message,
  }) {
    return undo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GenericEventUndo value)? undo,
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    TResult Function(GameMessage value)? message,
  }) {
    return undo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericEventUndo value)? undo,
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    TResult Function(GameMessage value)? message,
    required TResult orElse(),
  }) {
    if (undo != null) {
      return undo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericEventUndoToJson(
      this,
    );
  }
}

abstract class GenericEventUndo extends GenericEvent {
  const factory GenericEventUndo() = _$GenericEventUndo;
  const GenericEventUndo._() : super._();

  factory GenericEventUndo.fromJson(Map<String, dynamic> json) =
      _$GenericEventUndo.fromJson;
}

/// @nodoc
abstract class _$$_GenericReadyNextRoundEventCopyWith<$Res> {
  factory _$$_GenericReadyNextRoundEventCopyWith(
          _$_GenericReadyNextRoundEvent value,
          $Res Function(_$_GenericReadyNextRoundEvent) then) =
      __$$_GenericReadyNextRoundEventCopyWithImpl<$Res>;
  $Res call({String player});
}

/// @nodoc
class __$$_GenericReadyNextRoundEventCopyWithImpl<$Res>
    extends _$GenericEventCopyWithImpl<$Res>
    implements _$$_GenericReadyNextRoundEventCopyWith<$Res> {
  __$$_GenericReadyNextRoundEventCopyWithImpl(
      _$_GenericReadyNextRoundEvent _value,
      $Res Function(_$_GenericReadyNextRoundEvent) _then)
      : super(_value, (v) => _then(v as _$_GenericReadyNextRoundEvent));

  @override
  _$_GenericReadyNextRoundEvent get _value =>
      super._value as _$_GenericReadyNextRoundEvent;

  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(_$_GenericReadyNextRoundEvent(
      player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericReadyNextRoundEvent extends _GenericReadyNextRoundEvent {
  const _$_GenericReadyNextRoundEvent(this.player, {final String? $type})
      : $type = $type ?? 'readyNextRound',
        super._();

  factory _$_GenericReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =>
      _$$_GenericReadyNextRoundEventFromJson(json);

  @override
  final String player;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenericEvent.readyNextRound(player: $player)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericReadyNextRoundEvent &&
            const DeepCollectionEquality().equals(other.player, player));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(player));

  @JsonKey(ignore: true)
  @override
  _$$_GenericReadyNextRoundEventCopyWith<_$_GenericReadyNextRoundEvent>
      get copyWith => __$$_GenericReadyNextRoundEventCopyWithImpl<
          _$_GenericReadyNextRoundEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() undo,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return readyNextRound(player);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
  }) {
    return readyNextRound?.call(player);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(GenericEventUndo value) undo,
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
    required TResult Function(GameMessage value) message,
  }) {
    return readyNextRound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GenericEventUndo value)? undo,
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    TResult Function(GameMessage value)? message,
  }) {
    return readyNextRound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericEventUndo value)? undo,
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    TResult Function(GameMessage value)? message,
    required TResult orElse(),
  }) {
    if (readyNextRound != null) {
      return readyNextRound(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenericReadyNextRoundEventToJson(
      this,
    );
  }
}

abstract class _GenericReadyNextRoundEvent extends GenericEvent {
  const factory _GenericReadyNextRoundEvent(final String player) =
      _$_GenericReadyNextRoundEvent;
  const _GenericReadyNextRoundEvent._() : super._();

  factory _GenericReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =
      _$_GenericReadyNextRoundEvent.fromJson;

  String get player;
  @JsonKey(ignore: true)
  _$$_GenericReadyNextRoundEventCopyWith<_$_GenericReadyNextRoundEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameMessageCopyWith<$Res> {
  factory _$$GameMessageCopyWith(
          _$GameMessage value, $Res Function(_$GameMessage) then) =
      __$$GameMessageCopyWithImpl<$Res>;
  $Res call({String message, String from, String? to});
}

/// @nodoc
class __$$GameMessageCopyWithImpl<$Res> extends _$GenericEventCopyWithImpl<$Res>
    implements _$$GameMessageCopyWith<$Res> {
  __$$GameMessageCopyWithImpl(
      _$GameMessage _value, $Res Function(_$GameMessage) _then)
      : super(_value, (v) => _then(v as _$GameMessage));

  @override
  _$GameMessage get _value => super._value as _$GameMessage;

  @override
  $Res call({
    Object? message = freezed,
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$GameMessage(
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
class _$GameMessage extends GameMessage {
  const _$GameMessage(this.message,
      {required this.from, required this.to, final String? $type})
      : $type = $type ?? 'message',
        super._();

  factory _$GameMessage.fromJson(Map<String, dynamic> json) =>
      _$$GameMessageFromJson(json);

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
    return 'GenericEvent.message(message: $message, from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameMessage &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to));

  @JsonKey(ignore: true)
  @override
  _$$GameMessageCopyWith<_$GameMessage> get copyWith =>
      __$$GameMessageCopyWithImpl<_$GameMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() undo,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return message(this.message, from, to);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? undo,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
  }) {
    return message?.call(this.message, from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(GenericEventUndo value) undo,
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
    required TResult Function(GameMessage value) message,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GenericEventUndo value)? undo,
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    TResult Function(GameMessage value)? message,
  }) {
    return message?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericEventUndo value)? undo,
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    TResult Function(GameMessage value)? message,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GameMessageToJson(
      this,
    );
  }
}

abstract class GameMessage extends GenericEvent {
  const factory GameMessage(final String message,
      {required final String from, required final String? to}) = _$GameMessage;
  const GameMessage._() : super._();

  factory GameMessage.fromJson(Map<String, dynamic> json) =
      _$GameMessage.fromJson;

  String get message;
  String get from;
  String? get to;
  @JsonKey(ignore: true)
  _$$GameMessageCopyWith<_$GameMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

GameConfig<T> _$GameConfigFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _GameConfig<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$GameConfig<T> {
  String get gameType => throw _privateConstructorUsedError;
  String? get adminID => throw _privateConstructorUsedError;
  NameSet get nameSet => throw _privateConstructorUsedError;
  bool get customNames => throw _privateConstructorUsedError;
  int get rounds => throw _privateConstructorUsedError;
  int get minPlayers => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  bool get autoStart => throw _privateConstructorUsedError;
  T? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameConfigCopyWith<T, GameConfig<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameConfigCopyWith<T, $Res> {
  factory $GameConfigCopyWith(
          GameConfig<T> value, $Res Function(GameConfig<T>) then) =
      _$GameConfigCopyWithImpl<T, $Res>;
  $Res call(
      {String gameType,
      String? adminID,
      NameSet nameSet,
      bool customNames,
      int rounds,
      int minPlayers,
      int maxPlayers,
      bool autoStart,
      T? options});
}

/// @nodoc
class _$GameConfigCopyWithImpl<T, $Res>
    implements $GameConfigCopyWith<T, $Res> {
  _$GameConfigCopyWithImpl(this._value, this._then);

  final GameConfig<T> _value;
  // ignore: unused_field
  final $Res Function(GameConfig<T>) _then;

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
              as T?,
    ));
  }
}

/// @nodoc
abstract class _$$_GameConfigCopyWith<T, $Res>
    implements $GameConfigCopyWith<T, $Res> {
  factory _$$_GameConfigCopyWith(
          _$_GameConfig<T> value, $Res Function(_$_GameConfig<T>) then) =
      __$$_GameConfigCopyWithImpl<T, $Res>;
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
      T? options});
}

/// @nodoc
class __$$_GameConfigCopyWithImpl<T, $Res>
    extends _$GameConfigCopyWithImpl<T, $Res>
    implements _$$_GameConfigCopyWith<T, $Res> {
  __$$_GameConfigCopyWithImpl(
      _$_GameConfig<T> _value, $Res Function(_$_GameConfig<T>) _then)
      : super(_value, (v) => _then(v as _$_GameConfig<T>));

  @override
  _$_GameConfig<T> get _value => super._value as _$_GameConfig<T>;

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
    return _then(_$_GameConfig<T>(
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
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_GameConfig<T> extends _GameConfig<T> {
  const _$_GameConfig(
      {required this.gameType,
      this.adminID,
      this.nameSet = NameSet.Basic,
      this.customNames = false,
      this.rounds = 15,
      this.minPlayers = 1,
      this.maxPlayers = 10,
      this.autoStart = true,
      this.options})
      : super._();

  factory _$_GameConfig.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_GameConfigFromJson(json, fromJsonT);

  @override
  final String gameType;
  @override
  final String? adminID;
  @override
  @JsonKey()
  final NameSet nameSet;
  @override
  @JsonKey()
  final bool customNames;
  @override
  @JsonKey()
  final int rounds;
  @override
  @JsonKey()
  final int minPlayers;
  @override
  @JsonKey()
  final int maxPlayers;
  @override
  @JsonKey()
  final bool autoStart;
  @override
  final T? options;

  @override
  String toString() {
    return 'GameConfig<$T>(gameType: $gameType, adminID: $adminID, nameSet: $nameSet, customNames: $customNames, rounds: $rounds, minPlayers: $minPlayers, maxPlayers: $maxPlayers, autoStart: $autoStart, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameConfig<T> &&
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

  @JsonKey(ignore: true)
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
  _$$_GameConfigCopyWith<T, _$_GameConfig<T>> get copyWith =>
      __$$_GameConfigCopyWithImpl<T, _$_GameConfig<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_GameConfigToJson<T>(this, toJsonT);
  }
}

abstract class _GameConfig<T> extends GameConfig<T> {
  const factory _GameConfig(
      {required final String gameType,
      final String? adminID,
      final NameSet nameSet,
      final bool customNames,
      final int rounds,
      final int minPlayers,
      final int maxPlayers,
      final bool autoStart,
      final T? options}) = _$_GameConfig<T>;
  const _GameConfig._() : super._();

  factory _GameConfig.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_GameConfig<T>.fromJson;

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
  T? get options;
  @override
  @JsonKey(ignore: true)
  _$$_GameConfigCopyWith<T, _$_GameConfig<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

GameInfo _$GameInfoFromJson(Map<String, dynamic> json) {
  return _GameInfo.fromJson(json);
}

/// @nodoc
mixin _$GameInfo {
  String get gameID => throw _privateConstructorUsedError;
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
      {String gameID,
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
    Object? gameID = freezed,
    Object? players = freezed,
    Object? player = freezed,
    Object? creator = freezed,
    Object? gameType = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      gameID: gameID == freezed
          ? _value.gameID
          : gameID // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_GameInfoCopyWith<$Res> implements $GameInfoCopyWith<$Res> {
  factory _$$_GameInfoCopyWith(
          _$_GameInfo value, $Res Function(_$_GameInfo) then) =
      __$$_GameInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String gameID,
      IList<String> players,
      String player,
      bool creator,
      String gameType,
      GameStatus status});
}

/// @nodoc
class __$$_GameInfoCopyWithImpl<$Res> extends _$GameInfoCopyWithImpl<$Res>
    implements _$$_GameInfoCopyWith<$Res> {
  __$$_GameInfoCopyWithImpl(
      _$_GameInfo _value, $Res Function(_$_GameInfo) _then)
      : super(_value, (v) => _then(v as _$_GameInfo));

  @override
  _$_GameInfo get _value => super._value as _$_GameInfo;

  @override
  $Res call({
    Object? gameID = freezed,
    Object? players = freezed,
    Object? player = freezed,
    Object? creator = freezed,
    Object? gameType = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_GameInfo(
      gameID: gameID == freezed
          ? _value.gameID
          : gameID // ignore: cast_nullable_to_non_nullable
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
      {required this.gameID,
      required this.players,
      required this.player,
      required this.creator,
      required this.gameType,
      required this.status});

  factory _$_GameInfo.fromJson(Map<String, dynamic> json) =>
      _$$_GameInfoFromJson(json);

  @override
  final String gameID;
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
    return 'GameInfo(gameID: $gameID, players: $players, player: $player, creator: $creator, gameType: $gameType, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameInfo &&
            const DeepCollectionEquality().equals(other.gameID, gameID) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            const DeepCollectionEquality().equals(other.gameType, gameType) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gameID),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(gameType),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_GameInfoCopyWith<_$_GameInfo> get copyWith =>
      __$$_GameInfoCopyWithImpl<_$_GameInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameInfoToJson(
      this,
    );
  }
}

abstract class _GameInfo implements GameInfo {
  const factory _GameInfo(
      {required final String gameID,
      required final IList<String> players,
      required final String player,
      required final bool creator,
      required final String gameType,
      required final GameStatus status}) = _$_GameInfo;

  factory _GameInfo.fromJson(Map<String, dynamic> json) = _$_GameInfo.fromJson;

  @override
  String get gameID;
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
  _$$_GameInfoCopyWith<_$_GameInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Lobby _$LobbyFromJson(Map<String, dynamic> json) {
  return _Lobby.fromJson(json);
}

/// @nodoc
mixin _$Lobby {
  String get code => throw _privateConstructorUsedError;
  ISet<Player> get players => throw _privateConstructorUsedError;
  GameConfig<dynamic> get config => throw _privateConstructorUsedError;
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
      GameConfig<dynamic> config,
      GameStatus gameStatus});

  $GameConfigCopyWith<dynamic, $Res> get config;
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
              as GameConfig<dynamic>,
      gameStatus: gameStatus == freezed
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }

  @override
  $GameConfigCopyWith<dynamic, $Res> get config {
    return $GameConfigCopyWith<dynamic, $Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc
abstract class _$$_LobbyCopyWith<$Res> implements $LobbyCopyWith<$Res> {
  factory _$$_LobbyCopyWith(_$_Lobby value, $Res Function(_$_Lobby) then) =
      __$$_LobbyCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      ISet<Player> players,
      GameConfig<dynamic> config,
      GameStatus gameStatus});

  @override
  $GameConfigCopyWith<dynamic, $Res> get config;
}

/// @nodoc
class __$$_LobbyCopyWithImpl<$Res> extends _$LobbyCopyWithImpl<$Res>
    implements _$$_LobbyCopyWith<$Res> {
  __$$_LobbyCopyWithImpl(_$_Lobby _value, $Res Function(_$_Lobby) _then)
      : super(_value, (v) => _then(v as _$_Lobby));

  @override
  _$_Lobby get _value => super._value as _$_Lobby;

  @override
  $Res call({
    Object? code = freezed,
    Object? players = freezed,
    Object? config = freezed,
    Object? gameStatus = freezed,
  }) {
    return _then(_$_Lobby(
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
              as GameConfig<dynamic>,
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
  final GameConfig<dynamic> config;
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
            other is _$_Lobby &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.config, config) &&
            const DeepCollectionEquality()
                .equals(other.gameStatus, gameStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(config),
      const DeepCollectionEquality().hash(gameStatus));

  @JsonKey(ignore: true)
  @override
  _$$_LobbyCopyWith<_$_Lobby> get copyWith =>
      __$$_LobbyCopyWithImpl<_$_Lobby>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LobbyToJson(
      this,
    );
  }
}

abstract class _Lobby implements Lobby {
  const factory _Lobby(
      {required final String code,
      required final ISet<Player> players,
      required final GameConfig<dynamic> config,
      required final GameStatus gameStatus}) = _$_Lobby;

  factory _Lobby.fromJson(Map<String, dynamic> json) = _$_Lobby.fromJson;

  @override
  String get code;
  @override
  ISet<Player> get players;
  @override
  GameConfig<dynamic> get config;
  @override
  GameStatus get gameStatus;
  @override
  @JsonKey(ignore: true)
  _$$_LobbyCopyWith<_$_Lobby> get copyWith =>
      throw _privateConstructorUsedError;
}
