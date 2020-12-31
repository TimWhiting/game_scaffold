// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'generic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GenericGame _$GenericGameFromJson(Map<String, dynamic> json) {
  return _GenericGame.fromJson(json);
}

/// @nodoc
class _$GenericGameTearOff {
  const _$GenericGameTearOff();

// ignore: unused_element
  _GenericGame call(
      KtList<Player> players,
      KtList<KtList<double>> allRoundScores,
      DateTime time,
      KtList<GameMessage> messages,
      GameStatus gameStatus,
      int currentPlayerIndex,
      int round) {
    return _GenericGame(
      players,
      allRoundScores,
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
  KtList<KtList<double>> get allRoundScores;
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
      KtList<KtList<double>> allRoundScores,
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
    Object allRoundScores = freezed,
    Object time = freezed,
    Object messages = freezed,
    Object gameStatus = freezed,
    Object currentPlayerIndex = freezed,
    Object round = freezed,
  }) {
    return _then(_value.copyWith(
      players: players == freezed ? _value.players : players as KtList<Player>,
      allRoundScores: allRoundScores == freezed
          ? _value.allRoundScores
          : allRoundScores as KtList<KtList<double>>,
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
      KtList<KtList<double>> allRoundScores,
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
    Object allRoundScores = freezed,
    Object time = freezed,
    Object messages = freezed,
    Object gameStatus = freezed,
    Object currentPlayerIndex = freezed,
    Object round = freezed,
  }) {
    return _then(_GenericGame(
      players == freezed ? _value.players : players as KtList<Player>,
      allRoundScores == freezed
          ? _value.allRoundScores
          : allRoundScores as KtList<KtList<double>>,
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
  const _$_GenericGame(this.players, this.allRoundScores, this.time,
      this.messages, this.gameStatus, this.currentPlayerIndex, this.round)
      : assert(players != null),
        assert(allRoundScores != null),
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
  final KtList<KtList<double>> allRoundScores;
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
    return 'GenericGame(players: $players, allRoundScores: $allRoundScores, time: $time, messages: $messages, gameStatus: $gameStatus, currentPlayerIndex: $currentPlayerIndex, round: $round)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenericGame &&
            (identical(other.players, players) ||
                const DeepCollectionEquality()
                    .equals(other.players, players)) &&
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
                const DeepCollectionEquality().equals(other.round, round)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(players) ^
      const DeepCollectionEquality().hash(allRoundScores) ^
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
      KtList<KtList<double>> allRoundScores,
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
  KtList<KtList<double>> get allRoundScores;
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

GenericEvent _$GenericEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'undo':
      return _GenericEventUndo.fromJson(json);
    case 'start':
      return _GenericEventStart.fromJson(json);
    case 'readyNextRound':
      return _GenericReadyNextRoundEvent.fromJson(json);
    case 'addPlayer':
      return _GenericEventAddPlayer.fromJson(json);
    case 'message':
      return GameMessage.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$GenericEventTearOff {
  const _$GenericEventTearOff();

// ignore: unused_element
  _GenericEventUndo undo() {
    return const _GenericEventUndo();
  }

// ignore: unused_element
  _GenericEventStart start() {
    return const _GenericEventStart();
  }

// ignore: unused_element
  _GenericReadyNextRoundEvent readyNextRound(String player) {
    return _GenericReadyNextRoundEvent(
      player,
    );
  }

// ignore: unused_element
  _GenericEventAddPlayer addPlayer(Player player) {
    return _GenericEventAddPlayer(
      player,
    );
  }

// ignore: unused_element
  GameMessage message(String message,
      {@required String from, @required @nullable String to}) {
    return GameMessage(
      message,
      from: from,
      to: to,
    );
  }

// ignore: unused_element
  GenericEvent fromJson(Map<String, Object> json) {
    return GenericEvent.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GenericEvent = _$GenericEventTearOff();

/// @nodoc
mixin _$GenericEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result undo(),
    @required Result start(),
    @required Result readyNextRound(String player),
    @required Result addPlayer(Player player),
    @required Result message(String message, String from, @nullable String to),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(String player),
    Result addPlayer(Player player),
    Result message(String message, String from, @nullable String to),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result undo(_GenericEventUndo value),
    @required Result start(_GenericEventStart value),
    @required Result readyNextRound(_GenericReadyNextRoundEvent value),
    @required Result addPlayer(_GenericEventAddPlayer value),
    @required Result message(GameMessage value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GenericEventUndo value),
    Result start(_GenericEventStart value),
    Result readyNextRound(_GenericReadyNextRoundEvent value),
    Result addPlayer(_GenericEventAddPlayer value),
    Result message(GameMessage value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
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
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GenericEventUndo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result undo(),
    @required Result start(),
    @required Result readyNextRound(String player),
    @required Result addPlayer(Player player),
    @required Result message(String message, String from, @nullable String to),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(addPlayer != null);
    assert(message != null);
    return undo();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(String player),
    Result addPlayer(Player player),
    Result message(String message, String from, @nullable String to),
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
    @required Result undo(_GenericEventUndo value),
    @required Result start(_GenericEventStart value),
    @required Result readyNextRound(_GenericReadyNextRoundEvent value),
    @required Result addPlayer(_GenericEventAddPlayer value),
    @required Result message(GameMessage value),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(addPlayer != null);
    assert(message != null);
    return undo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GenericEventUndo value),
    Result start(_GenericEventStart value),
    Result readyNextRound(_GenericReadyNextRoundEvent value),
    Result addPlayer(_GenericEventAddPlayer value),
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
    return _$_$_GenericEventUndoToJson(this)..['runtimeType'] = 'undo';
  }
}

abstract class _GenericEventUndo extends GenericEvent {
  const _GenericEventUndo._() : super._();
  const factory _GenericEventUndo() = _$_GenericEventUndo;

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
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GenericEventStart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result undo(),
    @required Result start(),
    @required Result readyNextRound(String player),
    @required Result addPlayer(Player player),
    @required Result message(String message, String from, @nullable String to),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(addPlayer != null);
    assert(message != null);
    return start();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(String player),
    Result addPlayer(Player player),
    Result message(String message, String from, @nullable String to),
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
    @required Result undo(_GenericEventUndo value),
    @required Result start(_GenericEventStart value),
    @required Result readyNextRound(_GenericReadyNextRoundEvent value),
    @required Result addPlayer(_GenericEventAddPlayer value),
    @required Result message(GameMessage value),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(addPlayer != null);
    assert(message != null);
    return start(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GenericEventUndo value),
    Result start(_GenericEventStart value),
    Result readyNextRound(_GenericReadyNextRoundEvent value),
    Result addPlayer(_GenericEventAddPlayer value),
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
    return _$_$_GenericEventStartToJson(this)..['runtimeType'] = 'start';
  }
}

abstract class _GenericEventStart extends GenericEvent {
  const _GenericEventStart._() : super._();
  const factory _GenericEventStart() = _$_GenericEventStart;

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
    Object player = freezed,
  }) {
    return _then(_GenericReadyNextRoundEvent(
      player == freezed ? _value.player : player as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GenericReadyNextRoundEvent extends _GenericReadyNextRoundEvent {
  const _$_GenericReadyNextRoundEvent(this.player)
      : assert(player != null),
        super._();

  factory _$_GenericReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =>
      _$_$_GenericReadyNextRoundEventFromJson(json);

  @override
  final String player;

  @override
  String toString() {
    return 'GenericEvent.readyNextRound(player: $player)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenericReadyNextRoundEvent &&
            (identical(other.player, player) ||
                const DeepCollectionEquality().equals(other.player, player)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(player);

  @override
  _$GenericReadyNextRoundEventCopyWith<_GenericReadyNextRoundEvent>
      get copyWith => __$GenericReadyNextRoundEventCopyWithImpl<
          _GenericReadyNextRoundEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result undo(),
    @required Result start(),
    @required Result readyNextRound(String player),
    @required Result addPlayer(Player player),
    @required Result message(String message, String from, @nullable String to),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(addPlayer != null);
    assert(message != null);
    return readyNextRound(player);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(String player),
    Result addPlayer(Player player),
    Result message(String message, String from, @nullable String to),
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
    @required Result undo(_GenericEventUndo value),
    @required Result start(_GenericEventStart value),
    @required Result readyNextRound(_GenericReadyNextRoundEvent value),
    @required Result addPlayer(_GenericEventAddPlayer value),
    @required Result message(GameMessage value),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(addPlayer != null);
    assert(message != null);
    return readyNextRound(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GenericEventUndo value),
    Result start(_GenericEventStart value),
    Result readyNextRound(_GenericReadyNextRoundEvent value),
    Result addPlayer(_GenericEventAddPlayer value),
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
    return _$_$_GenericReadyNextRoundEventToJson(this)
      ..['runtimeType'] = 'readyNextRound';
  }
}

abstract class _GenericReadyNextRoundEvent extends GenericEvent {
  const _GenericReadyNextRoundEvent._() : super._();
  const factory _GenericReadyNextRoundEvent(String player) =
      _$_GenericReadyNextRoundEvent;

  factory _GenericReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =
      _$_GenericReadyNextRoundEvent.fromJson;

  String get player;
  _$GenericReadyNextRoundEventCopyWith<_GenericReadyNextRoundEvent>
      get copyWith;
}

/// @nodoc
abstract class _$GenericEventAddPlayerCopyWith<$Res> {
  factory _$GenericEventAddPlayerCopyWith(_GenericEventAddPlayer value,
          $Res Function(_GenericEventAddPlayer) then) =
      __$GenericEventAddPlayerCopyWithImpl<$Res>;
  $Res call({Player player});

  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class __$GenericEventAddPlayerCopyWithImpl<$Res>
    extends _$GenericEventCopyWithImpl<$Res>
    implements _$GenericEventAddPlayerCopyWith<$Res> {
  __$GenericEventAddPlayerCopyWithImpl(_GenericEventAddPlayer _value,
      $Res Function(_GenericEventAddPlayer) _then)
      : super(_value, (v) => _then(v as _GenericEventAddPlayer));

  @override
  _GenericEventAddPlayer get _value => super._value as _GenericEventAddPlayer;

  @override
  $Res call({
    Object player = freezed,
  }) {
    return _then(_GenericEventAddPlayer(
      player == freezed ? _value.player : player as Player,
    ));
  }

  @override
  $PlayerCopyWith<$Res> get player {
    if (_value.player == null) {
      return null;
    }
    return $PlayerCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value));
    });
  }
}

@JsonSerializable()

/// @nodoc
class _$_GenericEventAddPlayer extends _GenericEventAddPlayer {
  const _$_GenericEventAddPlayer(this.player)
      : assert(player != null),
        super._();

  factory _$_GenericEventAddPlayer.fromJson(Map<String, dynamic> json) =>
      _$_$_GenericEventAddPlayerFromJson(json);

  @override
  final Player player;

  @override
  String toString() {
    return 'GenericEvent.addPlayer(player: $player)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenericEventAddPlayer &&
            (identical(other.player, player) ||
                const DeepCollectionEquality().equals(other.player, player)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(player);

  @override
  _$GenericEventAddPlayerCopyWith<_GenericEventAddPlayer> get copyWith =>
      __$GenericEventAddPlayerCopyWithImpl<_GenericEventAddPlayer>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result undo(),
    @required Result start(),
    @required Result readyNextRound(String player),
    @required Result addPlayer(Player player),
    @required Result message(String message, String from, @nullable String to),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(addPlayer != null);
    assert(message != null);
    return addPlayer(player);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(String player),
    Result addPlayer(Player player),
    Result message(String message, String from, @nullable String to),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addPlayer != null) {
      return addPlayer(player);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result undo(_GenericEventUndo value),
    @required Result start(_GenericEventStart value),
    @required Result readyNextRound(_GenericReadyNextRoundEvent value),
    @required Result addPlayer(_GenericEventAddPlayer value),
    @required Result message(GameMessage value),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(addPlayer != null);
    assert(message != null);
    return addPlayer(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GenericEventUndo value),
    Result start(_GenericEventStart value),
    Result readyNextRound(_GenericReadyNextRoundEvent value),
    Result addPlayer(_GenericEventAddPlayer value),
    Result message(GameMessage value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addPlayer != null) {
      return addPlayer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GenericEventAddPlayerToJson(this)
      ..['runtimeType'] = 'addPlayer';
  }
}

abstract class _GenericEventAddPlayer extends GenericEvent {
  const _GenericEventAddPlayer._() : super._();
  const factory _GenericEventAddPlayer(Player player) =
      _$_GenericEventAddPlayer;

  factory _GenericEventAddPlayer.fromJson(Map<String, dynamic> json) =
      _$_GenericEventAddPlayer.fromJson;

  Player get player;
  _$GenericEventAddPlayerCopyWith<_GenericEventAddPlayer> get copyWith;
}

/// @nodoc
abstract class $GameMessageCopyWith<$Res> {
  factory $GameMessageCopyWith(
          GameMessage value, $Res Function(GameMessage) then) =
      _$GameMessageCopyWithImpl<$Res>;
  $Res call({String message, String from, @nullable String to});
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
    Object message = freezed,
    Object from = freezed,
    Object to = freezed,
  }) {
    return _then(GameMessage(
      message == freezed ? _value.message : message as String,
      from: from == freezed ? _value.from : from as String,
      to: to == freezed ? _value.to : to as String,
    ));
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
  final String from;
  @override
  @nullable
  final String to;

  @override
  String toString() {
    return 'GenericEvent.message(message: $message, from: $from, to: $to)';
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
    @required Result readyNextRound(String player),
    @required Result addPlayer(Player player),
    @required Result message(String message, String from, @nullable String to),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(addPlayer != null);
    assert(message != null);
    return message(this.message, from, to);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result undo(),
    Result start(),
    Result readyNextRound(String player),
    Result addPlayer(Player player),
    Result message(String message, String from, @nullable String to),
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
    @required Result undo(_GenericEventUndo value),
    @required Result start(_GenericEventStart value),
    @required Result readyNextRound(_GenericReadyNextRoundEvent value),
    @required Result addPlayer(_GenericEventAddPlayer value),
    @required Result message(GameMessage value),
  }) {
    assert(undo != null);
    assert(start != null);
    assert(readyNextRound != null);
    assert(addPlayer != null);
    assert(message != null);
    return message(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result undo(_GenericEventUndo value),
    Result start(_GenericEventStart value),
    Result readyNextRound(_GenericReadyNextRoundEvent value),
    Result addPlayer(_GenericEventAddPlayer value),
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

abstract class GameMessage extends GenericEvent {
  const GameMessage._() : super._();
  const factory GameMessage(String message,
      {@required String from, @required @nullable String to}) = _$GameMessage;

  factory GameMessage.fromJson(Map<String, dynamic> json) =
      _$GameMessage.fromJson;

  String get message;
  String get from;
  @nullable
  String get to;
  $GameMessageCopyWith<GameMessage> get copyWith;
}
