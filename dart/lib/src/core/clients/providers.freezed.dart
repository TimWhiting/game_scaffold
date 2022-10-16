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
  String? get code => throw _privateConstructorUsedError;
  String? get playerName => throw _privateConstructorUsedError;
  GameConfig? get config => throw _privateConstructorUsedError;
  IList<GameInfo>? get games => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? code, String? playerName,
            GameConfig? config, IList<GameInfo>? games)
        connecting,
    required TResult Function(GameService service, String? code,
            String? playerName, GameConfig? config, IList<GameInfo>? games)
        connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? code, String? playerName, GameConfig? config,
            IList<GameInfo>? games)?
        connecting,
    TResult Function(GameService service, String? code, String? playerName,
            GameConfig? config, IList<GameInfo>? games)?
        connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? code, String? playerName, GameConfig? config,
            IList<GameInfo>? games)?
        connecting,
    TResult Function(GameService service, String? code, String? playerName,
            GameConfig? config, IList<GameInfo>? games)?
        connected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameClientInfoConnecting value) connecting,
    required TResult Function(GameClientInfoConnected value) connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameClientInfoConnecting value)? connecting,
    TResult Function(GameClientInfoConnected value)? connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameClientInfoConnecting value)? connecting,
    TResult Function(GameClientInfoConnected value)? connected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

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
      {String? code,
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
    Object? code = freezed,
    Object? playerName = freezed,
    Object? config = freezed,
    Object? games = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$GameClientInfoConnectingCopyWith<$Res>
    implements $GameClientInfoCopyWith<$Res> {
  factory _$$GameClientInfoConnectingCopyWith(_$GameClientInfoConnecting value,
          $Res Function(_$GameClientInfoConnecting) then) =
      __$$GameClientInfoConnectingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? code,
      String? playerName,
      GameConfig? config,
      IList<GameInfo>? games});

  @override
  $GameConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$$GameClientInfoConnectingCopyWithImpl<$Res>
    extends _$GameClientInfoCopyWithImpl<$Res>
    implements _$$GameClientInfoConnectingCopyWith<$Res> {
  __$$GameClientInfoConnectingCopyWithImpl(_$GameClientInfoConnecting _value,
      $Res Function(_$GameClientInfoConnecting) _then)
      : super(_value, (v) => _then(v as _$GameClientInfoConnecting));

  @override
  _$GameClientInfoConnecting get _value =>
      super._value as _$GameClientInfoConnecting;

  @override
  $Res call({
    Object? code = freezed,
    Object? playerName = freezed,
    Object? config = freezed,
    Object? games = freezed,
  }) {
    return _then(_$GameClientInfoConnecting(
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

class _$GameClientInfoConnecting implements GameClientInfoConnecting {
  const _$GameClientInfoConnecting(
      {this.code, this.playerName, this.config, this.games});

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
    return 'GameClientInfo.connecting(code: $code, playerName: $playerName, config: $config, games: $games)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameClientInfoConnecting &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.playerName, playerName) &&
            const DeepCollectionEquality().equals(other.config, config) &&
            const DeepCollectionEquality().equals(other.games, games));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(playerName),
      const DeepCollectionEquality().hash(config),
      const DeepCollectionEquality().hash(games));

  @JsonKey(ignore: true)
  @override
  _$$GameClientInfoConnectingCopyWith<_$GameClientInfoConnecting>
      get copyWith =>
          __$$GameClientInfoConnectingCopyWithImpl<_$GameClientInfoConnecting>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? code, String? playerName,
            GameConfig? config, IList<GameInfo>? games)
        connecting,
    required TResult Function(GameService service, String? code,
            String? playerName, GameConfig? config, IList<GameInfo>? games)
        connected,
  }) {
    return connecting(code, playerName, config, games);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? code, String? playerName, GameConfig? config,
            IList<GameInfo>? games)?
        connecting,
    TResult Function(GameService service, String? code, String? playerName,
            GameConfig? config, IList<GameInfo>? games)?
        connected,
  }) {
    return connecting?.call(code, playerName, config, games);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? code, String? playerName, GameConfig? config,
            IList<GameInfo>? games)?
        connecting,
    TResult Function(GameService service, String? code, String? playerName,
            GameConfig? config, IList<GameInfo>? games)?
        connected,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(code, playerName, config, games);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameClientInfoConnecting value) connecting,
    required TResult Function(GameClientInfoConnected value) connected,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameClientInfoConnecting value)? connecting,
    TResult Function(GameClientInfoConnected value)? connected,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameClientInfoConnecting value)? connecting,
    TResult Function(GameClientInfoConnected value)? connected,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class GameClientInfoConnecting implements GameClientInfo {
  const factory GameClientInfoConnecting(
      {final String? code,
      final String? playerName,
      final GameConfig? config,
      final IList<GameInfo>? games}) = _$GameClientInfoConnecting;

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
  _$$GameClientInfoConnectingCopyWith<_$GameClientInfoConnecting>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameClientInfoConnectedCopyWith<$Res>
    implements $GameClientInfoCopyWith<$Res> {
  factory _$$GameClientInfoConnectedCopyWith(_$GameClientInfoConnected value,
          $Res Function(_$GameClientInfoConnected) then) =
      __$$GameClientInfoConnectedCopyWithImpl<$Res>;
  @override
  $Res call(
      {GameService service,
      String? code,
      String? playerName,
      GameConfig? config,
      IList<GameInfo>? games});

  @override
  $GameConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$$GameClientInfoConnectedCopyWithImpl<$Res>
    extends _$GameClientInfoCopyWithImpl<$Res>
    implements _$$GameClientInfoConnectedCopyWith<$Res> {
  __$$GameClientInfoConnectedCopyWithImpl(_$GameClientInfoConnected _value,
      $Res Function(_$GameClientInfoConnected) _then)
      : super(_value, (v) => _then(v as _$GameClientInfoConnected));

  @override
  _$GameClientInfoConnected get _value =>
      super._value as _$GameClientInfoConnected;

  @override
  $Res call({
    Object? service = freezed,
    Object? code = freezed,
    Object? playerName = freezed,
    Object? config = freezed,
    Object? games = freezed,
  }) {
    return _then(_$GameClientInfoConnected(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as GameService,
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

class _$GameClientInfoConnected implements GameClientInfoConnected {
  const _$GameClientInfoConnected(
      {required this.service,
      this.code,
      this.playerName,
      this.config,
      this.games});

  @override
  final GameService service;
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
    return 'GameClientInfo.connected(service: $service, code: $code, playerName: $playerName, config: $config, games: $games)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameClientInfoConnected &&
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
  _$$GameClientInfoConnectedCopyWith<_$GameClientInfoConnected> get copyWith =>
      __$$GameClientInfoConnectedCopyWithImpl<_$GameClientInfoConnected>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? code, String? playerName,
            GameConfig? config, IList<GameInfo>? games)
        connecting,
    required TResult Function(GameService service, String? code,
            String? playerName, GameConfig? config, IList<GameInfo>? games)
        connected,
  }) {
    return connected(service, code, playerName, config, games);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? code, String? playerName, GameConfig? config,
            IList<GameInfo>? games)?
        connecting,
    TResult Function(GameService service, String? code, String? playerName,
            GameConfig? config, IList<GameInfo>? games)?
        connected,
  }) {
    return connected?.call(service, code, playerName, config, games);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? code, String? playerName, GameConfig? config,
            IList<GameInfo>? games)?
        connecting,
    TResult Function(GameService service, String? code, String? playerName,
            GameConfig? config, IList<GameInfo>? games)?
        connected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(service, code, playerName, config, games);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameClientInfoConnecting value) connecting,
    required TResult Function(GameClientInfoConnected value) connected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GameClientInfoConnecting value)? connecting,
    TResult Function(GameClientInfoConnected value)? connected,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameClientInfoConnecting value)? connecting,
    TResult Function(GameClientInfoConnected value)? connected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class GameClientInfoConnected implements GameClientInfo {
  const factory GameClientInfoConnected(
      {required final GameService service,
      final String? code,
      final String? playerName,
      final GameConfig? config,
      final IList<GameInfo>? games}) = _$GameClientInfoConnected;

  GameService get service;
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
  _$$GameClientInfoConnectedCopyWith<_$GameClientInfoConnected> get copyWith =>
      throw _privateConstructorUsedError;
}
