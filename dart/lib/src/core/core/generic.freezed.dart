// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'generic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericGame _$GenericGameFromJson(Map<String, dynamic> json) {
  return _GenericGame.fromJson(json);
}

/// @nodoc
class _$GenericGameTearOff {
  const _$GenericGameTearOff();

  _GenericGame call(
      IList<Player> players,
      IList<String> readyPlayers,
      IList<IList<double>> allRoundScores,
      DateTime time,
      IList<GameMessage> messages,
      GameStatus gameStatus,
      int? currentPlayerIndex,
      int round,
      bool isMultiPly,
      bool isSimultaneousAction) {
    return _GenericGame(
      players,
      readyPlayers,
      allRoundScores,
      time,
      messages,
      gameStatus,
      currentPlayerIndex,
      round,
      isMultiPly,
      isSimultaneousAction,
    );
  }

  GenericGame fromJson(Map<String, Object> json) {
    return GenericGame.fromJson(json);
  }
}

/// @nodoc
const $GenericGame = _$GenericGameTearOff();

/// @nodoc
mixin _$GenericGame {
  IList<Player> get players => throw _privateConstructorUsedError;
  IList<String> get readyPlayers => throw _privateConstructorUsedError;
  IList<IList<double>> get allRoundScores => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  IList<GameMessage> get messages => throw _privateConstructorUsedError;
  GameStatus get gameStatus => throw _privateConstructorUsedError;
  int? get currentPlayerIndex => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;
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
      GameStatus gameStatus,
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
    Object? gameStatus = freezed,
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
      gameStatus: gameStatus == freezed
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
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
abstract class _$GenericGameCopyWith<$Res>
    implements $GenericGameCopyWith<$Res> {
  factory _$GenericGameCopyWith(
          _GenericGame value, $Res Function(_GenericGame) then) =
      __$GenericGameCopyWithImpl<$Res>;
  @override
  $Res call(
      {IList<Player> players,
      IList<String> readyPlayers,
      IList<IList<double>> allRoundScores,
      DateTime time,
      IList<GameMessage> messages,
      GameStatus gameStatus,
      int? currentPlayerIndex,
      int round,
      bool isMultiPly,
      bool isSimultaneousAction});
}

/// @nodoc
class __$GenericGameCopyWithImpl<$Res> extends _$GenericGameCopyWithImpl<$Res>
    implements _$GenericGameCopyWith<$Res> {
  __$GenericGameCopyWithImpl(
      _GenericGame _value, $Res Function(_GenericGame) _then)
      : super(_value, (v) => _then(v as _GenericGame));

  @override
  _GenericGame get _value => super._value as _GenericGame;

  @override
  $Res call({
    Object? players = freezed,
    Object? readyPlayers = freezed,
    Object? allRoundScores = freezed,
    Object? time = freezed,
    Object? messages = freezed,
    Object? gameStatus = freezed,
    Object? currentPlayerIndex = freezed,
    Object? round = freezed,
    Object? isMultiPly = freezed,
    Object? isSimultaneousAction = freezed,
  }) {
    return _then(_GenericGame(
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
      gameStatus == freezed
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
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

@JsonSerializable()

/// @nodoc
class _$_GenericGame extends _GenericGame {
  const _$_GenericGame(
      this.players,
      this.readyPlayers,
      this.allRoundScores,
      this.time,
      this.messages,
      this.gameStatus,
      this.currentPlayerIndex,
      this.round,
      this.isMultiPly,
      this.isSimultaneousAction)
      : super._();

  factory _$_GenericGame.fromJson(Map<String, dynamic> json) =>
      _$_$_GenericGameFromJson(json);

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
  final GameStatus gameStatus;
  @override
  final int? currentPlayerIndex;
  @override
  final int round;
  @override
  final bool isMultiPly;
  @override
  final bool isSimultaneousAction;

  @override
  String toString() {
    return 'GenericGame(players: $players, readyPlayers: $readyPlayers, allRoundScores: $allRoundScores, time: $time, messages: $messages, gameStatus: $gameStatus, currentPlayerIndex: $currentPlayerIndex, round: $round, isMultiPly: $isMultiPly, isSimultaneousAction: $isSimultaneousAction)';
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        (other is _GenericGame &&
            (identical(other.players, players) ||
                const DeepCollectionEquality()
                    .equals(other.players, players)) &&
            (identical(other.readyPlayers, readyPlayers) ||
                const DeepCollectionEquality()
                    .equals(other.readyPlayers, readyPlayers)) &&
            (identical(other.allRoundScores, allRoundScores) ||
                const DeepCollectionEquality()
                    .equals(other.allRoundScores, allRoundScores)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)) &&
            (identical(other.gameStatus, gameStatus) ||
                const DeepCollectionEquality()
                    .equals(other.gameStatus, gameStatus)) &&
            (identical(other.currentPlayerIndex, currentPlayerIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentPlayerIndex, currentPlayerIndex)) &&
            (identical(other.round, round) ||
                const DeepCollectionEquality().equals(other.round, round)) &&
            (identical(other.isMultiPly, isMultiPly) ||
                const DeepCollectionEquality()
                    .equals(other.isMultiPly, isMultiPly)) &&
            (identical(other.isSimultaneousAction, isSimultaneousAction) ||
                const DeepCollectionEquality()
                    .equals(other.isSimultaneousAction, isSimultaneousAction)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(players) ^
      const DeepCollectionEquality().hash(readyPlayers) ^
      const DeepCollectionEquality().hash(allRoundScores) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(messages) ^
      const DeepCollectionEquality().hash(gameStatus) ^
      const DeepCollectionEquality().hash(currentPlayerIndex) ^
      const DeepCollectionEquality().hash(round) ^
      const DeepCollectionEquality().hash(isMultiPly) ^
      const DeepCollectionEquality().hash(isSimultaneousAction);

  @JsonKey(ignore: true)
  @override
  _$GenericGameCopyWith<_GenericGame> get copyWith =>
      __$GenericGameCopyWithImpl<_GenericGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GenericGameToJson(this);
  }
}

abstract class _GenericGame extends GenericGame {
  const factory _GenericGame(
      IList<Player> players,
      IList<String> readyPlayers,
      IList<IList<double>> allRoundScores,
      DateTime time,
      IList<GameMessage> messages,
      GameStatus gameStatus,
      int? currentPlayerIndex,
      int round,
      bool isMultiPly,
      bool isSimultaneousAction) = _$_GenericGame;
  const _GenericGame._() : super._();

  factory _GenericGame.fromJson(Map<String, dynamic> json) =
      _$_GenericGame.fromJson;

  @override
  IList<Player> get players => throw _privateConstructorUsedError;
  @override
  IList<String> get readyPlayers => throw _privateConstructorUsedError;
  @override
  IList<IList<double>> get allRoundScores => throw _privateConstructorUsedError;
  @override
  DateTime get time => throw _privateConstructorUsedError;
  @override
  IList<GameMessage> get messages => throw _privateConstructorUsedError;
  @override
  GameStatus get gameStatus => throw _privateConstructorUsedError;
  @override
  int? get currentPlayerIndex => throw _privateConstructorUsedError;
  @override
  int get round => throw _privateConstructorUsedError;
  @override
  bool get isMultiPly => throw _privateConstructorUsedError;
  @override
  bool get isSimultaneousAction => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GenericGameCopyWith<_GenericGame> get copyWith =>
      throw _privateConstructorUsedError;
}

GenericEvent _$GenericEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'undo':
      return _GenericEventUndo.fromJson(json);
    case 'start':
      return _GenericEventStart.fromJson(json);
    case 'readyNextRound':
      return _GenericReadyNextRoundEvent.fromJson(json);
    case 'message':
      return GameMessage.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$GenericEventTearOff {
  const _$GenericEventTearOff();

  _GenericEventUndo undo() {
    return const _GenericEventUndo();
  }

  _GenericEventStart start() {
    return const _GenericEventStart();
  }

  _GenericReadyNextRoundEvent readyNextRound(String player) {
    return _GenericReadyNextRoundEvent(
      player,
    );
  }

  GameMessage message(String message,
      {required String from, required String? to}) {
    return GameMessage(
      message,
      from: from,
      to: to,
    );
  }

  GenericEvent fromJson(Map<String, Object> json) {
    return GenericEvent.fromJson(json);
  }
}

/// @nodoc
const $GenericEvent = _$GenericEventTearOff();

/// @nodoc
mixin _$GenericEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() undo,
    required TResult Function() start,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? undo,
    TResult Function()? start,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenericEventUndo value) undo,
    required TResult Function(_GenericEventStart value) start,
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
    required TResult Function(GameMessage value) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericEventUndo value)? undo,
    TResult Function(_GenericEventStart value)? start,
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
abstract class _$GenericEventUndoCopyWith<$Res> {
  factory _$GenericEventUndoCopyWith(
          _GenericEventUndo value, $Res Function(_GenericEventUndo) then) =
      __$GenericEventUndoCopyWithImpl<$Res>;
}

/// @nodoc
class __$GenericEventUndoCopyWithImpl<$Res>
    extends _$GenericEventCopyWithImpl<$Res>
    implements _$GenericEventUndoCopyWith<$Res> {
  __$GenericEventUndoCopyWithImpl(
      _GenericEventUndo _value, $Res Function(_GenericEventUndo) _then)
      : super(_value, (v) => _then(v as _GenericEventUndo));

  @override
  _GenericEventUndo get _value => super._value as _GenericEventUndo;
}

@JsonSerializable()

/// @nodoc
class _$_GenericEventUndo extends _GenericEventUndo {
  const _$_GenericEventUndo() : super._();

  factory _$_GenericEventUndo.fromJson(Map<String, dynamic> json) =>
      _$_$_GenericEventUndoFromJson(json);

  @override
  String toString() {
    return 'GenericEvent.undo()';
  }

  @override
  bool operator ==(other) {
    return identical(this, other) || (other is _GenericEventUndo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() undo,
    required TResult Function() start,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return undo();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? undo,
    TResult Function()? start,
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
    required TResult Function(_GenericEventUndo value) undo,
    required TResult Function(_GenericEventStart value) start,
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
    required TResult Function(GameMessage value) message,
  }) {
    return undo(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericEventUndo value)? undo,
    TResult Function(_GenericEventStart value)? start,
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
    return _$_$_GenericEventUndoToJson(this)..['runtimeType'] = 'undo';
  }
}

abstract class _GenericEventUndo extends GenericEvent {
  const factory _GenericEventUndo() = _$_GenericEventUndo;
  const _GenericEventUndo._() : super._();

  factory _GenericEventUndo.fromJson(Map<String, dynamic> json) =
      _$_GenericEventUndo.fromJson;
}

/// @nodoc
abstract class _$GenericEventStartCopyWith<$Res> {
  factory _$GenericEventStartCopyWith(
          _GenericEventStart value, $Res Function(_GenericEventStart) then) =
      __$GenericEventStartCopyWithImpl<$Res>;
}

/// @nodoc
class __$GenericEventStartCopyWithImpl<$Res>
    extends _$GenericEventCopyWithImpl<$Res>
    implements _$GenericEventStartCopyWith<$Res> {
  __$GenericEventStartCopyWithImpl(
      _GenericEventStart _value, $Res Function(_GenericEventStart) _then)
      : super(_value, (v) => _then(v as _GenericEventStart));

  @override
  _GenericEventStart get _value => super._value as _GenericEventStart;
}

@JsonSerializable()

/// @nodoc
class _$_GenericEventStart extends _GenericEventStart {
  const _$_GenericEventStart() : super._();

  factory _$_GenericEventStart.fromJson(Map<String, dynamic> json) =>
      _$_$_GenericEventStartFromJson(json);

  @override
  String toString() {
    return 'GenericEvent.start()';
  }

  @override
  bool operator ==(other) {
    return identical(this, other) || (other is _GenericEventStart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() undo,
    required TResult Function() start,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? undo,
    TResult Function()? start,
    TResult Function(String player)? readyNextRound,
    TResult Function(String message, String from, String? to)? message,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenericEventUndo value) undo,
    required TResult Function(_GenericEventStart value) start,
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
    required TResult Function(GameMessage value) message,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericEventUndo value)? undo,
    TResult Function(_GenericEventStart value)? start,
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    TResult Function(GameMessage value)? message,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GenericEventStartToJson(this)..['runtimeType'] = 'start';
  }
}

abstract class _GenericEventStart extends GenericEvent {
  const factory _GenericEventStart() = _$_GenericEventStart;
  const _GenericEventStart._() : super._();

  factory _GenericEventStart.fromJson(Map<String, dynamic> json) =
      _$_GenericEventStart.fromJson;
}

/// @nodoc
abstract class _$GenericReadyNextRoundEventCopyWith<$Res> {
  factory _$GenericReadyNextRoundEventCopyWith(
          _GenericReadyNextRoundEvent value,
          $Res Function(_GenericReadyNextRoundEvent) then) =
      __$GenericReadyNextRoundEventCopyWithImpl<$Res>;
  $Res call({String player});
}

/// @nodoc
class __$GenericReadyNextRoundEventCopyWithImpl<$Res>
    extends _$GenericEventCopyWithImpl<$Res>
    implements _$GenericReadyNextRoundEventCopyWith<$Res> {
  __$GenericReadyNextRoundEventCopyWithImpl(_GenericReadyNextRoundEvent _value,
      $Res Function(_GenericReadyNextRoundEvent) _then)
      : super(_value, (v) => _then(v as _GenericReadyNextRoundEvent));

  @override
  _GenericReadyNextRoundEvent get _value =>
      super._value as _GenericReadyNextRoundEvent;

  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(_GenericReadyNextRoundEvent(
      player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GenericReadyNextRoundEvent extends _GenericReadyNextRoundEvent {
  const _$_GenericReadyNextRoundEvent(this.player) : super._();

  factory _$_GenericReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =>
      _$_$_GenericReadyNextRoundEventFromJson(json);

  @override
  final String player;

  @override
  String toString() {
    return 'GenericEvent.readyNextRound(player: $player)';
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        (other is _GenericReadyNextRoundEvent &&
            (identical(other.player, player) ||
                const DeepCollectionEquality().equals(other.player, player)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(player);

  @JsonKey(ignore: true)
  @override
  _$GenericReadyNextRoundEventCopyWith<_GenericReadyNextRoundEvent>
      get copyWith => __$GenericReadyNextRoundEventCopyWithImpl<
          _GenericReadyNextRoundEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() undo,
    required TResult Function() start,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return readyNextRound(player);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? undo,
    TResult Function()? start,
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
    required TResult Function(_GenericEventUndo value) undo,
    required TResult Function(_GenericEventStart value) start,
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
    required TResult Function(GameMessage value) message,
  }) {
    return readyNextRound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericEventUndo value)? undo,
    TResult Function(_GenericEventStart value)? start,
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
    return _$_$_GenericReadyNextRoundEventToJson(this)
      ..['runtimeType'] = 'readyNextRound';
  }
}

abstract class _GenericReadyNextRoundEvent extends GenericEvent {
  const factory _GenericReadyNextRoundEvent(String player) =
      _$_GenericReadyNextRoundEvent;
  const _GenericReadyNextRoundEvent._() : super._();

  factory _GenericReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =
      _$_GenericReadyNextRoundEvent.fromJson;

  String get player => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GenericReadyNextRoundEventCopyWith<_GenericReadyNextRoundEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameMessageCopyWith<$Res> {
  factory $GameMessageCopyWith(
          GameMessage value, $Res Function(GameMessage) then) =
      _$GameMessageCopyWithImpl<$Res>;
  $Res call({String message, String from, String? to});
}

/// @nodoc
class _$GameMessageCopyWithImpl<$Res> extends _$GenericEventCopyWithImpl<$Res>
    implements $GameMessageCopyWith<$Res> {
  _$GameMessageCopyWithImpl(
      GameMessage _value, $Res Function(GameMessage) _then)
      : super(_value, (v) => _then(v as GameMessage));

  @override
  GameMessage get _value => super._value as GameMessage;

  @override
  $Res call({
    Object? message = freezed,
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(GameMessage(
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

@JsonSerializable()

/// @nodoc
class _$GameMessage extends GameMessage {
  const _$GameMessage(this.message, {required this.from, required this.to})
      : super._();

  factory _$GameMessage.fromJson(Map<String, dynamic> json) =>
      _$_$GameMessageFromJson(json);

  @override
  final String message;
  @override
  final String from;
  @override
  final String? to;

  @override
  String toString() {
    return 'GenericEvent.message(message: $message, from: $from, to: $to)';
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        (other is GameMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to);

  @JsonKey(ignore: true)
  @override
  $GameMessageCopyWith<GameMessage> get copyWith =>
      _$GameMessageCopyWithImpl<GameMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() undo,
    required TResult Function() start,
    required TResult Function(String player) readyNextRound,
    required TResult Function(String message, String from, String? to) message,
  }) {
    return message(this.message, from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? undo,
    TResult Function()? start,
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
    required TResult Function(_GenericEventUndo value) undo,
    required TResult Function(_GenericEventStart value) start,
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
    required TResult Function(GameMessage value) message,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericEventUndo value)? undo,
    TResult Function(_GenericEventStart value)? start,
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
    return _$_$GameMessageToJson(this)..['runtimeType'] = 'message';
  }
}

abstract class GameMessage extends GenericEvent {
  const factory GameMessage(String message,
      {required String from, required String? to}) = _$GameMessage;
  const GameMessage._() : super._();

  factory GameMessage.fromJson(Map<String, dynamic> json) =
      _$GameMessage.fromJson;

  String get message => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameMessageCopyWith<GameMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
