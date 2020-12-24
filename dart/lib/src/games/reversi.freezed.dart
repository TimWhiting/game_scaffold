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
      {GenericGame generic, List<String> board, String type = 'Reversi'}) {
    return _ReversiGame(
      generic: generic,
      board: board,
      type: type,
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
  GenericGame get generic;
  List<String> get board;
  String get type;

  Map<String, dynamic> toJson();
  $ReversiGameCopyWith<ReversiGame> get copyWith;
}

/// @nodoc
abstract class $ReversiGameCopyWith<$Res> {
  factory $ReversiGameCopyWith(
          ReversiGame value, $Res Function(ReversiGame) then) =
      _$ReversiGameCopyWithImpl<$Res>;
  $Res call({GenericGame generic, List<String> board, String type});

  $GenericGameCopyWith<$Res> get generic;
}

/// @nodoc
class _$ReversiGameCopyWithImpl<$Res> implements $ReversiGameCopyWith<$Res> {
  _$ReversiGameCopyWithImpl(this._value, this._then);

  final ReversiGame _value;
  // ignore: unused_field
  final $Res Function(ReversiGame) _then;

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
abstract class _$ReversiGameCopyWith<$Res>
    implements $ReversiGameCopyWith<$Res> {
  factory _$ReversiGameCopyWith(
          _ReversiGame value, $Res Function(_ReversiGame) then) =
      __$ReversiGameCopyWithImpl<$Res>;
  @override
  $Res call({GenericGame generic, List<String> board, String type});

  @override
  $GenericGameCopyWith<$Res> get generic;
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
    Object generic = freezed,
    Object board = freezed,
    Object type = freezed,
  }) {
    return _then(_ReversiGame(
      generic: generic == freezed ? _value.generic : generic as GenericGame,
      board: board == freezed ? _value.board : board as List<String>,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ReversiGame extends _ReversiGame {
  const _$_ReversiGame({this.generic, this.board, this.type = 'Reversi'})
      : assert(type != null),
        super._();

  factory _$_ReversiGame.fromJson(Map<String, dynamic> json) =>
      _$_$_ReversiGameFromJson(json);

  @override
  final GenericGame generic;
  @override
  final List<String> board;
  @JsonKey(defaultValue: 'Reversi')
  @override
  final String type;

  @override
  String toString() {
    return 'ReversiGame(generic: $generic, board: $board, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReversiGame &&
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
      {GenericGame generic, List<String> board, String type}) = _$_ReversiGame;

  factory _ReversiGame.fromJson(Map<String, dynamic> json) =
      _$_ReversiGame.fromJson;

  @override
  GenericGame get generic;
  @override
  List<String> get board;
  @override
  String get type;
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
  _ReversiGameEvent call(String id, int location) {
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
  String get id;
  int get location;

  Map<String, dynamic> toJson();
  $ReversiGameEventCopyWith<ReversiGameEvent> get copyWith;
}

/// @nodoc
abstract class $ReversiGameEventCopyWith<$Res> {
  factory $ReversiGameEventCopyWith(
          ReversiGameEvent value, $Res Function(ReversiGameEvent) then) =
      _$ReversiGameEventCopyWithImpl<$Res>;
  $Res call({String id, int location});
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
      id: id == freezed ? _value.id : id as String,
      location: location == freezed ? _value.location : location as int,
    ));
  }
}

/// @nodoc
abstract class _$ReversiGameEventCopyWith<$Res>
    implements $ReversiGameEventCopyWith<$Res> {
  factory _$ReversiGameEventCopyWith(
          _ReversiGameEvent value, $Res Function(_ReversiGameEvent) then) =
      __$ReversiGameEventCopyWithImpl<$Res>;
  @override
  $Res call({String id, int location});
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
      id == freezed ? _value.id : id as String,
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
  final String id;
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
  const factory _ReversiGameEvent(String id, int location) =
      _$_ReversiGameEvent;

  factory _ReversiGameEvent.fromJson(Map<String, dynamic> json) =
      _$_ReversiGameEvent.fromJson;

  @override
  String get id;
  @override
  int get location;
  @override
  _$ReversiGameEventCopyWith<_ReversiGameEvent> get copyWith;
}
