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
  _ReversiGame call() {
    return const _ReversiGame();
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
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $ReversiGameCopyWith<$Res> {
  factory $ReversiGameCopyWith(
          ReversiGame value, $Res Function(ReversiGame) then) =
      _$ReversiGameCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReversiGameCopyWithImpl<$Res> implements $ReversiGameCopyWith<$Res> {
  _$ReversiGameCopyWithImpl(this._value, this._then);

  final ReversiGame _value;
  // ignore: unused_field
  final $Res Function(ReversiGame) _then;
}

/// @nodoc
abstract class _$ReversiGameCopyWith<$Res> {
  factory _$ReversiGameCopyWith(
          _ReversiGame value, $Res Function(_ReversiGame) then) =
      __$ReversiGameCopyWithImpl<$Res>;
}

/// @nodoc
class __$ReversiGameCopyWithImpl<$Res> extends _$ReversiGameCopyWithImpl<$Res>
    implements _$ReversiGameCopyWith<$Res> {
  __$ReversiGameCopyWithImpl(
      _ReversiGame _value, $Res Function(_ReversiGame) _then)
      : super(_value, (v) => _then(v as _ReversiGame));

  @override
  _ReversiGame get _value => super._value as _ReversiGame;
}

@JsonSerializable()

/// @nodoc
class _$_ReversiGame implements _ReversiGame {
  const _$_ReversiGame();

  factory _$_ReversiGame.fromJson(Map<String, dynamic> json) =>
      _$_$_ReversiGameFromJson(json);

  @override
  String toString() {
    return 'ReversiGame()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ReversiGame);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReversiGameToJson(this);
  }
}

abstract class _ReversiGame implements ReversiGame {
  const factory _ReversiGame() = _$_ReversiGame;

  factory _ReversiGame.fromJson(Map<String, dynamic> json) =
      _$_ReversiGame.fromJson;
}
