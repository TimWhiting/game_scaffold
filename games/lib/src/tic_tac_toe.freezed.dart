// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'tic_tac_toe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TicTacToeGame _$TicTacToeGameFromJson(Map<String, dynamic> json) {
  return _TicTacToeGame.fromJson(json);
}

/// @nodoc
class _$TicTacToeGameTearOff {
  const _$TicTacToeGameTearOff();

// ignore: unused_element
  _TicTacToeGame call(
      {@required GenericGame generic,
      @required @unmodifiableStringList List<String> board,
      String type = 'tictactoe'}) {
    return _TicTacToeGame(
      generic: generic,
      board: board,
      type: type,
    );
  }

// ignore: unused_element
  TicTacToeGame fromJson(Map<String, Object> json) {
    return TicTacToeGame.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $TicTacToeGame = _$TicTacToeGameTearOff();

/// @nodoc
mixin _$TicTacToeGame {
  GenericGame get generic;
  @unmodifiableStringList
  List<String> get board;
  String get type;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TicTacToeGameCopyWith<TicTacToeGame> get copyWith;
}

/// @nodoc
abstract class $TicTacToeGameCopyWith<$Res> {
  factory $TicTacToeGameCopyWith(
          TicTacToeGame value, $Res Function(TicTacToeGame) then) =
      _$TicTacToeGameCopyWithImpl<$Res>;
  $Res call(
      {GenericGame generic,
      @unmodifiableStringList List<String> board,
      String type});

  $GenericGameCopyWith<$Res> get generic;
}

/// @nodoc
class _$TicTacToeGameCopyWithImpl<$Res>
    implements $TicTacToeGameCopyWith<$Res> {
  _$TicTacToeGameCopyWithImpl(this._value, this._then);

  final TicTacToeGame _value;
  // ignore: unused_field
  final $Res Function(TicTacToeGame) _then;

  @override
  $Res call({
    Object generic = freezed,
    Object board = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      generic: generic == freezed ? _value.generic : generic as GenericGame,
      board: board == freezed ? _value.board : board as List<String>,
      type: type == freezed ? _value.type : type as String,
    ));
  }

  @override
  $GenericGameCopyWith<$Res> get generic {
    if (_value.generic == null) {
      return null;
    }
    return $GenericGameCopyWith<$Res>(_value.generic, (value) {
      return _then(_value.copyWith(generic: value));
    });
  }
}

/// @nodoc
abstract class _$TicTacToeGameCopyWith<$Res>
    implements $TicTacToeGameCopyWith<$Res> {
  factory _$TicTacToeGameCopyWith(
          _TicTacToeGame value, $Res Function(_TicTacToeGame) then) =
      __$TicTacToeGameCopyWithImpl<$Res>;
  @override
  $Res call(
      {GenericGame generic,
      @unmodifiableStringList List<String> board,
      String type});

  @override
  $GenericGameCopyWith<$Res> get generic;
}

/// @nodoc
class __$TicTacToeGameCopyWithImpl<$Res>
    extends _$TicTacToeGameCopyWithImpl<$Res>
    implements _$TicTacToeGameCopyWith<$Res> {
  __$TicTacToeGameCopyWithImpl(
      _TicTacToeGame _value, $Res Function(_TicTacToeGame) _then)
      : super(_value, (v) => _then(v as _TicTacToeGame));

  @override
  _TicTacToeGame get _value => super._value as _TicTacToeGame;

  @override
  $Res call({
    Object generic = freezed,
    Object board = freezed,
    Object type = freezed,
  }) {
    return _then(_TicTacToeGame(
      generic: generic == freezed ? _value.generic : generic as GenericGame,
      board: board == freezed ? _value.board : board as List<String>,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_TicTacToeGame extends _TicTacToeGame {
  const _$_TicTacToeGame(
      {@required this.generic,
      @required @unmodifiableStringList this.board,
      this.type = 'tictactoe'})
      : assert(generic != null),
        assert(board != null),
        assert(type != null),
        super._();

  factory _$_TicTacToeGame.fromJson(Map<String, dynamic> json) =>
      _$_$_TicTacToeGameFromJson(json);

  @override
  final GenericGame generic;
  @override
  @unmodifiableStringList
  final List<String> board;
  @JsonKey(defaultValue: 'tictactoe')
  @override
  final String type;

  @override
  String toString() {
    return 'TicTacToeGame(generic: $generic, board: $board, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TicTacToeGame &&
            (identical(other.generic, generic) ||
                const DeepCollectionEquality()
                    .equals(other.generic, generic)) &&
            (identical(other.board, board) ||
                const DeepCollectionEquality().equals(other.board, board)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(generic) ^
      const DeepCollectionEquality().hash(board) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$TicTacToeGameCopyWith<_TicTacToeGame> get copyWith =>
      __$TicTacToeGameCopyWithImpl<_TicTacToeGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TicTacToeGameToJson(this);
  }
}

abstract class _TicTacToeGame extends TicTacToeGame {
  const _TicTacToeGame._() : super._();
  const factory _TicTacToeGame(
      {@required GenericGame generic,
      @required @unmodifiableStringList List<String> board,
      String type}) = _$_TicTacToeGame;

  factory _TicTacToeGame.fromJson(Map<String, dynamic> json) =
      _$_TicTacToeGame.fromJson;

  @override
  GenericGame get generic;
  @override
  @unmodifiableStringList
  List<String> get board;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$TicTacToeGameCopyWith<_TicTacToeGame> get copyWith;
}

TicTacToeGameEvent _$TicTacToeGameEventFromJson(Map<String, dynamic> json) {
  return _TicTacToeGameEvent.fromJson(json);
}

/// @nodoc
class _$TicTacToeGameEventTearOff {
  const _$TicTacToeGameEventTearOff();

// ignore: unused_element
  _TicTacToeGameEvent call(String player, int location) {
    return _TicTacToeGameEvent(
      player,
      location,
    );
  }

// ignore: unused_element
  TicTacToeGameEvent fromJson(Map<String, Object> json) {
    return TicTacToeGameEvent.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $TicTacToeGameEvent = _$TicTacToeGameEventTearOff();

/// @nodoc
mixin _$TicTacToeGameEvent {
  String get player;
  int get location;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TicTacToeGameEventCopyWith<TicTacToeGameEvent> get copyWith;
}

/// @nodoc
abstract class $TicTacToeGameEventCopyWith<$Res> {
  factory $TicTacToeGameEventCopyWith(
          TicTacToeGameEvent value, $Res Function(TicTacToeGameEvent) then) =
      _$TicTacToeGameEventCopyWithImpl<$Res>;
  $Res call({String player, int location});
}

/// @nodoc
class _$TicTacToeGameEventCopyWithImpl<$Res>
    implements $TicTacToeGameEventCopyWith<$Res> {
  _$TicTacToeGameEventCopyWithImpl(this._value, this._then);

  final TicTacToeGameEvent _value;
  // ignore: unused_field
  final $Res Function(TicTacToeGameEvent) _then;

  @override
  $Res call({
    Object player = freezed,
    Object location = freezed,
  }) {
    return _then(_value.copyWith(
      player: player == freezed ? _value.player : player as String,
      location: location == freezed ? _value.location : location as int,
    ));
  }
}

/// @nodoc
abstract class _$TicTacToeGameEventCopyWith<$Res>
    implements $TicTacToeGameEventCopyWith<$Res> {
  factory _$TicTacToeGameEventCopyWith(
          _TicTacToeGameEvent value, $Res Function(_TicTacToeGameEvent) then) =
      __$TicTacToeGameEventCopyWithImpl<$Res>;
  @override
  $Res call({String player, int location});
}

/// @nodoc
class __$TicTacToeGameEventCopyWithImpl<$Res>
    extends _$TicTacToeGameEventCopyWithImpl<$Res>
    implements _$TicTacToeGameEventCopyWith<$Res> {
  __$TicTacToeGameEventCopyWithImpl(
      _TicTacToeGameEvent _value, $Res Function(_TicTacToeGameEvent) _then)
      : super(_value, (v) => _then(v as _TicTacToeGameEvent));

  @override
  _TicTacToeGameEvent get _value => super._value as _TicTacToeGameEvent;

  @override
  $Res call({
    Object player = freezed,
    Object location = freezed,
  }) {
    return _then(_TicTacToeGameEvent(
      player == freezed ? _value.player : player as String,
      location == freezed ? _value.location : location as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_TicTacToeGameEvent extends _TicTacToeGameEvent {
  const _$_TicTacToeGameEvent(this.player, this.location)
      : assert(player != null),
        assert(location != null),
        super._();

  factory _$_TicTacToeGameEvent.fromJson(Map<String, dynamic> json) =>
      _$_$_TicTacToeGameEventFromJson(json);

  @override
  final String player;
  @override
  final int location;

  @override
  String toString() {
    return 'TicTacToeGameEvent(player: $player, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TicTacToeGameEvent &&
            (identical(other.player, player) ||
                const DeepCollectionEquality().equals(other.player, player)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(player) ^
      const DeepCollectionEquality().hash(location);

  @JsonKey(ignore: true)
  @override
  _$TicTacToeGameEventCopyWith<_TicTacToeGameEvent> get copyWith =>
      __$TicTacToeGameEventCopyWithImpl<_TicTacToeGameEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TicTacToeGameEventToJson(this);
  }
}

abstract class _TicTacToeGameEvent extends TicTacToeGameEvent {
  const _TicTacToeGameEvent._() : super._();
  const factory _TicTacToeGameEvent(String player, int location) =
      _$_TicTacToeGameEvent;

  factory _TicTacToeGameEvent.fromJson(Map<String, dynamic> json) =
      _$_TicTacToeGameEvent.fromJson;

  @override
  String get player;
  @override
  int get location;
  @override
  @JsonKey(ignore: true)
  _$TicTacToeGameEventCopyWith<_TicTacToeGameEvent> get copyWith;
}
