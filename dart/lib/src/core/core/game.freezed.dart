// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameConfig _$GameConfigFromJson(Map<String, dynamic> json) {
  return _GameConfig.fromJson(json);
}

/// @nodoc
mixin _$GameConfig {
  String get gameType => throw _privateConstructorUsedError;
  String? get adminID => throw _privateConstructorUsedError;
  NameSet get nameSet => throw _privateConstructorUsedError;
  bool get customNames => throw _privateConstructorUsedError;
  int get rounds => throw _privateConstructorUsedError;
  int get minPlayers => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  bool get autoStart => throw _privateConstructorUsedError;

  /// [options] must be json serializable
  Map<String, dynamic>? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameConfigCopyWith<GameConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameConfigCopyWith<$Res> {
  factory $GameConfigCopyWith(
          GameConfig value, $Res Function(GameConfig) then) =
      _$GameConfigCopyWithImpl<$Res>;
  $Res call(
      {String gameType,
      String? adminID,
      NameSet nameSet,
      bool customNames,
      int rounds,
      int minPlayers,
      int maxPlayers,
      bool autoStart,
      Map<String, dynamic>? options});
}

/// @nodoc
class _$GameConfigCopyWithImpl<$Res> implements $GameConfigCopyWith<$Res> {
  _$GameConfigCopyWithImpl(this._value, this._then);

  final GameConfig _value;
  // ignore: unused_field
  final $Res Function(GameConfig) _then;

  @override
  $Res call({
    Object? gameType = freezed,
    Object? adminID = freezed,
    Object? nameSet = freezed,
    Object? customNames = freezed,
    Object? rounds = freezed,
    Object? minPlayers = freezed,
    Object? maxPlayers = freezed,
    Object? autoStart = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      gameType: gameType == freezed
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      adminID: adminID == freezed
          ? _value.adminID
          : adminID // ignore: cast_nullable_to_non_nullable
              as String?,
      nameSet: nameSet == freezed
          ? _value.nameSet
          : nameSet // ignore: cast_nullable_to_non_nullable
              as NameSet,
      customNames: customNames == freezed
          ? _value.customNames
          : customNames // ignore: cast_nullable_to_non_nullable
              as bool,
      rounds: rounds == freezed
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      minPlayers: minPlayers == freezed
          ? _value.minPlayers
          : minPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: maxPlayers == freezed
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      autoStart: autoStart == freezed
          ? _value.autoStart
          : autoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$$_GameConfigCopyWith<$Res>
    implements $GameConfigCopyWith<$Res> {
  factory _$$_GameConfigCopyWith(
          _$_GameConfig value, $Res Function(_$_GameConfig) then) =
      __$$_GameConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {String gameType,
      String? adminID,
      NameSet nameSet,
      bool customNames,
      int rounds,
      int minPlayers,
      int maxPlayers,
      bool autoStart,
      Map<String, dynamic>? options});
}

/// @nodoc
class __$$_GameConfigCopyWithImpl<$Res> extends _$GameConfigCopyWithImpl<$Res>
    implements _$$_GameConfigCopyWith<$Res> {
  __$$_GameConfigCopyWithImpl(
      _$_GameConfig _value, $Res Function(_$_GameConfig) _then)
      : super(_value, (v) => _then(v as _$_GameConfig));

  @override
  _$_GameConfig get _value => super._value as _$_GameConfig;

  @override
  $Res call({
    Object? gameType = freezed,
    Object? adminID = freezed,
    Object? nameSet = freezed,
    Object? customNames = freezed,
    Object? rounds = freezed,
    Object? minPlayers = freezed,
    Object? maxPlayers = freezed,
    Object? autoStart = freezed,
    Object? options = freezed,
  }) {
    return _then(_$_GameConfig(
      gameType: gameType == freezed
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      adminID: adminID == freezed
          ? _value.adminID
          : adminID // ignore: cast_nullable_to_non_nullable
              as String?,
      nameSet: nameSet == freezed
          ? _value.nameSet
          : nameSet // ignore: cast_nullable_to_non_nullable
              as NameSet,
      customNames: customNames == freezed
          ? _value.customNames
          : customNames // ignore: cast_nullable_to_non_nullable
              as bool,
      rounds: rounds == freezed
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      minPlayers: minPlayers == freezed
          ? _value.minPlayers
          : minPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: maxPlayers == freezed
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      autoStart: autoStart == freezed
          ? _value.autoStart
          : autoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      options: options == freezed
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameConfig implements _GameConfig {
  const _$_GameConfig(
      {required this.gameType,
      this.adminID,
      this.nameSet = NameSet.Basic,
      this.customNames = false,
      this.rounds = 15,
      this.minPlayers = 1,
      this.maxPlayers = 10,
      this.autoStart = true,
      final Map<String, dynamic>? options})
      : _options = options;

  factory _$_GameConfig.fromJson(Map<String, dynamic> json) =>
      _$$_GameConfigFromJson(json);

  @override
  final String gameType;
  @override
  final String? adminID;
  @override
  @JsonKey()
  final NameSet nameSet;
  @override
  @JsonKey()
  final bool customNames;
  @override
  @JsonKey()
  final int rounds;
  @override
  @JsonKey()
  final int minPlayers;
  @override
  @JsonKey()
  final int maxPlayers;
  @override
  @JsonKey()
  final bool autoStart;

  /// [options] must be json serializable
  final Map<String, dynamic>? _options;

  /// [options] must be json serializable
  @override
  Map<String, dynamic>? get options {
    final value = _options;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GameConfig(gameType: $gameType, adminID: $adminID, nameSet: $nameSet, customNames: $customNames, rounds: $rounds, minPlayers: $minPlayers, maxPlayers: $maxPlayers, autoStart: $autoStart, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameConfig &&
            const DeepCollectionEquality().equals(other.gameType, gameType) &&
            const DeepCollectionEquality().equals(other.adminID, adminID) &&
            const DeepCollectionEquality().equals(other.nameSet, nameSet) &&
            const DeepCollectionEquality()
                .equals(other.customNames, customNames) &&
            const DeepCollectionEquality().equals(other.rounds, rounds) &&
            const DeepCollectionEquality()
                .equals(other.minPlayers, minPlayers) &&
            const DeepCollectionEquality()
                .equals(other.maxPlayers, maxPlayers) &&
            const DeepCollectionEquality().equals(other.autoStart, autoStart) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gameType),
      const DeepCollectionEquality().hash(adminID),
      const DeepCollectionEquality().hash(nameSet),
      const DeepCollectionEquality().hash(customNames),
      const DeepCollectionEquality().hash(rounds),
      const DeepCollectionEquality().hash(minPlayers),
      const DeepCollectionEquality().hash(maxPlayers),
      const DeepCollectionEquality().hash(autoStart),
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  _$$_GameConfigCopyWith<_$_GameConfig> get copyWith =>
      __$$_GameConfigCopyWithImpl<_$_GameConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameConfigToJson(
      this,
    );
  }
}

abstract class _GameConfig implements GameConfig {
  const factory _GameConfig(
      {required final String gameType,
      final String? adminID,
      final NameSet nameSet,
      final bool customNames,
      final int rounds,
      final int minPlayers,
      final int maxPlayers,
      final bool autoStart,
      final Map<String, dynamic>? options}) = _$_GameConfig;

  factory _GameConfig.fromJson(Map<String, dynamic> json) =
      _$_GameConfig.fromJson;

  @override
  String get gameType;
  @override
  String? get adminID;
  @override
  NameSet get nameSet;
  @override
  bool get customNames;
  @override
  int get rounds;
  @override
  int get minPlayers;
  @override
  int get maxPlayers;
  @override
  bool get autoStart;
  @override

  /// [options] must be json serializable
  Map<String, dynamic>? get options;
  @override
  @JsonKey(ignore: true)
  _$$_GameConfigCopyWith<_$_GameConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

GameInfo _$GameInfoFromJson(Map<String, dynamic> json) {
  return _GameInfo.fromJson(json);
}

/// @nodoc
mixin _$GameInfo {
  String get gameID => throw _privateConstructorUsedError;
  IList<String> get players => throw _privateConstructorUsedError;
  String get player => throw _privateConstructorUsedError;
  bool get creator => throw _privateConstructorUsedError;
  String get gameType => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameInfoCopyWith<GameInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameInfoCopyWith<$Res> {
  factory $GameInfoCopyWith(GameInfo value, $Res Function(GameInfo) then) =
      _$GameInfoCopyWithImpl<$Res>;
  $Res call(
      {String gameID,
      IList<String> players,
      String player,
      bool creator,
      String gameType,
      GameStatus status});
}

/// @nodoc
class _$GameInfoCopyWithImpl<$Res> implements $GameInfoCopyWith<$Res> {
  _$GameInfoCopyWithImpl(this._value, this._then);

  final GameInfo _value;
  // ignore: unused_field
  final $Res Function(GameInfo) _then;

  @override
  $Res call({
    Object? gameID = freezed,
    Object? players = freezed,
    Object? player = freezed,
    Object? creator = freezed,
    Object? gameType = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      gameID: gameID == freezed
          ? _value.gameID
          : gameID // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as bool,
      gameType: gameType == freezed
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_GameInfoCopyWith<$Res> implements $GameInfoCopyWith<$Res> {
  factory _$$_GameInfoCopyWith(
          _$_GameInfo value, $Res Function(_$_GameInfo) then) =
      __$$_GameInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String gameID,
      IList<String> players,
      String player,
      bool creator,
      String gameType,
      GameStatus status});
}

/// @nodoc
class __$$_GameInfoCopyWithImpl<$Res> extends _$GameInfoCopyWithImpl<$Res>
    implements _$$_GameInfoCopyWith<$Res> {
  __$$_GameInfoCopyWithImpl(
      _$_GameInfo _value, $Res Function(_$_GameInfo) _then)
      : super(_value, (v) => _then(v as _$_GameInfo));

  @override
  _$_GameInfo get _value => super._value as _$_GameInfo;

  @override
  $Res call({
    Object? gameID = freezed,
    Object? players = freezed,
    Object? player = freezed,
    Object? creator = freezed,
    Object? gameType = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_GameInfo(
      gameID: gameID == freezed
          ? _value.gameID
          : gameID // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as bool,
      gameType: gameType == freezed
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameInfo implements _GameInfo {
  const _$_GameInfo(
      {required this.gameID,
      required this.players,
      required this.player,
      required this.creator,
      required this.gameType,
      required this.status});

  factory _$_GameInfo.fromJson(Map<String, dynamic> json) =>
      _$$_GameInfoFromJson(json);

  @override
  final String gameID;
  @override
  final IList<String> players;
  @override
  final String player;
  @override
  final bool creator;
  @override
  final String gameType;
  @override
  final GameStatus status;

  @override
  String toString() {
    return 'GameInfo(gameID: $gameID, players: $players, player: $player, creator: $creator, gameType: $gameType, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameInfo &&
            const DeepCollectionEquality().equals(other.gameID, gameID) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            const DeepCollectionEquality().equals(other.gameType, gameType) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gameID),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(gameType),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_GameInfoCopyWith<_$_GameInfo> get copyWith =>
      __$$_GameInfoCopyWithImpl<_$_GameInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameInfoToJson(
      this,
    );
  }
}

abstract class _GameInfo implements GameInfo {
  const factory _GameInfo(
      {required final String gameID,
      required final IList<String> players,
      required final String player,
      required final bool creator,
      required final String gameType,
      required final GameStatus status}) = _$_GameInfo;

  factory _GameInfo.fromJson(Map<String, dynamic> json) = _$_GameInfo.fromJson;

  @override
  String get gameID;
  @override
  IList<String> get players;
  @override
  String get player;
  @override
  bool get creator;
  @override
  String get gameType;
  @override
  GameStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_GameInfoCopyWith<_$_GameInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Lobby _$LobbyFromJson(Map<String, dynamic> json) {
  return _Lobby.fromJson(json);
}

/// @nodoc
mixin _$Lobby {
  String get code => throw _privateConstructorUsedError;
  ISet<Player> get players => throw _privateConstructorUsedError;
  GameConfig get config => throw _privateConstructorUsedError;
  GameStatus get gameStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LobbyCopyWith<Lobby> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LobbyCopyWith<$Res> {
  factory $LobbyCopyWith(Lobby value, $Res Function(Lobby) then) =
      _$LobbyCopyWithImpl<$Res>;
  $Res call(
      {String code,
      ISet<Player> players,
      GameConfig config,
      GameStatus gameStatus});

  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$LobbyCopyWithImpl<$Res> implements $LobbyCopyWith<$Res> {
  _$LobbyCopyWithImpl(this._value, this._then);

  final Lobby _value;
  // ignore: unused_field
  final $Res Function(Lobby) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? players = freezed,
    Object? config = freezed,
    Object? gameStatus = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as ISet<Player>,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      gameStatus: gameStatus == freezed
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }

  @override
  $GameConfigCopyWith<$Res> get config {
    return $GameConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc
abstract class _$$_LobbyCopyWith<$Res> implements $LobbyCopyWith<$Res> {
  factory _$$_LobbyCopyWith(_$_Lobby value, $Res Function(_$_Lobby) then) =
      __$$_LobbyCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      ISet<Player> players,
      GameConfig config,
      GameStatus gameStatus});

  @override
  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$_LobbyCopyWithImpl<$Res> extends _$LobbyCopyWithImpl<$Res>
    implements _$$_LobbyCopyWith<$Res> {
  __$$_LobbyCopyWithImpl(_$_Lobby _value, $Res Function(_$_Lobby) _then)
      : super(_value, (v) => _then(v as _$_Lobby));

  @override
  _$_Lobby get _value => super._value as _$_Lobby;

  @override
  $Res call({
    Object? code = freezed,
    Object? players = freezed,
    Object? config = freezed,
    Object? gameStatus = freezed,
  }) {
    return _then(_$_Lobby(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as ISet<Player>,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      gameStatus: gameStatus == freezed
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lobby implements _Lobby {
  const _$_Lobby(
      {required this.code,
      required this.players,
      required this.config,
      required this.gameStatus});

  factory _$_Lobby.fromJson(Map<String, dynamic> json) =>
      _$$_LobbyFromJson(json);

  @override
  final String code;
  @override
  final ISet<Player> players;
  @override
  final GameConfig config;
  @override
  final GameStatus gameStatus;

  @override
  String toString() {
    return 'Lobby(code: $code, players: $players, config: $config, gameStatus: $gameStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Lobby &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.config, config) &&
            const DeepCollectionEquality()
                .equals(other.gameStatus, gameStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(config),
      const DeepCollectionEquality().hash(gameStatus));

  @JsonKey(ignore: true)
  @override
  _$$_LobbyCopyWith<_$_Lobby> get copyWith =>
      __$$_LobbyCopyWithImpl<_$_Lobby>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LobbyToJson(
      this,
    );
  }
}

abstract class _Lobby implements Lobby {
  const factory _Lobby(
      {required final String code,
      required final ISet<Player> players,
      required final GameConfig config,
      required final GameStatus gameStatus}) = _$_Lobby;

  factory _Lobby.fromJson(Map<String, dynamic> json) = _$_Lobby.fromJson;

  @override
  String get code;
  @override
  ISet<Player> get players;
  @override
  GameConfig get config;
  @override
  GameStatus get gameStatus;
  @override
  @JsonKey(ignore: true)
  _$$_LobbyCopyWith<_$_Lobby> get copyWith =>
      throw _privateConstructorUsedError;
}
