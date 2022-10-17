// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameClientInfo {
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
      _$GameClientInfoCopyWithImpl<$Res>;
  $Res call(
      {GameService? service,
      String? code,
      String? playerName,
      GameConfig? config,
      IList<GameInfo>? games});

  $GameConfigCopyWith<$Res>? get config;
}

/// @nodoc
class _$GameClientInfoCopyWithImpl<$Res>
    implements $GameClientInfoCopyWith<$Res> {
  _$GameClientInfoCopyWithImpl(this._value, this._then);

  final GameClientInfo _value;
  // ignore: unused_field
  final $Res Function(GameClientInfo) _then;

  @override
  $Res call({
    Object? service = freezed,
    Object? code = freezed,
    Object? playerName = freezed,
    Object? config = freezed,
    Object? games = freezed,
  }) {
    return _then(_value.copyWith(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as GameService?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String?,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig?,
      games: games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as IList<GameInfo>?,
    ));
  }

  @override
  $GameConfigCopyWith<$Res>? get config {
    if (_value.config == null) {
      return null;
    }

    return $GameConfigCopyWith<$Res>(_value.config!, (value) {
      return _then(_value.copyWith(config: value));
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
  $Res call(
      {GameService? service,
      String? code,
      String? playerName,
      GameConfig? config,
      IList<GameInfo>? games});

  @override
  $GameConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$$_GameClientInfoCopyWithImpl<$Res>
    extends _$GameClientInfoCopyWithImpl<$Res>
    implements _$$_GameClientInfoCopyWith<$Res> {
  __$$_GameClientInfoCopyWithImpl(
      _$_GameClientInfo _value, $Res Function(_$_GameClientInfo) _then)
      : super(_value, (v) => _then(v as _$_GameClientInfo));

  @override
  _$_GameClientInfo get _value => super._value as _$_GameClientInfo;

  @override
  $Res call({
    Object? service = freezed,
    Object? code = freezed,
    Object? playerName = freezed,
    Object? config = freezed,
    Object? games = freezed,
  }) {
    return _then(_$_GameClientInfo(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as GameService?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String?,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig?,
      games: games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as IList<GameInfo>?,
    ));
  }
}

/// @nodoc

class _$_GameClientInfo extends _GameClientInfo {
  const _$_GameClientInfo(
      {this.service, this.code, this.playerName, this.config, this.games})
      : super._();

  @override
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
            const DeepCollectionEquality().equals(other.service, service) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.playerName, playerName) &&
            const DeepCollectionEquality().equals(other.config, config) &&
            const DeepCollectionEquality().equals(other.games, games));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(service),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(playerName),
      const DeepCollectionEquality().hash(config),
      const DeepCollectionEquality().hash(games));

  @JsonKey(ignore: true)
  @override
  _$$_GameClientInfoCopyWith<_$_GameClientInfo> get copyWith =>
      __$$_GameClientInfoCopyWithImpl<_$_GameClientInfo>(this, _$identity);
}

abstract class _GameClientInfo extends GameClientInfo {
  const factory _GameClientInfo(
      {final GameService? service,
      final String? code,
      final String? playerName,
      final GameConfig? config,
      final IList<GameInfo>? games}) = _$_GameClientInfo;
  const _GameClientInfo._() : super._();

  @override
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

/// @nodoc
mixin _$RoundInfo {
  Lobby? get lobby => throw _privateConstructorUsedError;
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
  $Res call({Lobby? lobby, GameState<Object>? game, String? error});

  $LobbyCopyWith<$Res>? get lobby;
}

/// @nodoc
class _$RoundInfoCopyWithImpl<$Res> implements $RoundInfoCopyWith<$Res> {
  _$RoundInfoCopyWithImpl(this._value, this._then);

  final RoundInfo _value;
  // ignore: unused_field
  final $Res Function(RoundInfo) _then;

  @override
  $Res call({
    Object? lobby = freezed,
    Object? game = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      lobby: lobby == freezed
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as Lobby?,
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
  $LobbyCopyWith<$Res>? get lobby {
    if (_value.lobby == null) {
      return null;
    }

    return $LobbyCopyWith<$Res>(_value.lobby!, (value) {
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
  $Res call({Lobby? lobby, GameState<Object>? game, String? error});

  @override
  $LobbyCopyWith<$Res>? get lobby;
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
    Object? lobby = freezed,
    Object? game = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_RoundInfo(
      lobby: lobby == freezed
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as Lobby?,
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

class _$_RoundInfo implements _RoundInfo {
  const _$_RoundInfo({this.lobby, this.game, this.error});

  @override
  final Lobby? lobby;
  @override
  final GameState<Object>? game;
  @override
  final String? error;

  @override
  String toString() {
    return 'RoundInfo(lobby: $lobby, game: $game, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoundInfo &&
            const DeepCollectionEquality().equals(other.lobby, lobby) &&
            const DeepCollectionEquality().equals(other.game, game) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lobby),
      const DeepCollectionEquality().hash(game),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_RoundInfoCopyWith<_$_RoundInfo> get copyWith =>
      __$$_RoundInfoCopyWithImpl<_$_RoundInfo>(this, _$identity);
}

abstract class _RoundInfo implements RoundInfo {
  const factory _RoundInfo(
      {final Lobby? lobby,
      final GameState<Object>? game,
      final String? error}) = _$_RoundInfo;

  @override
  Lobby? get lobby;
  @override
  GameState<Object>? get game;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_RoundInfoCopyWith<_$_RoundInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
