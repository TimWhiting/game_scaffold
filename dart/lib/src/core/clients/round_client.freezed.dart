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
  @protected
  RoundService? get service => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get playerName => throw _privateConstructorUsedError;
  GameInfo? get lobby => throw _privateConstructorUsedError;
  GameState<Event, Game<Event, dynamic>>? get game =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoundInfoCopyWith<RoundInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundInfoCopyWith<$Res> {
  factory $RoundInfoCopyWith(RoundInfo value, $Res Function(RoundInfo) then) =
      _$RoundInfoCopyWithImpl<$Res, RoundInfo>;
  @useResult
  $Res call(
      {@protected RoundService? service,
      String code,
      String playerName,
      GameInfo? lobby,
      GameState<Event, Game<Event, dynamic>>? game,
      String? error});

  $GameInfoCopyWith<$Res>? get lobby;
}

/// @nodoc
class _$RoundInfoCopyWithImpl<$Res, $Val extends RoundInfo>
    implements $RoundInfoCopyWith<$Res> {
  _$RoundInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? code = null,
    Object? playerName = null,
    Object? lobby = freezed,
    Object? game = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as RoundService?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      lobby: freezed == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as GameInfo?,
      game: freezed == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as GameState<Event, Game<Event, dynamic>>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameInfoCopyWith<$Res>? get lobby {
    if (_value.lobby == null) {
      return null;
    }

    return $GameInfoCopyWith<$Res>(_value.lobby!, (value) {
      return _then(_value.copyWith(lobby: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RoundInfoCopyWith<$Res> implements $RoundInfoCopyWith<$Res> {
  factory _$$_RoundInfoCopyWith(
          _$_RoundInfo value, $Res Function(_$_RoundInfo) then) =
      __$$_RoundInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@protected RoundService? service,
      String code,
      String playerName,
      GameInfo? lobby,
      GameState<Event, Game<Event, dynamic>>? game,
      String? error});

  @override
  $GameInfoCopyWith<$Res>? get lobby;
}

/// @nodoc
class __$$_RoundInfoCopyWithImpl<$Res>
    extends _$RoundInfoCopyWithImpl<$Res, _$_RoundInfo>
    implements _$$_RoundInfoCopyWith<$Res> {
  __$$_RoundInfoCopyWithImpl(
      _$_RoundInfo _value, $Res Function(_$_RoundInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? code = null,
    Object? playerName = null,
    Object? lobby = freezed,
    Object? game = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_RoundInfo(
      freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as RoundService?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      lobby: freezed == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as GameInfo?,
      game: freezed == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as GameState<Event, Game<Event, dynamic>>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RoundInfo extends _RoundInfo {
  const _$_RoundInfo(@protected this.service,
      {required this.code,
      required this.playerName,
      this.lobby,
      this.game,
      this.error})
      : super._();

  @override
  @protected
  final RoundService? service;
  @override
  final String code;
  @override
  final String playerName;
  @override
  final GameInfo? lobby;
  @override
  final GameState<Event, Game<Event, dynamic>>? game;
  @override
  final String? error;

  @override
  String toString() {
    return 'RoundInfo(service: $service, code: $code, playerName: $playerName, lobby: $lobby, game: $game, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoundInfo &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.lobby, lobby) || other.lobby == lobby) &&
            (identical(other.game, game) || other.game == game) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, service, code, playerName, lobby, game, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoundInfoCopyWith<_$_RoundInfo> get copyWith =>
      __$$_RoundInfoCopyWithImpl<_$_RoundInfo>(this, _$identity);
}

abstract class _RoundInfo extends RoundInfo {
  const factory _RoundInfo(@protected final RoundService? service,
      {required final String code,
      required final String playerName,
      final GameInfo? lobby,
      final GameState<Event, Game<Event, dynamic>>? game,
      final String? error}) = _$_RoundInfo;
  const _RoundInfo._() : super._();

  @override
  @protected
  RoundService? get service;
  @override
  String get code;
  @override
  String get playerName;
  @override
  GameInfo? get lobby;
  @override
  GameState<Event, Game<Event, dynamic>>? get game;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_RoundInfoCopyWith<_$_RoundInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
