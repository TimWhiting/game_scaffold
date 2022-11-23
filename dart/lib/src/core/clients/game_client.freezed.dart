// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameClientInfo {
  @protected
  GameService? get service => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get playerName => throw _privateConstructorUsedError;
  GameConfig? get config => throw _privateConstructorUsedError;
  IList<GameInfo>? get games => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameClientInfoCopyWith<GameClientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameClientInfoCopyWith<$Res> {
  factory $GameClientInfoCopyWith(
          GameClientInfo value, $Res Function(GameClientInfo) then) =
      _$GameClientInfoCopyWithImpl<$Res, GameClientInfo>;
  @useResult
  $Res call(
      {@protected GameService? service,
      String? code,
      String? playerName,
      GameConfig? config,
      IList<GameInfo>? games});

  $GameConfigCopyWith<$Res>? get config;
}

/// @nodoc
class _$GameClientInfoCopyWithImpl<$Res, $Val extends GameClientInfo>
    implements $GameClientInfoCopyWith<$Res> {
  _$GameClientInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? code = freezed,
    Object? playerName = freezed,
    Object? config = freezed,
    Object? games = freezed,
  }) {
    return _then(_value.copyWith(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as GameService?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      playerName: freezed == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String?,
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig?,
      games: freezed == games
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as IList<GameInfo>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameConfigCopyWith<$Res>? get config {
    if (_value.config == null) {
      return null;
    }

    return $GameConfigCopyWith<$Res>(_value.config!, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameClientInfoCopyWith<$Res>
    implements $GameClientInfoCopyWith<$Res> {
  factory _$$_GameClientInfoCopyWith(
          _$_GameClientInfo value, $Res Function(_$_GameClientInfo) then) =
      __$$_GameClientInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@protected GameService? service,
      String? code,
      String? playerName,
      GameConfig? config,
      IList<GameInfo>? games});

  @override
  $GameConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$$_GameClientInfoCopyWithImpl<$Res>
    extends _$GameClientInfoCopyWithImpl<$Res, _$_GameClientInfo>
    implements _$$_GameClientInfoCopyWith<$Res> {
  __$$_GameClientInfoCopyWithImpl(
      _$_GameClientInfo _value, $Res Function(_$_GameClientInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? code = freezed,
    Object? playerName = freezed,
    Object? config = freezed,
    Object? games = freezed,
  }) {
    return _then(_$_GameClientInfo(
      freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as GameService?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      playerName: freezed == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String?,
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig?,
      games: freezed == games
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as IList<GameInfo>?,
    ));
  }
}

/// @nodoc

class _$_GameClientInfo extends _GameClientInfo {
  const _$_GameClientInfo(@protected this.service,
      {this.code, this.playerName, this.config, this.games})
      : super._();

  @override
  @protected
  final GameService? service;
  @override
  final String? code;
  @override
  final String? playerName;
  @override
  final GameConfig? config;
  @override
  final IList<GameInfo>? games;

  @override
  String toString() {
    return 'GameClientInfo(service: $service, code: $code, playerName: $playerName, config: $config, games: $games)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameClientInfo &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.config, config) || other.config == config) &&
            const DeepCollectionEquality().equals(other.games, games));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service, code, playerName,
      config, const DeepCollectionEquality().hash(games));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameClientInfoCopyWith<_$_GameClientInfo> get copyWith =>
      __$$_GameClientInfoCopyWithImpl<_$_GameClientInfo>(this, _$identity);
}

abstract class _GameClientInfo extends GameClientInfo {
  const factory _GameClientInfo(@protected final GameService? service,
      {final String? code,
      final String? playerName,
      final GameConfig? config,
      final IList<GameInfo>? games}) = _$_GameClientInfo;
  const _GameClientInfo._() : super._();

  @override
  @protected
  GameService? get service;
  @override
  String? get code;
  @override
  String? get playerName;
  @override
  GameConfig? get config;
  @override
  IList<GameInfo>? get games;
  @override
  @JsonKey(ignore: true)
  _$$_GameClientInfoCopyWith<_$_GameClientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
