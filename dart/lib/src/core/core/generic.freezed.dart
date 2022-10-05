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
  IList<IList<double>> get allRoundScores => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  IList<GameMessage> get messages => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  int? get currentPlayerIndex => throw _privateConstructorUsedError;
  int get round =>
      throw _privateConstructorUsedError; // ignore: avoid_positional_boolean_parameters
  bool get isMultiPly => throw _privateConstructorUsedError;
  bool get isSimultaneousAction => throw _privateConstructorUsedError;

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
      IList<IList<double>> allRoundScores,
      DateTime time,
      IList<GameMessage> messages,
      GameStatus status,
      int? currentPlayerIndex,
      int round,
      bool isMultiPly,
      bool isSimultaneousAction});
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
    Object? allRoundScores = freezed,
    Object? time = freezed,
    Object? messages = freezed,
    Object? status = freezed,
    Object? currentPlayerIndex = freezed,
    Object? round = freezed,
    Object? isMultiPly = freezed,
    Object? isSimultaneousAction = freezed,
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
              as IList<GameMessage>,
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
      IList<IList<double>> allRoundScores,
      DateTime time,
      IList<GameMessage> messages,
      GameStatus status,
      int? currentPlayerIndex,
      int round,
      bool isMultiPly,
      bool isSimultaneousAction});
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
    Object? allRoundScores = freezed,
    Object? time = freezed,
    Object? messages = freezed,
    Object? status = freezed,
    Object? currentPlayerIndex = freezed,
    Object? round = freezed,
    Object? isMultiPly = freezed,
    Object? isSimultaneousAction = freezed,
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
              as IList<GameMessage>,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericGame extends _GenericGame {
  const _$_GenericGame(
      this.players,
      this.readyPlayers,
      this.allRoundScores,
      this.time,
      this.messages,
      this.status,
      this.currentPlayerIndex,
      this.round,
      this.isMultiPly,
      this.isSimultaneousAction)
      : super._();

  factory _$_GenericGame.fromJson(Map<String, dynamic> json) =>
      _$$_GenericGameFromJson(json);

  @override
  final IList<Player> players;
  @override
  final IList<String> readyPlayers;
  @override
  final IList<IList<double>> allRoundScores;
  @override
  final DateTime time;
  @override
  final IList<GameMessage> messages;
  @override
  final GameStatus status;
  @override
  final int? currentPlayerIndex;
  @override
  final int round;
// ignore: avoid_positional_boolean_parameters
  @override
  final bool isMultiPly;
  @override
  final bool isSimultaneousAction;

  @override
  String toString() {
    return 'GenericGame(players: $players, readyPlayers: $readyPlayers, allRoundScores: $allRoundScores, time: $time, messages: $messages, status: $status, currentPlayerIndex: $currentPlayerIndex, round: $round, isMultiPly: $isMultiPly, isSimultaneousAction: $isSimultaneousAction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericGame &&
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
                .equals(other.isSimultaneousAction, isSimultaneousAction));
  }

  @JsonKey(ignore: true)
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
      const DeepCollectionEquality().hash(isSimultaneousAction));

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
      final IList<IList<double>> allRoundScores,
      final DateTime time,
      final IList<GameMessage> messages,
      final GameStatus status,
      final int? currentPlayerIndex,
      final int round,
      final bool isMultiPly,
      final bool isSimultaneousAction) = _$_GenericGame;
  const _GenericGame._() : super._();

  factory _GenericGame.fromJson(Map<String, dynamic> json) =
      _$_GenericGame.fromJson;

  @override
  IList<Player> get players;
  @override
  IList<String> get readyPlayers;
  @override
  IList<IList<double>> get allRoundScores;
  @override
  DateTime get time;
  @override
  IList<GameMessage> get messages;
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
