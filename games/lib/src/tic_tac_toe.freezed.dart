// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tic_tac_toe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicTacToeGame _$TicTacToeGameFromJson(Map<String, dynamic> json) {
  return _TicTacToeGame.fromJson(json);
}

/// @nodoc
mixin _$TicTacToeGame {
  GenericGame get generic => throw _privateConstructorUsedError;
  IList<String?> get board => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicTacToeGameCopyWith<TicTacToeGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicTacToeGameCopyWith<$Res> {
  factory $TicTacToeGameCopyWith(
          TicTacToeGame value, $Res Function(TicTacToeGame) then) =
      _$TicTacToeGameCopyWithImpl<$Res>;
  $Res call({GenericGame generic, IList<String?> board, String type});

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
    Object? generic = freezed,
    Object? board = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      generic: generic == freezed
          ? _value.generic
          : generic // ignore: cast_nullable_to_non_nullable
              as GenericGame,
      board: board == freezed
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as IList<String?>,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $GenericGameCopyWith<$Res> get generic {
    return $GenericGameCopyWith<$Res>(_value.generic, (value) {
      return _then(_value.copyWith(generic: value));
    });
  }
}

/// @nodoc
abstract class _$$_TicTacToeGameCopyWith<$Res>
    implements $TicTacToeGameCopyWith<$Res> {
  factory _$$_TicTacToeGameCopyWith(
          _$_TicTacToeGame value, $Res Function(_$_TicTacToeGame) then) =
      __$$_TicTacToeGameCopyWithImpl<$Res>;
  @override
  $Res call({GenericGame generic, IList<String?> board, String type});

  @override
  $GenericGameCopyWith<$Res> get generic;
}

/// @nodoc
class __$$_TicTacToeGameCopyWithImpl<$Res>
    extends _$TicTacToeGameCopyWithImpl<$Res>
    implements _$$_TicTacToeGameCopyWith<$Res> {
  __$$_TicTacToeGameCopyWithImpl(
      _$_TicTacToeGame _value, $Res Function(_$_TicTacToeGame) _then)
      : super(_value, (v) => _then(v as _$_TicTacToeGame));

  @override
  _$_TicTacToeGame get _value => super._value as _$_TicTacToeGame;

  @override
  $Res call({
    Object? generic = freezed,
    Object? board = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_TicTacToeGame(
      generic: generic == freezed
          ? _value.generic
          : generic // ignore: cast_nullable_to_non_nullable
              as GenericGame,
      board: board == freezed
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as IList<String?>,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TicTacToeGame extends _TicTacToeGame {
  const _$_TicTacToeGame(
      {required this.generic, required this.board, this.type = 'tictactoe'})
      : super._();

  factory _$_TicTacToeGame.fromJson(Map<String, dynamic> json) =>
      _$$_TicTacToeGameFromJson(json);

  @override
  final GenericGame generic;
  @override
  final IList<String?> board;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'TicTacToeGame(generic: $generic, board: $board, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicTacToeGame &&
            const DeepCollectionEquality().equals(other.generic, generic) &&
            const DeepCollectionEquality().equals(other.board, board) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(generic),
      const DeepCollectionEquality().hash(board),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_TicTacToeGameCopyWith<_$_TicTacToeGame> get copyWith =>
      __$$_TicTacToeGameCopyWithImpl<_$_TicTacToeGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicTacToeGameToJson(
      this,
    );
  }
}

abstract class _TicTacToeGame extends TicTacToeGame {
  const factory _TicTacToeGame(
      {required final GenericGame generic,
      required final IList<String?> board,
      final String type}) = _$_TicTacToeGame;
  const _TicTacToeGame._() : super._();

  factory _TicTacToeGame.fromJson(Map<String, dynamic> json) =
      _$_TicTacToeGame.fromJson;

  @override
  GenericGame get generic;
  @override
  IList<String?> get board;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_TicTacToeGameCopyWith<_$_TicTacToeGame> get copyWith =>
      throw _privateConstructorUsedError;
}

TicTacToeGameEvent _$TicTacToeGameEventFromJson(Map<String, dynamic> json) {
  return _TicTacToeGameEvent.fromJson(json);
}

/// @nodoc
mixin _$TicTacToeGameEvent {
  String get player => throw _privateConstructorUsedError;
  int get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicTacToeGameEventCopyWith<TicTacToeGameEvent> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? player = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TicTacToeGameEventCopyWith<$Res>
    implements $TicTacToeGameEventCopyWith<$Res> {
  factory _$$_TicTacToeGameEventCopyWith(_$_TicTacToeGameEvent value,
          $Res Function(_$_TicTacToeGameEvent) then) =
      __$$_TicTacToeGameEventCopyWithImpl<$Res>;
  @override
  $Res call({String player, int location});
}

/// @nodoc
class __$$_TicTacToeGameEventCopyWithImpl<$Res>
    extends _$TicTacToeGameEventCopyWithImpl<$Res>
    implements _$$_TicTacToeGameEventCopyWith<$Res> {
  __$$_TicTacToeGameEventCopyWithImpl(
      _$_TicTacToeGameEvent _value, $Res Function(_$_TicTacToeGameEvent) _then)
      : super(_value, (v) => _then(v as _$_TicTacToeGameEvent));

  @override
  _$_TicTacToeGameEvent get _value => super._value as _$_TicTacToeGameEvent;

  @override
  $Res call({
    Object? player = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_TicTacToeGameEvent(
      player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TicTacToeGameEvent extends _TicTacToeGameEvent {
  const _$_TicTacToeGameEvent(this.player, this.location) : super._();

  factory _$_TicTacToeGameEvent.fromJson(Map<String, dynamic> json) =>
      _$$_TicTacToeGameEventFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_TicTacToeGameEvent &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$_TicTacToeGameEventCopyWith<_$_TicTacToeGameEvent> get copyWith =>
      __$$_TicTacToeGameEventCopyWithImpl<_$_TicTacToeGameEvent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicTacToeGameEventToJson(
      this,
    );
  }
}

abstract class _TicTacToeGameEvent extends TicTacToeGameEvent {
  const factory _TicTacToeGameEvent(final String player, final int location) =
      _$_TicTacToeGameEvent;
  const _TicTacToeGameEvent._() : super._();

  factory _TicTacToeGameEvent.fromJson(Map<String, dynamic> json) =
      _$_TicTacToeGameEvent.fromJson;

  @override
  String get player;
  @override
  int get location;
  @override
  @JsonKey(ignore: true)
  _$$_TicTacToeGameEventCopyWith<_$_TicTacToeGameEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
