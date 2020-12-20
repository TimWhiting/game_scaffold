// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
class _$PlayerTearOff {
  const _$PlayerTearOff();

// ignore: unused_element
  _Player call(PlayerID id, {String name = ''}) {
    return _Player(
      id,
      name: name,
    );
  }

// ignore: unused_element
  Player fromJson(Map<String, Object> json) {
    return Player.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Player = _$PlayerTearOff();

/// @nodoc
mixin _$Player {
  PlayerID get id;
  String get name;

  Map<String, dynamic> toJson();
  $PlayerCopyWith<Player> get copyWith;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res>;
  $Res call({PlayerID id, String name});

  $PlayerIDCopyWith<$Res> get id;
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  final Player _value;
  // ignore: unused_field
  final $Res Function(Player) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as PlayerID,
      name: name == freezed ? _value.name : name as String,
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
abstract class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) then) =
      __$PlayerCopyWithImpl<$Res>;
  @override
  $Res call({PlayerID id, String name});

  @override
  $PlayerIDCopyWith<$Res> get id;
}

/// @nodoc
class __$PlayerCopyWithImpl<$Res> extends _$PlayerCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(_Player _value, $Res Function(_Player) _then)
      : super(_value, (v) => _then(v as _Player));

  @override
  _Player get _value => super._value as _Player;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_Player(
      id == freezed ? _value.id : id as PlayerID,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Player implements _Player {
  const _$_Player(this.id, {this.name = ''})
      : assert(id != null),
        assert(name != null);

  factory _$_Player.fromJson(Map<String, dynamic> json) =>
      _$_$_PlayerFromJson(json);

  @override
  final PlayerID id;
  @JsonKey(defaultValue: '')
  @override
  final String name;

  @override
  String toString() {
    return 'Player(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Player &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$PlayerCopyWith<_Player> get copyWith =>
      __$PlayerCopyWithImpl<_Player>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlayerToJson(this);
  }
}

abstract class _Player implements Player {
  const factory _Player(PlayerID id, {String name}) = _$_Player;

  factory _Player.fromJson(Map<String, dynamic> json) = _$_Player.fromJson;

  @override
  PlayerID get id;
  @override
  String get name;
  @override
  _$PlayerCopyWith<_Player> get copyWith;
}

GenericGame _$GenericGameFromJson(Map<String, dynamic> json) {
  return _GenericGame.fromJson(json);
}

/// @nodoc
class _$GenericGameTearOff {
  const _$GenericGameTearOff();

// ignore: unused_element
  _GenericGame call(
      KtList<Player> players,
      DateTime time,
      KtList<GameMessage> messages,
      GameStatus gameStatus,
      int currentPlayerIndex,
      int round) {
    return _GenericGame(
      players,
      time,
      messages,
      gameStatus,
      currentPlayerIndex,
      round,
    );
  }

// ignore: unused_element
  GenericGame fromJson(Map<String, Object> json) {
    return GenericGame.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GenericGame = _$GenericGameTearOff();

/// @nodoc
mixin _$GenericGame {
  KtList<Player> get players;
  DateTime get time;
  KtList<GameMessage> get messages;
  GameStatus get gameStatus;
  int get currentPlayerIndex;
  int get round;

  Map<String, dynamic> toJson();
  $GenericGameCopyWith<GenericGame> get copyWith;
}

/// @nodoc
abstract class $GenericGameCopyWith<$Res> {
  factory $GenericGameCopyWith(
          GenericGame value, $Res Function(GenericGame) then) =
      _$GenericGameCopyWithImpl<$Res>;
  $Res call(
      {KtList<Player> players,
      DateTime time,
      KtList<GameMessage> messages,
      GameStatus gameStatus,
      int currentPlayerIndex,
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
    Object players = freezed,
    Object time = freezed,
    Object messages = freezed,
    Object gameStatus = freezed,
    Object currentPlayerIndex = freezed,
    Object round = freezed,
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
      {KtList<Player> players,
      DateTime time,
      KtList<GameMessage> messages,
      GameStatus gameStatus,
      int currentPlayerIndex,
      int round});
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
    Object players = freezed,
    Object time = freezed,
    Object messages = freezed,
    Object gameStatus = freezed,
    Object currentPlayerIndex = freezed,
    Object round = freezed,
  }) {
    return _then(_GenericGame(
      players == freezed ? _value.players : players as KtList<Player>,
      time == freezed ? _value.time : time as DateTime,
      messages == freezed ? _value.messages : messages as KtList<GameMessage>,
      gameStatus == freezed ? _value.gameStatus : gameStatus as GameStatus,
      currentPlayerIndex == freezed
          ? _value.currentPlayerIndex
          : currentPlayerIndex as int,
      round == freezed ? _value.round : round as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GenericGame extends _GenericGame {
  const _$_GenericGame(this.players, this.time, this.messages, this.gameStatus,
      this.currentPlayerIndex, this.round)
      : assert(players != null),
        assert(time != null),
        assert(messages != null),
        assert(gameStatus != null),
        assert(currentPlayerIndex != null),
        assert(round != null),
        super._();

  factory _$_GenericGame.fromJson(Map<String, dynamic> json) =>
      _$_$_GenericGameFromJson(json);

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
  String toString() {
    return 'GenericGame(players: $players, time: $time, messages: $messages, gameStatus: $gameStatus, currentPlayerIndex: $currentPlayerIndex, round: $round)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenericGame &&
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
                const DeepCollectionEquality().equals(other.round, round)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(players) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(messages) ^
      const DeepCollectionEquality().hash(gameStatus) ^
      const DeepCollectionEquality().hash(currentPlayerIndex) ^
      const DeepCollectionEquality().hash(round);

  @override
  _$GenericGameCopyWith<_GenericGame> get copyWith =>
      __$GenericGameCopyWithImpl<_GenericGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GenericGameToJson(this);
  }
}

abstract class _GenericGame extends GenericGame {
  const _GenericGame._() : super._();
  const factory _GenericGame(
      KtList<Player> players,
      DateTime time,
      KtList<GameMessage> messages,
      GameStatus gameStatus,
      int currentPlayerIndex,
      int round) = _$_GenericGame;

  factory _GenericGame.fromJson(Map<String, dynamic> json) =
      _$_GenericGame.fromJson;

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
  _$GenericGameCopyWith<_GenericGame> get copyWith;
}

PlayerID _$PlayerIDFromJson(Map<String, dynamic> json) {
  return _PlayerID.fromJson(json);
}

/// @nodoc
class _$PlayerIDTearOff {
  const _$PlayerIDTearOff();

// ignore: unused_element
  _PlayerID call(String id) {
    return _PlayerID(
      id,
    );
  }

// ignore: unused_element
  PlayerID fromJson(Map<String, Object> json) {
    return PlayerID.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PlayerID = _$PlayerIDTearOff();

/// @nodoc
mixin _$PlayerID {
  String get id;

  Map<String, dynamic> toJson();
  $PlayerIDCopyWith<PlayerID> get copyWith;
}

/// @nodoc
abstract class $PlayerIDCopyWith<$Res> {
  factory $PlayerIDCopyWith(PlayerID value, $Res Function(PlayerID) then) =
      _$PlayerIDCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$PlayerIDCopyWithImpl<$Res> implements $PlayerIDCopyWith<$Res> {
  _$PlayerIDCopyWithImpl(this._value, this._then);

  final PlayerID _value;
  // ignore: unused_field
  final $Res Function(PlayerID) _then;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
    ));
  }
}

/// @nodoc
abstract class _$PlayerIDCopyWith<$Res> implements $PlayerIDCopyWith<$Res> {
  factory _$PlayerIDCopyWith(_PlayerID value, $Res Function(_PlayerID) then) =
      __$PlayerIDCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$PlayerIDCopyWithImpl<$Res> extends _$PlayerIDCopyWithImpl<$Res>
    implements _$PlayerIDCopyWith<$Res> {
  __$PlayerIDCopyWithImpl(_PlayerID _value, $Res Function(_PlayerID) _then)
      : super(_value, (v) => _then(v as _PlayerID));

  @override
  _PlayerID get _value => super._value as _PlayerID;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_PlayerID(
      id == freezed ? _value.id : id as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_PlayerID implements _PlayerID {
  const _$_PlayerID(this.id) : assert(id != null);

  factory _$_PlayerID.fromJson(Map<String, dynamic> json) =>
      _$_$_PlayerIDFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'PlayerID(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlayerID &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$PlayerIDCopyWith<_PlayerID> get copyWith =>
      __$PlayerIDCopyWithImpl<_PlayerID>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlayerIDToJson(this);
  }
}

abstract class _PlayerID implements PlayerID {
  const factory _PlayerID(String id) = _$_PlayerID;

  factory _PlayerID.fromJson(Map<String, dynamic> json) = _$_PlayerID.fromJson;

  @override
  String get id;
  @override
  _$PlayerIDCopyWith<_PlayerID> get copyWith;
}

/// @nodoc
class _$GameEventTearOff {
  const _$GameEventTearOff();

// ignore: unused_element
  _GameEventGame game(Event event) {
    return _GameEventGame(
      event,
    );
  }

// ignore: unused_element
  _GameEventGeneral general(GeneralEvent event) {
    return _GameEventGeneral(
      event,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GameEvent = _$GameEventTearOff();

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result game(Event event),
    @required Result general(GeneralEvent event),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result game(Event event),
    Result general(GeneralEvent event),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result game(_GameEventGame value),
    @required Result general(_GameEventGeneral value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result game(_GameEventGame value),
    Result general(_GameEventGeneral value),
    @required Result orElse(),
  });
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
    Object event = freezed,
  }) {
    return _then(_GameEventGame(
      event == freezed ? _value.event : event as Event,
    ));
  }
}

/// @nodoc
class _$_GameEventGame extends _GameEventGame {
  const _$_GameEventGame(this.event)
      : assert(event != null),
        super._();

  @override
  final Event event;

  @override
  String toString() {
    return 'GameEvent.game(event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameEventGame &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(event);

  @override
  _$GameEventGameCopyWith<_GameEventGame> get copyWith =>
      __$GameEventGameCopyWithImpl<_GameEventGame>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result game(Event event),
    @required Result general(GeneralEvent event),
  }) {
    assert(game != null);
    assert(general != null);
    return game(event);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result game(Event event),
    Result general(GeneralEvent event),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (game != null) {
      return game(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result game(_GameEventGame value),
    @required Result general(_GameEventGeneral value),
  }) {
    assert(game != null);
    assert(general != null);
    return game(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result game(_GameEventGame value),
    Result general(_GameEventGeneral value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (game != null) {
      return game(this);
    }
    return orElse();
  }
}

abstract class _GameEventGame extends GameEvent {
  const _GameEventGame._() : super._();
  const factory _GameEventGame(Event event) = _$_GameEventGame;

  Event get event;
  _$GameEventGameCopyWith<_GameEventGame> get copyWith;
}

/// @nodoc
abstract class _$GameEventGeneralCopyWith<$Res> {
  factory _$GameEventGeneralCopyWith(
          _GameEventGeneral value, $Res Function(_GameEventGeneral) then) =
      __$GameEventGeneralCopyWithImpl<$Res>;
  $Res call({GeneralEvent event});

  $GeneralEventCopyWith<$Res> get event;
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
    Object event = freezed,
  }) {
    return _then(_GameEventGeneral(
      event == freezed ? _value.event : event as GeneralEvent,
    ));
  }

  @override
  $GeneralEventCopyWith<$Res> get event {
    if (_value.event == null) {
      return null;
    }
    return $GeneralEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc
class _$_GameEventGeneral extends _GameEventGeneral {
  const _$_GameEventGeneral(this.event)
      : assert(event != null),
        super._();

  @override
  final GeneralEvent event;

  @override
  String toString() {
    return 'GameEvent.general(event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameEventGeneral &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(event);

  @override
  _$GameEventGeneralCopyWith<_GameEventGeneral> get copyWith =>
      __$GameEventGeneralCopyWithImpl<_GameEventGeneral>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result game(Event event),
    @required Result general(GeneralEvent event),
  }) {
    assert(game != null);
    assert(general != null);
    return general(event);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result game(Event event),
    Result general(GeneralEvent event),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (general != null) {
      return general(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result game(_GameEventGame value),
    @required Result general(_GameEventGeneral value),
  }) {
    assert(game != null);
    assert(general != null);
    return general(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result game(_GameEventGame value),
    Result general(_GameEventGeneral value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class _GameEventGeneral extends GameEvent {
  const _GameEventGeneral._() : super._();
  const factory _GameEventGeneral(GeneralEvent event) = _$_GameEventGeneral;

  GeneralEvent get event;
  _$GameEventGeneralCopyWith<_GameEventGeneral> get copyWith;
}

GeneralEvent _$GeneralEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'undo':
      return _GeneralEventUndo.fromJson(json);
    case 'start':
      return _GeneralEventStart.fromJson(json);
    case 'readyNextRound':
      return _GeneralReadyNextRoundEvent.fromJson(json);
    case 'message':
      return GameMessage.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$GeneralEventTearOff {
  const _$GeneralEventTearOff();

// ignore: unused_element
  _GeneralEventUndo undo() {
    return const _GeneralEventUndo();
  }

// ignore: unused_element
  _GeneralEventStart start() {
    return const _GeneralEventStart();
  }

// ignore: unused_element
  _GeneralReadyNextRoundEvent readyNextRound(PlayerID player) {
    return _GeneralReadyNextRoundEvent(
      player,
    );
  }

// ignore: unused_element
  GameMessage message(String message,
      {@required PlayerID from, @required @nullable PlayerID to}) {
    return GameMessage(
      message,
      from: from,
      to: to,
    );
  }

// ignore: unused_element
  GeneralEvent fromJson(Map<String, Object> json) {
    return GeneralEvent.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GeneralEvent = _$GeneralEventTearOff();

/// @nodoc
mixin _$GeneralEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result undo(),
    @required Result start(),
    @required Result readyNextRound(PlayerID player),
    @required
        Result message(String message, PlayerID from, @nullable PlayerID to),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(PlayerID player),
    Result message(String message, PlayerID from, @nullable PlayerID to),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result undo(_GeneralEventUndo value),
    @required Result start(_GeneralEventStart value),
    @required Result readyNextRound(_GeneralReadyNextRoundEvent value),
    @required Result message(GameMessage value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GeneralEventUndo value),
    Result start(_GeneralEventStart value),
    Result readyNextRound(_GeneralReadyNextRoundEvent value),
    Result message(GameMessage value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $GeneralEventCopyWith<$Res> {
  factory $GeneralEventCopyWith(
          GeneralEvent value, $Res Function(GeneralEvent) then) =
      _$GeneralEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GeneralEventCopyWithImpl<$Res> implements $GeneralEventCopyWith<$Res> {
  _$GeneralEventCopyWithImpl(this._value, this._then);

  final GeneralEvent _value;
  // ignore: unused_field
  final $Res Function(GeneralEvent) _then;
}

/// @nodoc
abstract class _$GeneralEventUndoCopyWith<$Res> {
  factory _$GeneralEventUndoCopyWith(
          _GeneralEventUndo value, $Res Function(_GeneralEventUndo) then) =
      __$GeneralEventUndoCopyWithImpl<$Res>;
}

/// @nodoc
class __$GeneralEventUndoCopyWithImpl<$Res>
    extends _$GeneralEventCopyWithImpl<$Res>
    implements _$GeneralEventUndoCopyWith<$Res> {
  __$GeneralEventUndoCopyWithImpl(
      _GeneralEventUndo _value, $Res Function(_GeneralEventUndo) _then)
      : super(_value, (v) => _then(v as _GeneralEventUndo));

  @override
  _GeneralEventUndo get _value => super._value as _GeneralEventUndo;
}

@JsonSerializable()

/// @nodoc
class _$_GeneralEventUndo extends _GeneralEventUndo {
  const _$_GeneralEventUndo() : super._();

  factory _$_GeneralEventUndo.fromJson(Map<String, dynamic> json) =>
      _$_$_GeneralEventUndoFromJson(json);

  @override
  String toString() {
    return 'GeneralEvent.undo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GeneralEventUndo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result undo(),
    @required Result start(),
    @required Result readyNextRound(PlayerID player),
    @required
        Result message(String message, PlayerID from, @nullable PlayerID to),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(message != null);
    return undo();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(PlayerID player),
    Result message(String message, PlayerID from, @nullable PlayerID to),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (undo != null) {
      return undo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result undo(_GeneralEventUndo value),
    @required Result start(_GeneralEventStart value),
    @required Result readyNextRound(_GeneralReadyNextRoundEvent value),
    @required Result message(GameMessage value),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(message != null);
    return undo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GeneralEventUndo value),
    Result start(_GeneralEventStart value),
    Result readyNextRound(_GeneralReadyNextRoundEvent value),
    Result message(GameMessage value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (undo != null) {
      return undo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeneralEventUndoToJson(this)..['runtimeType'] = 'undo';
  }
}

abstract class _GeneralEventUndo extends GeneralEvent {
  const _GeneralEventUndo._() : super._();
  const factory _GeneralEventUndo() = _$_GeneralEventUndo;

  factory _GeneralEventUndo.fromJson(Map<String, dynamic> json) =
      _$_GeneralEventUndo.fromJson;
}

/// @nodoc
abstract class _$GeneralEventStartCopyWith<$Res> {
  factory _$GeneralEventStartCopyWith(
          _GeneralEventStart value, $Res Function(_GeneralEventStart) then) =
      __$GeneralEventStartCopyWithImpl<$Res>;
}

/// @nodoc
class __$GeneralEventStartCopyWithImpl<$Res>
    extends _$GeneralEventCopyWithImpl<$Res>
    implements _$GeneralEventStartCopyWith<$Res> {
  __$GeneralEventStartCopyWithImpl(
      _GeneralEventStart _value, $Res Function(_GeneralEventStart) _then)
      : super(_value, (v) => _then(v as _GeneralEventStart));

  @override
  _GeneralEventStart get _value => super._value as _GeneralEventStart;
}

@JsonSerializable()

/// @nodoc
class _$_GeneralEventStart extends _GeneralEventStart {
  const _$_GeneralEventStart() : super._();

  factory _$_GeneralEventStart.fromJson(Map<String, dynamic> json) =>
      _$_$_GeneralEventStartFromJson(json);

  @override
  String toString() {
    return 'GeneralEvent.start()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GeneralEventStart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result undo(),
    @required Result start(),
    @required Result readyNextRound(PlayerID player),
    @required
        Result message(String message, PlayerID from, @nullable PlayerID to),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(message != null);
    return start();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(PlayerID player),
    Result message(String message, PlayerID from, @nullable PlayerID to),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result undo(_GeneralEventUndo value),
    @required Result start(_GeneralEventStart value),
    @required Result readyNextRound(_GeneralReadyNextRoundEvent value),
    @required Result message(GameMessage value),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(message != null);
    return start(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GeneralEventUndo value),
    Result start(_GeneralEventStart value),
    Result readyNextRound(_GeneralReadyNextRoundEvent value),
    Result message(GameMessage value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (start != null) {
      return start(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeneralEventStartToJson(this)..['runtimeType'] = 'start';
  }
}

abstract class _GeneralEventStart extends GeneralEvent {
  const _GeneralEventStart._() : super._();
  const factory _GeneralEventStart() = _$_GeneralEventStart;

  factory _GeneralEventStart.fromJson(Map<String, dynamic> json) =
      _$_GeneralEventStart.fromJson;
}

/// @nodoc
abstract class _$GeneralReadyNextRoundEventCopyWith<$Res> {
  factory _$GeneralReadyNextRoundEventCopyWith(
          _GeneralReadyNextRoundEvent value,
          $Res Function(_GeneralReadyNextRoundEvent) then) =
      __$GeneralReadyNextRoundEventCopyWithImpl<$Res>;
  $Res call({PlayerID player});

  $PlayerIDCopyWith<$Res> get player;
}

/// @nodoc
class __$GeneralReadyNextRoundEventCopyWithImpl<$Res>
    extends _$GeneralEventCopyWithImpl<$Res>
    implements _$GeneralReadyNextRoundEventCopyWith<$Res> {
  __$GeneralReadyNextRoundEventCopyWithImpl(_GeneralReadyNextRoundEvent _value,
      $Res Function(_GeneralReadyNextRoundEvent) _then)
      : super(_value, (v) => _then(v as _GeneralReadyNextRoundEvent));

  @override
  _GeneralReadyNextRoundEvent get _value =>
      super._value as _GeneralReadyNextRoundEvent;

  @override
  $Res call({
    Object player = freezed,
  }) {
    return _then(_GeneralReadyNextRoundEvent(
      player == freezed ? _value.player : player as PlayerID,
    ));
  }

  @override
  $PlayerIDCopyWith<$Res> get player {
    if (_value.player == null) {
      return null;
    }
    return $PlayerIDCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value));
    });
  }
}

@JsonSerializable()

/// @nodoc
class _$_GeneralReadyNextRoundEvent extends _GeneralReadyNextRoundEvent {
  const _$_GeneralReadyNextRoundEvent(this.player)
      : assert(player != null),
        super._();

  factory _$_GeneralReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =>
      _$_$_GeneralReadyNextRoundEventFromJson(json);

  @override
  final PlayerID player;

  @override
  String toString() {
    return 'GeneralEvent.readyNextRound(player: $player)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeneralReadyNextRoundEvent &&
            (identical(other.player, player) ||
                const DeepCollectionEquality().equals(other.player, player)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(player);

  @override
  _$GeneralReadyNextRoundEventCopyWith<_GeneralReadyNextRoundEvent>
      get copyWith => __$GeneralReadyNextRoundEventCopyWithImpl<
          _GeneralReadyNextRoundEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result undo(),
    @required Result start(),
    @required Result readyNextRound(PlayerID player),
    @required
        Result message(String message, PlayerID from, @nullable PlayerID to),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(message != null);
    return readyNextRound(player);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(PlayerID player),
    Result message(String message, PlayerID from, @nullable PlayerID to),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (readyNextRound != null) {
      return readyNextRound(player);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result undo(_GeneralEventUndo value),
    @required Result start(_GeneralEventStart value),
    @required Result readyNextRound(_GeneralReadyNextRoundEvent value),
    @required Result message(GameMessage value),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(message != null);
    return readyNextRound(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GeneralEventUndo value),
    Result start(_GeneralEventStart value),
    Result readyNextRound(_GeneralReadyNextRoundEvent value),
    Result message(GameMessage value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (readyNextRound != null) {
      return readyNextRound(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeneralReadyNextRoundEventToJson(this)
      ..['runtimeType'] = 'readyNextRound';
  }
}

abstract class _GeneralReadyNextRoundEvent extends GeneralEvent {
  const _GeneralReadyNextRoundEvent._() : super._();
  const factory _GeneralReadyNextRoundEvent(PlayerID player) =
      _$_GeneralReadyNextRoundEvent;

  factory _GeneralReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =
      _$_GeneralReadyNextRoundEvent.fromJson;

  PlayerID get player;
  _$GeneralReadyNextRoundEventCopyWith<_GeneralReadyNextRoundEvent>
      get copyWith;
}

/// @nodoc
abstract class $GameMessageCopyWith<$Res> {
  factory $GameMessageCopyWith(
          GameMessage value, $Res Function(GameMessage) then) =
      _$GameMessageCopyWithImpl<$Res>;
  $Res call({String message, PlayerID from, @nullable PlayerID to});

  $PlayerIDCopyWith<$Res> get from;
  $PlayerIDCopyWith<$Res> get to;
}

/// @nodoc
class _$GameMessageCopyWithImpl<$Res> extends _$GeneralEventCopyWithImpl<$Res>
    implements $GameMessageCopyWith<$Res> {
  _$GameMessageCopyWithImpl(
      GameMessage _value, $Res Function(GameMessage) _then)
      : super(_value, (v) => _then(v as GameMessage));

  @override
  GameMessage get _value => super._value as GameMessage;

  @override
  $Res call({
    Object message = freezed,
    Object from = freezed,
    Object to = freezed,
  }) {
    return _then(GameMessage(
      message == freezed ? _value.message : message as String,
      from: from == freezed ? _value.from : from as PlayerID,
      to: to == freezed ? _value.to : to as PlayerID,
    ));
  }

  @override
  $PlayerIDCopyWith<$Res> get from {
    if (_value.from == null) {
      return null;
    }
    return $PlayerIDCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value));
    });
  }

  @override
  $PlayerIDCopyWith<$Res> get to {
    if (_value.to == null) {
      return null;
    }
    return $PlayerIDCopyWith<$Res>(_value.to, (value) {
      return _then(_value.copyWith(to: value));
    });
  }
}

@JsonSerializable()

/// @nodoc
class _$GameMessage extends GameMessage {
  const _$GameMessage(this.message,
      {@required this.from, @required @nullable this.to})
      : assert(message != null),
        assert(from != null),
        super._();

  factory _$GameMessage.fromJson(Map<String, dynamic> json) =>
      _$_$GameMessageFromJson(json);

  @override
  final String message;
  @override
  final PlayerID from;
  @override
  @nullable
  final PlayerID to;

  @override
  String toString() {
    return 'GeneralEvent.message(message: $message, from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
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

  @override
  $GameMessageCopyWith<GameMessage> get copyWith =>
      _$GameMessageCopyWithImpl<GameMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result undo(),
    @required Result start(),
    @required Result readyNextRound(PlayerID player),
    @required
        Result message(String message, PlayerID from, @nullable PlayerID to),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(message != null);
    return message(this.message, from, to);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(PlayerID player),
    Result message(String message, PlayerID from, @nullable PlayerID to),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (message != null) {
      return message(this.message, from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result undo(_GeneralEventUndo value),
    @required Result start(_GeneralEventStart value),
    @required Result readyNextRound(_GeneralReadyNextRoundEvent value),
    @required Result message(GameMessage value),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(message != null);
    return message(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GeneralEventUndo value),
    Result start(_GeneralEventStart value),
    Result readyNextRound(_GeneralReadyNextRoundEvent value),
    Result message(GameMessage value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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

abstract class GameMessage extends GeneralEvent {
  const GameMessage._() : super._();
  const factory GameMessage(String message,
      {@required PlayerID from,
      @required @nullable PlayerID to}) = _$GameMessage;

  factory GameMessage.fromJson(Map<String, dynamic> json) =
      _$GameMessage.fromJson;

  String get message;
  PlayerID get from;
  @nullable
  PlayerID get to;
  $GameMessageCopyWith<GameMessage> get copyWith;
}

GameConfig _$GameConfigFromJson(Map<String, dynamic> json) {
  return _GameConfig.fromJson(json);
}

/// @nodoc
class _$GameConfigTearOff {
  const _$GameConfigTearOff();

// ignore: unused_element
  _GameConfig call(
      {NameSet nameSet,
      bool customNames = false,
      String adminId,
      String gameType,
      int rounds = 15,
      Map<String, dynamic> options}) {
    return _GameConfig(
      nameSet: nameSet,
      customNames: customNames,
      adminId: adminId,
      gameType: gameType,
      rounds: rounds,
      options: options,
    );
  }

// ignore: unused_element
  GameConfig fromJson(Map<String, Object> json) {
    return GameConfig.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GameConfig = _$GameConfigTearOff();

/// @nodoc
mixin _$GameConfig {
  NameSet get nameSet;
  bool get customNames;
  String get adminId;
  String get gameType;
  int get rounds;

  /// [options must be json serializable]
  Map<String, dynamic> get options;

  Map<String, dynamic> toJson();
  $GameConfigCopyWith<GameConfig> get copyWith;
}

/// @nodoc
abstract class $GameConfigCopyWith<$Res> {
  factory $GameConfigCopyWith(
          GameConfig value, $Res Function(GameConfig) then) =
      _$GameConfigCopyWithImpl<$Res>;
  $Res call(
      {NameSet nameSet,
      bool customNames,
      String adminId,
      String gameType,
      int rounds,
      Map<String, dynamic> options});
}

/// @nodoc
class _$GameConfigCopyWithImpl<$Res> implements $GameConfigCopyWith<$Res> {
  _$GameConfigCopyWithImpl(this._value, this._then);

  final GameConfig _value;
  // ignore: unused_field
  final $Res Function(GameConfig) _then;

  @override
  $Res call({
    Object nameSet = freezed,
    Object customNames = freezed,
    Object adminId = freezed,
    Object gameType = freezed,
    Object rounds = freezed,
    Object options = freezed,
  }) {
    return _then(_value.copyWith(
      nameSet: nameSet == freezed ? _value.nameSet : nameSet as NameSet,
      customNames:
          customNames == freezed ? _value.customNames : customNames as bool,
      adminId: adminId == freezed ? _value.adminId : adminId as String,
      gameType: gameType == freezed ? _value.gameType : gameType as String,
      rounds: rounds == freezed ? _value.rounds : rounds as int,
      options:
          options == freezed ? _value.options : options as Map<String, dynamic>,
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
      {NameSet nameSet,
      bool customNames,
      String adminId,
      String gameType,
      int rounds,
      Map<String, dynamic> options});
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
    Object nameSet = freezed,
    Object customNames = freezed,
    Object adminId = freezed,
    Object gameType = freezed,
    Object rounds = freezed,
    Object options = freezed,
  }) {
    return _then(_GameConfig(
      nameSet: nameSet == freezed ? _value.nameSet : nameSet as NameSet,
      customNames:
          customNames == freezed ? _value.customNames : customNames as bool,
      adminId: adminId == freezed ? _value.adminId : adminId as String,
      gameType: gameType == freezed ? _value.gameType : gameType as String,
      rounds: rounds == freezed ? _value.rounds : rounds as int,
      options:
          options == freezed ? _value.options : options as Map<String, dynamic>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GameConfig implements _GameConfig {
  const _$_GameConfig(
      {this.nameSet,
      this.customNames = false,
      this.adminId,
      this.gameType,
      this.rounds = 15,
      this.options})
      : assert(customNames != null),
        assert(rounds != null);

  factory _$_GameConfig.fromJson(Map<String, dynamic> json) =>
      _$_$_GameConfigFromJson(json);

  @override
  final NameSet nameSet;
  @JsonKey(defaultValue: false)
  @override
  final bool customNames;
  @override
  final String adminId;
  @override
  final String gameType;
  @JsonKey(defaultValue: 15)
  @override
  final int rounds;
  @override

  /// [options must be json serializable]
  final Map<String, dynamic> options;

  @override
  String toString() {
    return 'GameConfig(nameSet: $nameSet, customNames: $customNames, adminId: $adminId, gameType: $gameType, rounds: $rounds, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameConfig &&
            (identical(other.nameSet, nameSet) ||
                const DeepCollectionEquality()
                    .equals(other.nameSet, nameSet)) &&
            (identical(other.customNames, customNames) ||
                const DeepCollectionEquality()
                    .equals(other.customNames, customNames)) &&
            (identical(other.adminId, adminId) ||
                const DeepCollectionEquality()
                    .equals(other.adminId, adminId)) &&
            (identical(other.gameType, gameType) ||
                const DeepCollectionEquality()
                    .equals(other.gameType, gameType)) &&
            (identical(other.rounds, rounds) ||
                const DeepCollectionEquality().equals(other.rounds, rounds)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nameSet) ^
      const DeepCollectionEquality().hash(customNames) ^
      const DeepCollectionEquality().hash(adminId) ^
      const DeepCollectionEquality().hash(gameType) ^
      const DeepCollectionEquality().hash(rounds) ^
      const DeepCollectionEquality().hash(options);

  @override
  _$GameConfigCopyWith<_GameConfig> get copyWith =>
      __$GameConfigCopyWithImpl<_GameConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GameConfigToJson(this);
  }
}

abstract class _GameConfig implements GameConfig {
  const factory _GameConfig(
      {NameSet nameSet,
      bool customNames,
      String adminId,
      String gameType,
      int rounds,
      Map<String, dynamic> options}) = _$_GameConfig;

  factory _GameConfig.fromJson(Map<String, dynamic> json) =
      _$_GameConfig.fromJson;

  @override
  NameSet get nameSet;
  @override
  bool get customNames;
  @override
  String get adminId;
  @override
  String get gameType;
  @override
  int get rounds;
  @override

  /// [options must be json serializable]
  Map<String, dynamic> get options;
  @override
  _$GameConfigCopyWith<_GameConfig> get copyWith;
}

GameInfo _$GameInfoFromJson(Map<String, dynamic> json) {
  return _GameInfo.fromJson(json);
}

/// @nodoc
class _$GameInfoTearOff {
  const _$GameInfoTearOff();

// ignore: unused_element
  _GameInfo call(String gameId, List<String> players, String player,
      bool creator, String gameType) {
    return _GameInfo(
      gameId,
      players,
      player,
      creator,
      gameType,
    );
  }

// ignore: unused_element
  GameInfo fromJson(Map<String, Object> json) {
    return GameInfo.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GameInfo = _$GameInfoTearOff();

/// @nodoc
mixin _$GameInfo {
  String get gameId;
  List<String> get players;
  String get player;
  bool get creator;
  String get gameType;

  Map<String, dynamic> toJson();
  $GameInfoCopyWith<GameInfo> get copyWith;
}

/// @nodoc
abstract class $GameInfoCopyWith<$Res> {
  factory $GameInfoCopyWith(GameInfo value, $Res Function(GameInfo) then) =
      _$GameInfoCopyWithImpl<$Res>;
  $Res call(
      {String gameId,
      List<String> players,
      String player,
      bool creator,
      String gameType});
}

/// @nodoc
class _$GameInfoCopyWithImpl<$Res> implements $GameInfoCopyWith<$Res> {
  _$GameInfoCopyWithImpl(this._value, this._then);

  final GameInfo _value;
  // ignore: unused_field
  final $Res Function(GameInfo) _then;

  @override
  $Res call({
    Object gameId = freezed,
    Object players = freezed,
    Object player = freezed,
    Object creator = freezed,
    Object gameType = freezed,
  }) {
    return _then(_value.copyWith(
      gameId: gameId == freezed ? _value.gameId : gameId as String,
      players: players == freezed ? _value.players : players as List<String>,
      player: player == freezed ? _value.player : player as String,
      creator: creator == freezed ? _value.creator : creator as bool,
      gameType: gameType == freezed ? _value.gameType : gameType as String,
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
      List<String> players,
      String player,
      bool creator,
      String gameType});
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
    Object gameId = freezed,
    Object players = freezed,
    Object player = freezed,
    Object creator = freezed,
    Object gameType = freezed,
  }) {
    return _then(_GameInfo(
      gameId == freezed ? _value.gameId : gameId as String,
      players == freezed ? _value.players : players as List<String>,
      player == freezed ? _value.player : player as String,
      creator == freezed ? _value.creator : creator as bool,
      gameType == freezed ? _value.gameType : gameType as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GameInfo implements _GameInfo {
  const _$_GameInfo(
      this.gameId, this.players, this.player, this.creator, this.gameType)
      : assert(gameId != null),
        assert(players != null),
        assert(player != null),
        assert(creator != null),
        assert(gameType != null);

  factory _$_GameInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_GameInfoFromJson(json);

  @override
  final String gameId;
  @override
  final List<String> players;
  @override
  final String player;
  @override
  final bool creator;
  @override
  final String gameType;

  @override
  String toString() {
    return 'GameInfo(gameId: $gameId, players: $players, player: $player, creator: $creator, gameType: $gameType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameInfo &&
            (identical(other.gameId, gameId) ||
                const DeepCollectionEquality().equals(other.gameId, gameId)) &&
            (identical(other.players, players) ||
                const DeepCollectionEquality()
                    .equals(other.players, players)) &&
            (identical(other.player, player) ||
                const DeepCollectionEquality().equals(other.player, player)) &&
            (identical(other.creator, creator) ||
                const DeepCollectionEquality()
                    .equals(other.creator, creator)) &&
            (identical(other.gameType, gameType) ||
                const DeepCollectionEquality()
                    .equals(other.gameType, gameType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gameId) ^
      const DeepCollectionEquality().hash(players) ^
      const DeepCollectionEquality().hash(player) ^
      const DeepCollectionEquality().hash(creator) ^
      const DeepCollectionEquality().hash(gameType);

  @override
  _$GameInfoCopyWith<_GameInfo> get copyWith =>
      __$GameInfoCopyWithImpl<_GameInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GameInfoToJson(this);
  }
}

abstract class _GameInfo implements GameInfo {
  const factory _GameInfo(String gameId, List<String> players, String player,
      bool creator, String gameType) = _$_GameInfo;

  factory _GameInfo.fromJson(Map<String, dynamic> json) = _$_GameInfo.fromJson;

  @override
  String get gameId;
  @override
  List<String> get players;
  @override
  String get player;
  @override
  bool get creator;
  @override
  String get gameType;
  @override
  _$GameInfoCopyWith<_GameInfo> get copyWith;
}
