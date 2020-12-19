// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'reversi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ReversiGame _$ReversiGameFromJson(Map<String, dynamic> json) {
  return _ReversiGame.fromJson(json);
}

/// @nodoc
class _$ReversiGameTearOff {
  const _$ReversiGameTearOff();

// ignore: unused_element
  _ReversiGame call(
      {KtList<Player> players,
      DateTime time,
      KtList<GameMessage> messages,
      GameStatus gameStatus,
      int currentPlayerIndex,
      int round,
      List<PlayerID> board}) {
    return _ReversiGame(
      players: players,
      time: time,
      messages: messages,
      gameStatus: gameStatus,
      currentPlayerIndex: currentPlayerIndex,
      round: round,
      board: board,
    );
  }

// ignore: unused_element
  ReversiGame fromJson(Map<String, Object> json) {
    return ReversiGame.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ReversiGame = _$ReversiGameTearOff();

/// @nodoc
mixin _$ReversiGame {
  KtList<Player> get players;
  DateTime get time;
  KtList<GameMessage> get messages;
  GameStatus get gameStatus;
  int get currentPlayerIndex;
  int get round;
  List<PlayerID> get board;

  Map<String, dynamic> toJson();
  $ReversiGameCopyWith<ReversiGame> get copyWith;
}

/// @nodoc
abstract class $ReversiGameCopyWith<$Res> {
  factory $ReversiGameCopyWith(
          ReversiGame value, $Res Function(ReversiGame) then) =
      _$ReversiGameCopyWithImpl<$Res>;
  $Res call(
      {KtList<Player> players,
      DateTime time,
      KtList<GameMessage> messages,
      GameStatus gameStatus,
      int currentPlayerIndex,
      int round,
      List<PlayerID> board});
}

/// @nodoc
class _$ReversiGameCopyWithImpl<$Res> implements $ReversiGameCopyWith<$Res> {
  _$ReversiGameCopyWithImpl(this._value, this._then);

  final ReversiGame _value;
  // ignore: unused_field
  final $Res Function(ReversiGame) _then;

  @override
  $Res call({
    Object players = freezed,
    Object time = freezed,
    Object messages = freezed,
    Object gameStatus = freezed,
    Object currentPlayerIndex = freezed,
    Object round = freezed,
    Object board = freezed,
  }) {
    return _then(_value.copyWith(
      players: players == freezed ? _value.players : players as KtList<Player>,
      time: time == freezed ? _value.time : time as DateTime,
      messages: messages == freezed
          ? _value.messages
          : messages as KtList<GameMessage>,
      gameStatus:
          gameStatus == freezed ? _value.gameStatus : gameStatus as GameStatus,
      currentPlayerIndex: currentPlayerIndex == freezed
          ? _value.currentPlayerIndex
          : currentPlayerIndex as int,
      round: round == freezed ? _value.round : round as int,
      board: board == freezed ? _value.board : board as List<PlayerID>,
    ));
  }
}

/// @nodoc
abstract class _$ReversiGameCopyWith<$Res>
    implements $ReversiGameCopyWith<$Res> {
  factory _$ReversiGameCopyWith(
          _ReversiGame value, $Res Function(_ReversiGame) then) =
      __$ReversiGameCopyWithImpl<$Res>;
  @override
  $Res call(
      {KtList<Player> players,
      DateTime time,
      KtList<GameMessage> messages,
      GameStatus gameStatus,
      int currentPlayerIndex,
      int round,
      List<PlayerID> board});
}

/// @nodoc
class __$ReversiGameCopyWithImpl<$Res> extends _$ReversiGameCopyWithImpl<$Res>
    implements _$ReversiGameCopyWith<$Res> {
  __$ReversiGameCopyWithImpl(
      _ReversiGame _value, $Res Function(_ReversiGame) _then)
      : super(_value, (v) => _then(v as _ReversiGame));

  @override
  _ReversiGame get _value => super._value as _ReversiGame;

  @override
  $Res call({
    Object players = freezed,
    Object time = freezed,
    Object messages = freezed,
    Object gameStatus = freezed,
    Object currentPlayerIndex = freezed,
    Object round = freezed,
    Object board = freezed,
  }) {
    return _then(_ReversiGame(
      players: players == freezed ? _value.players : players as KtList<Player>,
      time: time == freezed ? _value.time : time as DateTime,
      messages: messages == freezed
          ? _value.messages
          : messages as KtList<GameMessage>,
      gameStatus:
          gameStatus == freezed ? _value.gameStatus : gameStatus as GameStatus,
      currentPlayerIndex: currentPlayerIndex == freezed
          ? _value.currentPlayerIndex
          : currentPlayerIndex as int,
      round: round == freezed ? _value.round : round as int,
      board: board == freezed ? _value.board : board as List<PlayerID>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ReversiGame extends _ReversiGame {
  const _$_ReversiGame(
      {this.players,
      this.time,
      this.messages,
      this.gameStatus,
      this.currentPlayerIndex,
      this.round,
      this.board})
      : super._();

  factory _$_ReversiGame.fromJson(Map<String, dynamic> json) =>
      _$_$_ReversiGameFromJson(json);

  @override
  final KtList<Player> players;
  @override
  final DateTime time;
  @override
  final KtList<GameMessage> messages;
  @override
  final GameStatus gameStatus;
  @override
  final int currentPlayerIndex;
  @override
  final int round;
  @override
  final List<PlayerID> board;

  @override
  String toString() {
    return 'ReversiGame(players: $players, time: $time, messages: $messages, gameStatus: $gameStatus, currentPlayerIndex: $currentPlayerIndex, round: $round, board: $board)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReversiGame &&
            (identical(other.players, players) ||
                const DeepCollectionEquality()
                    .equals(other.players, players)) &&
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
            (identical(other.board, board) ||
                const DeepCollectionEquality().equals(other.board, board)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(players) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(messages) ^
      const DeepCollectionEquality().hash(gameStatus) ^
      const DeepCollectionEquality().hash(currentPlayerIndex) ^
      const DeepCollectionEquality().hash(round) ^
      const DeepCollectionEquality().hash(board);

  @override
  _$ReversiGameCopyWith<_ReversiGame> get copyWith =>
      __$ReversiGameCopyWithImpl<_ReversiGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReversiGameToJson(this);
  }
}

abstract class _ReversiGame extends ReversiGame {
  const _ReversiGame._() : super._();
  const factory _ReversiGame(
      {KtList<Player> players,
      DateTime time,
      KtList<GameMessage> messages,
      GameStatus gameStatus,
      int currentPlayerIndex,
      int round,
      List<PlayerID> board}) = _$_ReversiGame;

  factory _ReversiGame.fromJson(Map<String, dynamic> json) =
      _$_ReversiGame.fromJson;

  @override
  KtList<Player> get players;
  @override
  DateTime get time;
  @override
  KtList<GameMessage> get messages;
  @override
  GameStatus get gameStatus;
  @override
  int get currentPlayerIndex;
  @override
  int get round;
  @override
  List<PlayerID> get board;
  @override
  _$ReversiGameCopyWith<_ReversiGame> get copyWith;
}

ReversiGameEvent _$ReversiGameEventFromJson(Map<String, dynamic> json) {
  return _ReversiGameEvent.fromJson(json);
}

/// @nodoc
class _$ReversiGameEventTearOff {
  const _$ReversiGameEventTearOff();

// ignore: unused_element
  _ReversiGameEvent call(PlayerID id, int location) {
    return _ReversiGameEvent(
      id,
      location,
    );
  }

// ignore: unused_element
  ReversiGameEvent fromJson(Map<String, Object> json) {
    return ReversiGameEvent.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ReversiGameEvent = _$ReversiGameEventTearOff();

/// @nodoc
mixin _$ReversiGameEvent {
  PlayerID get id;
  int get location;

  Map<String, dynamic> toJson();
  $ReversiGameEventCopyWith<ReversiGameEvent> get copyWith;
}

/// @nodoc
abstract class $ReversiGameEventCopyWith<$Res> {
  factory $ReversiGameEventCopyWith(
          ReversiGameEvent value, $Res Function(ReversiGameEvent) then) =
      _$ReversiGameEventCopyWithImpl<$Res>;
  $Res call({PlayerID id, int location});

  $PlayerIDCopyWith<$Res> get id;
}

/// @nodoc
class _$ReversiGameEventCopyWithImpl<$Res>
    implements $ReversiGameEventCopyWith<$Res> {
  _$ReversiGameEventCopyWithImpl(this._value, this._then);

  final ReversiGameEvent _value;
  // ignore: unused_field
  final $Res Function(ReversiGameEvent) _then;

  @override
  $Res call({
    Object id = freezed,
    Object location = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as PlayerID,
      location: location == freezed ? _value.location : location as int,
    ));
  }

  @override
  $PlayerIDCopyWith<$Res> get id {
    if (_value.id == null) {
      return null;
    }
    return $PlayerIDCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$ReversiGameEventCopyWith<$Res>
    implements $ReversiGameEventCopyWith<$Res> {
  factory _$ReversiGameEventCopyWith(
          _ReversiGameEvent value, $Res Function(_ReversiGameEvent) then) =
      __$ReversiGameEventCopyWithImpl<$Res>;
  @override
  $Res call({PlayerID id, int location});

  @override
  $PlayerIDCopyWith<$Res> get id;
}

/// @nodoc
class __$ReversiGameEventCopyWithImpl<$Res>
    extends _$ReversiGameEventCopyWithImpl<$Res>
    implements _$ReversiGameEventCopyWith<$Res> {
  __$ReversiGameEventCopyWithImpl(
      _ReversiGameEvent _value, $Res Function(_ReversiGameEvent) _then)
      : super(_value, (v) => _then(v as _ReversiGameEvent));

  @override
  _ReversiGameEvent get _value => super._value as _ReversiGameEvent;

  @override
  $Res call({
    Object id = freezed,
    Object location = freezed,
  }) {
    return _then(_ReversiGameEvent(
      id == freezed ? _value.id : id as PlayerID,
      location == freezed ? _value.location : location as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ReversiGameEvent implements _ReversiGameEvent {
  const _$_ReversiGameEvent(this.id, this.location)
      : assert(id != null),
        assert(location != null);

  factory _$_ReversiGameEvent.fromJson(Map<String, dynamic> json) =>
      _$_$_ReversiGameEventFromJson(json);

  @override
  final PlayerID id;
  @override
  final int location;

  @override
  String toString() {
    return 'ReversiGameEvent(id: $id, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReversiGameEvent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(location);

  @override
  _$ReversiGameEventCopyWith<_ReversiGameEvent> get copyWith =>
      __$ReversiGameEventCopyWithImpl<_ReversiGameEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReversiGameEventToJson(this);
  }
}

abstract class _ReversiGameEvent implements ReversiGameEvent {
  const factory _ReversiGameEvent(PlayerID id, int location) =
      _$_ReversiGameEvent;

  factory _ReversiGameEvent.fromJson(Map<String, dynamic> json) =
      _$_ReversiGameEvent.fromJson;

  @override
  PlayerID get id;
  @override
  int get location;
  @override
  _$ReversiGameEventCopyWith<_ReversiGameEvent> get copyWith;
}
