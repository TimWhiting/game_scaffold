// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'round_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoundInfo {
  RoundService? get _service => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get playerName => throw _privateConstructorUsedError;
  GameInfo? get lobby => throw _privateConstructorUsedError;
  GameState<Object>? get game => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoundInfoCopyWith<RoundInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundInfoCopyWith<$Res> {
  factory $RoundInfoCopyWith(RoundInfo value, $Res Function(RoundInfo) then) =
      _$RoundInfoCopyWithImpl<$Res>;
  $Res call(
      {RoundService? _service,
      String code,
      String playerName,
      GameInfo? lobby,
      GameState<Object>? game,
      String? error});

  $GameInfoCopyWith<$Res>? get lobby;
}

/// @nodoc
class _$RoundInfoCopyWithImpl<$Res> implements $RoundInfoCopyWith<$Res> {
  _$RoundInfoCopyWithImpl(this._value, this._then);

  final RoundInfo _value;
  // ignore: unused_field
  final $Res Function(RoundInfo) _then;

  @override
  $Res call({
    Object? _service = freezed,
    Object? code = freezed,
    Object? playerName = freezed,
    Object? lobby = freezed,
    Object? game = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      _service: _service == freezed
          ? _value._service
          : _service // ignore: cast_nullable_to_non_nullable
              as RoundService?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      lobby: lobby == freezed
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as GameInfo?,
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as GameState<Object>?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $GameInfoCopyWith<$Res>? get lobby {
    if (_value.lobby == null) {
      return null;
    }

    return $GameInfoCopyWith<$Res>(_value.lobby!, (value) {
      return _then(_value.copyWith(lobby: value));
    });
  }
}

/// @nodoc
abstract class _$$_RoundInfoCopyWith<$Res> implements $RoundInfoCopyWith<$Res> {
  factory _$$_RoundInfoCopyWith(
          _$_RoundInfo value, $Res Function(_$_RoundInfo) then) =
      __$$_RoundInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {RoundService? _service,
      String code,
      String playerName,
      GameInfo? lobby,
      GameState<Object>? game,
      String? error});

  @override
  $GameInfoCopyWith<$Res>? get lobby;
}

/// @nodoc
class __$$_RoundInfoCopyWithImpl<$Res> extends _$RoundInfoCopyWithImpl<$Res>
    implements _$$_RoundInfoCopyWith<$Res> {
  __$$_RoundInfoCopyWithImpl(
      _$_RoundInfo _value, $Res Function(_$_RoundInfo) _then)
      : super(_value, (v) => _then(v as _$_RoundInfo));

  @override
  _$_RoundInfo get _value => super._value as _$_RoundInfo;

  @override
  $Res call({
    Object? _service = freezed,
    Object? code = freezed,
    Object? playerName = freezed,
    Object? lobby = freezed,
    Object? game = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_RoundInfo(
      _service == freezed
          ? _value._service
          : _service // ignore: cast_nullable_to_non_nullable
              as RoundService?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      lobby: lobby == freezed
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as GameInfo?,
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as GameState<Object>?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RoundInfo extends _RoundInfo {
  const _$_RoundInfo(this._service,
      {required this.code,
      required this.playerName,
      this.lobby,
      this.game,
      this.error})
      : super._();

  @override
  final RoundService? _service;
  @override
  final String code;
  @override
  final String playerName;
  @override
  final GameInfo? lobby;
  @override
  final GameState<Object>? game;
  @override
  final String? error;

  @override
  String toString() {
    return 'RoundInfo(_service: $_service, code: $code, playerName: $playerName, lobby: $lobby, game: $game, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoundInfo &&
            const DeepCollectionEquality().equals(other._service, _service) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.playerName, playerName) &&
            const DeepCollectionEquality().equals(other.lobby, lobby) &&
            const DeepCollectionEquality().equals(other.game, game) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_service),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(playerName),
      const DeepCollectionEquality().hash(lobby),
      const DeepCollectionEquality().hash(game),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_RoundInfoCopyWith<_$_RoundInfo> get copyWith =>
      __$$_RoundInfoCopyWithImpl<_$_RoundInfo>(this, _$identity);
}

abstract class _RoundInfo extends RoundInfo {
  const factory _RoundInfo(final RoundService? _service,
      {required final String code,
      required final String playerName,
      final GameInfo? lobby,
      final GameState<Object>? game,
      final String? error}) = _$_RoundInfo;
  const _RoundInfo._() : super._();

  @override
  RoundService? get _service;
  @override
  String get code;
  @override
  String get playerName;
  @override
  GameInfo? get lobby;
  @override
  GameState<Object>? get game;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_RoundInfoCopyWith<_$_RoundInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
