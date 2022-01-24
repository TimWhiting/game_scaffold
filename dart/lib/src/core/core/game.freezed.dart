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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameConfig _$GameConfigFromJson(Map<String, dynamic> json) {
  return _GameConfig.fromJson(json);
}

/// @nodoc
class _$GameConfigTearOff {
  const _$GameConfigTearOff();

  _GameConfig call(
      {required String gameType,
      String? adminID,
      NameSet nameSet = NameSet.Basic,
      bool customNames = false,
      int rounds = 15,
      int minPlayers = 1,
      int maxPlayers = 10,
      bool autoStart = true,
      Map<String, dynamic>? options}) {
    return _GameConfig(
      gameType: gameType,
      adminID: adminID,
      nameSet: nameSet,
      customNames: customNames,
      rounds: rounds,
      minPlayers: minPlayers,
      maxPlayers: maxPlayers,
      autoStart: autoStart,
      options: options,
    );
  }

  GameConfig fromJson(Map<String, Object?> json) {
    return GameConfig.fromJson(json);
  }
}

/// @nodoc
const $GameConfig = _$GameConfigTearOff();

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
abstract class _$GameConfigCopyWith<$Res> implements $GameConfigCopyWith<$Res> {
  factory _$GameConfigCopyWith(
          _GameConfig value, $Res Function(_GameConfig) then) =
      __$GameConfigCopyWithImpl<$Res>;
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
class __$GameConfigCopyWithImpl<$Res> extends _$GameConfigCopyWithImpl<$Res>
    implements _$GameConfigCopyWith<$Res> {
  __$GameConfigCopyWithImpl(
      _GameConfig _value, $Res Function(_GameConfig) _then)
      : super(_value, (v) => _then(v as _GameConfig));

  @override
  _GameConfig get _value => super._value as _GameConfig;

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
    return _then(_GameConfig(
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
      this.options});

  factory _$_GameConfig.fromJson(Map<String, dynamic> json) =>
      _$$_GameConfigFromJson(json);

  @override
  final String gameType;
  @override
  final String? adminID;
  @JsonKey()
  @override
  final NameSet nameSet;
  @JsonKey()
  @override
  final bool customNames;
  @JsonKey()
  @override
  final int rounds;
  @JsonKey()
  @override
  final int minPlayers;
  @JsonKey()
  @override
  final int maxPlayers;
  @JsonKey()
  @override
  final bool autoStart;
  @override

  /// [options] must be json serializable
  final Map<String, dynamic>? options;

  @override
  String toString() {
    return 'GameConfig(gameType: $gameType, adminID: $adminID, nameSet: $nameSet, customNames: $customNames, rounds: $rounds, minPlayers: $minPlayers, maxPlayers: $maxPlayers, autoStart: $autoStart, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameConfig &&
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
            const DeepCollectionEquality().equals(other.options, options));
  }

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
      const DeepCollectionEquality().hash(options));

  @JsonKey(ignore: true)
  @override
  _$GameConfigCopyWith<_GameConfig> get copyWith =>
      __$GameConfigCopyWithImpl<_GameConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameConfigToJson(this);
  }
}

abstract class _GameConfig implements GameConfig {
  const factory _GameConfig(
      {required String gameType,
      String? adminID,
      NameSet nameSet,
      bool customNames,
      int rounds,
      int minPlayers,
      int maxPlayers,
      bool autoStart,
      Map<String, dynamic>? options}) = _$_GameConfig;

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
  _$GameConfigCopyWith<_GameConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

GameInfo _$GameInfoFromJson(Map<String, dynamic> json) {
  return _GameInfo.fromJson(json);
}

/// @nodoc
class _$GameInfoTearOff {
  const _$GameInfoTearOff();

  _GameInfo call(
      {required String gameId,
      required IList<String> players,
      required String player,
      required bool creator,
      required String gameType,
      required GameStatus status}) {
    return _GameInfo(
      gameId: gameId,
      players: players,
      player: player,
      creator: creator,
      gameType: gameType,
      status: status,
    );
  }

  GameInfo fromJson(Map<String, Object?> json) {
    return GameInfo.fromJson(json);
  }
}

/// @nodoc
const $GameInfo = _$GameInfoTearOff();

/// @nodoc
mixin _$GameInfo {
  String get gameId => throw _privateConstructorUsedError;
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
      {String gameId,
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
    Object? gameId = freezed,
    Object? players = freezed,
    Object? player = freezed,
    Object? creator = freezed,
    Object? gameType = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      gameId: gameId == freezed
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
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
abstract class _$GameInfoCopyWith<$Res> implements $GameInfoCopyWith<$Res> {
  factory _$GameInfoCopyWith(_GameInfo value, $Res Function(_GameInfo) then) =
      __$GameInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String gameId,
      IList<String> players,
      String player,
      bool creator,
      String gameType,
      GameStatus status});
}

/// @nodoc
class __$GameInfoCopyWithImpl<$Res> extends _$GameInfoCopyWithImpl<$Res>
    implements _$GameInfoCopyWith<$Res> {
  __$GameInfoCopyWithImpl(_GameInfo _value, $Res Function(_GameInfo) _then)
      : super(_value, (v) => _then(v as _GameInfo));

  @override
  _GameInfo get _value => super._value as _GameInfo;

  @override
  $Res call({
    Object? gameId = freezed,
    Object? players = freezed,
    Object? player = freezed,
    Object? creator = freezed,
    Object? gameType = freezed,
    Object? status = freezed,
  }) {
    return _then(_GameInfo(
      gameId: gameId == freezed
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
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
      {required this.gameId,
      required this.players,
      required this.player,
      required this.creator,
      required this.gameType,
      required this.status});

  factory _$_GameInfo.fromJson(Map<String, dynamic> json) =>
      _$$_GameInfoFromJson(json);

  @override
  final String gameId;
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
    return 'GameInfo(gameId: $gameId, players: $players, player: $player, creator: $creator, gameType: $gameType, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameInfo &&
            const DeepCollectionEquality().equals(other.gameId, gameId) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            const DeepCollectionEquality().equals(other.gameType, gameType) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gameId),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(gameType),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$GameInfoCopyWith<_GameInfo> get copyWith =>
      __$GameInfoCopyWithImpl<_GameInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameInfoToJson(this);
  }
}

abstract class _GameInfo implements GameInfo {
  const factory _GameInfo(
      {required String gameId,
      required IList<String> players,
      required String player,
      required bool creator,
      required String gameType,
      required GameStatus status}) = _$_GameInfo;

  factory _GameInfo.fromJson(Map<String, dynamic> json) = _$_GameInfo.fromJson;

  @override
  String get gameId;
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
  _$GameInfoCopyWith<_GameInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Lobby _$LobbyFromJson(Map<String, dynamic> json) {
  return _Lobby.fromJson(json);
}

/// @nodoc
class _$LobbyTearOff {
  const _$LobbyTearOff();

  _Lobby call(
      {required String code,
      required ISet<Player> players,
      required GameConfig config,
      required GameStatus gameStatus}) {
    return _Lobby(
      code: code,
      players: players,
      config: config,
      gameStatus: gameStatus,
    );
  }

  Lobby fromJson(Map<String, Object?> json) {
    return Lobby.fromJson(json);
  }
}

/// @nodoc
const $Lobby = _$LobbyTearOff();

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
abstract class _$LobbyCopyWith<$Res> implements $LobbyCopyWith<$Res> {
  factory _$LobbyCopyWith(_Lobby value, $Res Function(_Lobby) then) =
      __$LobbyCopyWithImpl<$Res>;
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
class __$LobbyCopyWithImpl<$Res> extends _$LobbyCopyWithImpl<$Res>
    implements _$LobbyCopyWith<$Res> {
  __$LobbyCopyWithImpl(_Lobby _value, $Res Function(_Lobby) _then)
      : super(_value, (v) => _then(v as _Lobby));

  @override
  _Lobby get _value => super._value as _Lobby;

  @override
  $Res call({
    Object? code = freezed,
    Object? players = freezed,
    Object? config = freezed,
    Object? gameStatus = freezed,
  }) {
    return _then(_Lobby(
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
            other is _Lobby &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.config, config) &&
            const DeepCollectionEquality()
                .equals(other.gameStatus, gameStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(config),
      const DeepCollectionEquality().hash(gameStatus));

  @JsonKey(ignore: true)
  @override
  _$LobbyCopyWith<_Lobby> get copyWith =>
      __$LobbyCopyWithImpl<_Lobby>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LobbyToJson(this);
  }
}

abstract class _Lobby implements Lobby {
  const factory _Lobby(
      {required String code,
      required ISet<Player> players,
      required GameConfig config,
      required GameStatus gameStatus}) = _$_Lobby;

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
  _$LobbyCopyWith<_Lobby> get copyWith => throw _privateConstructorUsedError;
}
