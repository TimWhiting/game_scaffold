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

TicTacToeGameEvent _$TicTacToeGameEventFromJson(Map<String, dynamic> json) {
  return _TicTacToeGameEvent.fromJson(json);
}

/// @nodoc
mixin _$TicTacToeGameEvent {
  int get player => throw _privateConstructorUsedError;
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
      _$TicTacToeGameEventCopyWithImpl<$Res, TicTacToeGameEvent>;
  @useResult
  $Res call({int player, int location});
}

/// @nodoc
class _$TicTacToeGameEventCopyWithImpl<$Res, $Val extends TicTacToeGameEvent>
    implements $TicTacToeGameEventCopyWith<$Res> {
  _$TicTacToeGameEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicTacToeGameEventCopyWith<$Res>
    implements $TicTacToeGameEventCopyWith<$Res> {
  factory _$$_TicTacToeGameEventCopyWith(_$_TicTacToeGameEvent value,
          $Res Function(_$_TicTacToeGameEvent) then) =
      __$$_TicTacToeGameEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int player, int location});
}

/// @nodoc
class __$$_TicTacToeGameEventCopyWithImpl<$Res>
    extends _$TicTacToeGameEventCopyWithImpl<$Res, _$_TicTacToeGameEvent>
    implements _$$_TicTacToeGameEventCopyWith<$Res> {
  __$$_TicTacToeGameEventCopyWithImpl(
      _$_TicTacToeGameEvent _value, $Res Function(_$_TicTacToeGameEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? location = null,
  }) {
    return _then(_$_TicTacToeGameEvent(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TicTacToeGameEvent implements _TicTacToeGameEvent {
  const _$_TicTacToeGameEvent({required this.player, required this.location});

  factory _$_TicTacToeGameEvent.fromJson(Map<String, dynamic> json) =>
      _$$_TicTacToeGameEventFromJson(json);

  @override
  final int player;
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
            (identical(other.player, player) || other.player == player) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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

abstract class _TicTacToeGameEvent implements TicTacToeGameEvent {
  const factory _TicTacToeGameEvent(
      {required final int player,
      required final int location}) = _$_TicTacToeGameEvent;

  factory _TicTacToeGameEvent.fromJson(Map<String, dynamic> json) =
      _$_TicTacToeGameEvent.fromJson;

  @override
  int get player;
  @override
  int get location;
  @override
  @JsonKey(ignore: true)
  _$$_TicTacToeGameEventCopyWith<_$_TicTacToeGameEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

TicTacToeGame _$TicTacToeGameFromJson(Map<String, dynamic> json) {
  return _TicTacToeGame.fromJson(json);
}

/// @nodoc
mixin _$TicTacToeGame {
  IList<int?> get board => throw _privateConstructorUsedError;
  int get currentPlayer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicTacToeGameCopyWith<TicTacToeGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicTacToeGameCopyWith<$Res> {
  factory $TicTacToeGameCopyWith(
          TicTacToeGame value, $Res Function(TicTacToeGame) then) =
      _$TicTacToeGameCopyWithImpl<$Res, TicTacToeGame>;
  @useResult
  $Res call({IList<int?> board, int currentPlayer});
}

/// @nodoc
class _$TicTacToeGameCopyWithImpl<$Res, $Val extends TicTacToeGame>
    implements $TicTacToeGameCopyWith<$Res> {
  _$TicTacToeGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? currentPlayer = null,
  }) {
    return _then(_value.copyWith(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as IList<int?>,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicTacToeGameCopyWith<$Res>
    implements $TicTacToeGameCopyWith<$Res> {
  factory _$$_TicTacToeGameCopyWith(
          _$_TicTacToeGame value, $Res Function(_$_TicTacToeGame) then) =
      __$$_TicTacToeGameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IList<int?> board, int currentPlayer});
}

/// @nodoc
class __$$_TicTacToeGameCopyWithImpl<$Res>
    extends _$TicTacToeGameCopyWithImpl<$Res, _$_TicTacToeGame>
    implements _$$_TicTacToeGameCopyWith<$Res> {
  __$$_TicTacToeGameCopyWithImpl(
      _$_TicTacToeGame _value, $Res Function(_$_TicTacToeGame) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? currentPlayer = null,
  }) {
    return _then(_$_TicTacToeGame(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as IList<int?>,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TicTacToeGame implements _TicTacToeGame {
  const _$_TicTacToeGame({required this.board, required this.currentPlayer});

  factory _$_TicTacToeGame.fromJson(Map<String, dynamic> json) =>
      _$$_TicTacToeGameFromJson(json);

  @override
  final IList<int?> board;
  @override
  final int currentPlayer;

  @override
  String toString() {
    return 'TicTacToeGame(board: $board, currentPlayer: $currentPlayer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicTacToeGame &&
            const DeepCollectionEquality().equals(other.board, board) &&
            (identical(other.currentPlayer, currentPlayer) ||
                other.currentPlayer == currentPlayer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(board), currentPlayer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicTacToeGameCopyWith<_$_TicTacToeGame> get copyWith =>
      __$$_TicTacToeGameCopyWithImpl<_$_TicTacToeGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicTacToeGameToJson(
      this,
    );
  }
}

abstract class _TicTacToeGame implements TicTacToeGame {
  const factory _TicTacToeGame(
      {required final IList<int?> board,
      required final int currentPlayer}) = _$_TicTacToeGame;

  factory _TicTacToeGame.fromJson(Map<String, dynamic> json) =
      _$_TicTacToeGame.fromJson;

  @override
  IList<int?> get board;
  @override
  int get currentPlayer;
  @override
  @JsonKey(ignore: true)
  _$$_TicTacToeGameCopyWith<_$_TicTacToeGame> get copyWith =>
      throw _privateConstructorUsedError;
}
