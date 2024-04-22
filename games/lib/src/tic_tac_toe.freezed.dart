// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tic_tac_toe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$TicTacToeGameEventImplCopyWith<$Res>
    implements $TicTacToeGameEventCopyWith<$Res> {
  factory _$$TicTacToeGameEventImplCopyWith(_$TicTacToeGameEventImpl value,
          $Res Function(_$TicTacToeGameEventImpl) then) =
      __$$TicTacToeGameEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int player, int location});
}

/// @nodoc
class __$$TicTacToeGameEventImplCopyWithImpl<$Res>
    extends _$TicTacToeGameEventCopyWithImpl<$Res, _$TicTacToeGameEventImpl>
    implements _$$TicTacToeGameEventImplCopyWith<$Res> {
  __$$TicTacToeGameEventImplCopyWithImpl(_$TicTacToeGameEventImpl _value,
      $Res Function(_$TicTacToeGameEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? location = null,
  }) {
    return _then(_$TicTacToeGameEventImpl(
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
class _$TicTacToeGameEventImpl extends _TicTacToeGameEvent {
  const _$TicTacToeGameEventImpl({required this.player, required this.location})
      : super._();

  factory _$TicTacToeGameEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicTacToeGameEventImplFromJson(json);

  @override
  final int player;
  @override
  final int location;

  @override
  String toString() {
    return 'TicTacToeGameEvent(player: $player, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicTacToeGameEventImpl &&
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
  _$$TicTacToeGameEventImplCopyWith<_$TicTacToeGameEventImpl> get copyWith =>
      __$$TicTacToeGameEventImplCopyWithImpl<_$TicTacToeGameEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicTacToeGameEventImplToJson(
      this,
    );
  }
}

abstract class _TicTacToeGameEvent extends TicTacToeGameEvent {
  const factory _TicTacToeGameEvent(
      {required final int player,
      required final int location}) = _$TicTacToeGameEventImpl;
  const _TicTacToeGameEvent._() : super._();

  factory _TicTacToeGameEvent.fromJson(Map<String, dynamic> json) =
      _$TicTacToeGameEventImpl.fromJson;

  @override
  int get player;
  @override
  int get location;
  @override
  @JsonKey(ignore: true)
  _$$TicTacToeGameEventImplCopyWith<_$TicTacToeGameEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicTacToeGame _$TicTacToeGameFromJson(Map<String, dynamic> json) {
  return _TicTacToeGame.fromJson(json);
}

/// @nodoc
mixin _$TicTacToeGame {
  IList<int?> get board => throw _privateConstructorUsedError;
  int get currentPlayer => throw _privateConstructorUsedError;
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
      _$TicTacToeGameCopyWithImpl<$Res, TicTacToeGame>;
  @useResult
  $Res call({IList<int?> board, int currentPlayer, String type});
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
    Object? type = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicTacToeGameImplCopyWith<$Res>
    implements $TicTacToeGameCopyWith<$Res> {
  factory _$$TicTacToeGameImplCopyWith(
          _$TicTacToeGameImpl value, $Res Function(_$TicTacToeGameImpl) then) =
      __$$TicTacToeGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IList<int?> board, int currentPlayer, String type});
}

/// @nodoc
class __$$TicTacToeGameImplCopyWithImpl<$Res>
    extends _$TicTacToeGameCopyWithImpl<$Res, _$TicTacToeGameImpl>
    implements _$$TicTacToeGameImplCopyWith<$Res> {
  __$$TicTacToeGameImplCopyWithImpl(
      _$TicTacToeGameImpl _value, $Res Function(_$TicTacToeGameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? currentPlayer = null,
    Object? type = null,
  }) {
    return _then(_$TicTacToeGameImpl(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as IList<int?>,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicTacToeGameImpl extends _TicTacToeGame {
  const _$TicTacToeGameImpl(
      {required this.board,
      required this.currentPlayer,
      this.type = 'tictactoe'})
      : super._();

  factory _$TicTacToeGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicTacToeGameImplFromJson(json);

  @override
  final IList<int?> board;
  @override
  final int currentPlayer;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'TicTacToeGame(board: $board, currentPlayer: $currentPlayer, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicTacToeGameImpl &&
            const DeepCollectionEquality().equals(other.board, board) &&
            (identical(other.currentPlayer, currentPlayer) ||
                other.currentPlayer == currentPlayer) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(board), currentPlayer, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicTacToeGameImplCopyWith<_$TicTacToeGameImpl> get copyWith =>
      __$$TicTacToeGameImplCopyWithImpl<_$TicTacToeGameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicTacToeGameImplToJson(
      this,
    );
  }
}

abstract class _TicTacToeGame extends TicTacToeGame {
  const factory _TicTacToeGame(
      {required final IList<int?> board,
      required final int currentPlayer,
      final String type}) = _$TicTacToeGameImpl;
  const _TicTacToeGame._() : super._();

  factory _TicTacToeGame.fromJson(Map<String, dynamic> json) =
      _$TicTacToeGameImpl.fromJson;

  @override
  IList<int?> get board;
  @override
  int get currentPlayer;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$TicTacToeGameImplCopyWith<_$TicTacToeGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
