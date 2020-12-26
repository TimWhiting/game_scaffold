// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GameConfig _$GameConfigFromJson(Map<String, dynamic> json) {
  return _GameConfig.fromJson(json);
}

/// @nodoc
class _$GameConfigTearOff {
  const _$GameConfigTearOff();

// ignore: unused_element
  _GameConfig call(
      {NameSet nameSet,
      bool customNames = false,
      String adminId,
      String gameType,
      int rounds = 15,
      Map<String, dynamic> options}) {
    return _GameConfig(
      nameSet: nameSet,
      customNames: customNames,
      adminId: adminId,
      gameType: gameType,
      rounds: rounds,
      options: options,
    );
  }

// ignore: unused_element
  GameConfig fromJson(Map<String, Object> json) {
    return GameConfig.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GameConfig = _$GameConfigTearOff();

/// @nodoc
mixin _$GameConfig {
  NameSet get nameSet;
  bool get customNames;
  String get adminId;
  String get gameType;
  int get rounds;

  /// [options must be json serializable]
  Map<String, dynamic> get options;

  Map<String, dynamic> toJson();
  $GameConfigCopyWith<GameConfig> get copyWith;
}

/// @nodoc
abstract class $GameConfigCopyWith<$Res> {
  factory $GameConfigCopyWith(
          GameConfig value, $Res Function(GameConfig) then) =
      _$GameConfigCopyWithImpl<$Res>;
  $Res call(
      {NameSet nameSet,
      bool customNames,
      String adminId,
      String gameType,
      int rounds,
      Map<String, dynamic> options});
}

/// @nodoc
class _$GameConfigCopyWithImpl<$Res> implements $GameConfigCopyWith<$Res> {
  _$GameConfigCopyWithImpl(this._value, this._then);

  final GameConfig _value;
  // ignore: unused_field
  final $Res Function(GameConfig) _then;

  @override
  $Res call({
    Object nameSet = freezed,
    Object customNames = freezed,
    Object adminId = freezed,
    Object gameType = freezed,
    Object rounds = freezed,
    Object options = freezed,
  }) {
    return _then(_value.copyWith(
      nameSet: nameSet == freezed ? _value.nameSet : nameSet as NameSet,
      customNames:
          customNames == freezed ? _value.customNames : customNames as bool,
      adminId: adminId == freezed ? _value.adminId : adminId as String,
      gameType: gameType == freezed ? _value.gameType : gameType as String,
      rounds: rounds == freezed ? _value.rounds : rounds as int,
      options:
          options == freezed ? _value.options : options as Map<String, dynamic>,
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
      {NameSet nameSet,
      bool customNames,
      String adminId,
      String gameType,
      int rounds,
      Map<String, dynamic> options});
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
    Object nameSet = freezed,
    Object customNames = freezed,
    Object adminId = freezed,
    Object gameType = freezed,
    Object rounds = freezed,
    Object options = freezed,
  }) {
    return _then(_GameConfig(
      nameSet: nameSet == freezed ? _value.nameSet : nameSet as NameSet,
      customNames:
          customNames == freezed ? _value.customNames : customNames as bool,
      adminId: adminId == freezed ? _value.adminId : adminId as String,
      gameType: gameType == freezed ? _value.gameType : gameType as String,
      rounds: rounds == freezed ? _value.rounds : rounds as int,
      options:
          options == freezed ? _value.options : options as Map<String, dynamic>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GameConfig implements _GameConfig {
  const _$_GameConfig(
      {this.nameSet,
      this.customNames = false,
      this.adminId,
      this.gameType,
      this.rounds = 15,
      this.options})
      : assert(customNames != null),
        assert(rounds != null);

  factory _$_GameConfig.fromJson(Map<String, dynamic> json) =>
      _$_$_GameConfigFromJson(json);

  @override
  final NameSet nameSet;
  @JsonKey(defaultValue: false)
  @override
  final bool customNames;
  @override
  final String adminId;
  @override
  final String gameType;
  @JsonKey(defaultValue: 15)
  @override
  final int rounds;
  @override

  /// [options must be json serializable]
  final Map<String, dynamic> options;

  @override
  String toString() {
    return 'GameConfig(nameSet: $nameSet, customNames: $customNames, adminId: $adminId, gameType: $gameType, rounds: $rounds, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameConfig &&
            (identical(other.nameSet, nameSet) ||
                const DeepCollectionEquality()
                    .equals(other.nameSet, nameSet)) &&
            (identical(other.customNames, customNames) ||
                const DeepCollectionEquality()
                    .equals(other.customNames, customNames)) &&
            (identical(other.adminId, adminId) ||
                const DeepCollectionEquality()
                    .equals(other.adminId, adminId)) &&
            (identical(other.gameType, gameType) ||
                const DeepCollectionEquality()
                    .equals(other.gameType, gameType)) &&
            (identical(other.rounds, rounds) ||
                const DeepCollectionEquality().equals(other.rounds, rounds)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nameSet) ^
      const DeepCollectionEquality().hash(customNames) ^
      const DeepCollectionEquality().hash(adminId) ^
      const DeepCollectionEquality().hash(gameType) ^
      const DeepCollectionEquality().hash(rounds) ^
      const DeepCollectionEquality().hash(options);

  @override
  _$GameConfigCopyWith<_GameConfig> get copyWith =>
      __$GameConfigCopyWithImpl<_GameConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GameConfigToJson(this);
  }
}

abstract class _GameConfig implements GameConfig {
  const factory _GameConfig(
      {NameSet nameSet,
      bool customNames,
      String adminId,
      String gameType,
      int rounds,
      Map<String, dynamic> options}) = _$_GameConfig;

  factory _GameConfig.fromJson(Map<String, dynamic> json) =
      _$_GameConfig.fromJson;

  @override
  NameSet get nameSet;
  @override
  bool get customNames;
  @override
  String get adminId;
  @override
  String get gameType;
  @override
  int get rounds;
  @override

  /// [options must be json serializable]
  Map<String, dynamic> get options;
  @override
  _$GameConfigCopyWith<_GameConfig> get copyWith;
}

GameInfo _$GameInfoFromJson(Map<String, dynamic> json) {
  return _GameInfo.fromJson(json);
}

/// @nodoc
class _$GameInfoTearOff {
  const _$GameInfoTearOff();

// ignore: unused_element
  _GameInfo call(String gameId, List<String> players, String player,
      bool creator, String gameType) {
    return _GameInfo(
      gameId,
      players,
      player,
      creator,
      gameType,
    );
  }

// ignore: unused_element
  GameInfo fromJson(Map<String, Object> json) {
    return GameInfo.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GameInfo = _$GameInfoTearOff();

/// @nodoc
mixin _$GameInfo {
  String get gameId;
  List<String> get players;
  String get player;
  bool get creator;
  String get gameType;

  Map<String, dynamic> toJson();
  $GameInfoCopyWith<GameInfo> get copyWith;
}

/// @nodoc
abstract class $GameInfoCopyWith<$Res> {
  factory $GameInfoCopyWith(GameInfo value, $Res Function(GameInfo) then) =
      _$GameInfoCopyWithImpl<$Res>;
  $Res call(
      {String gameId,
      List<String> players,
      String player,
      bool creator,
      String gameType});
}

/// @nodoc
class _$GameInfoCopyWithImpl<$Res> implements $GameInfoCopyWith<$Res> {
  _$GameInfoCopyWithImpl(this._value, this._then);

  final GameInfo _value;
  // ignore: unused_field
  final $Res Function(GameInfo) _then;

  @override
  $Res call({
    Object gameId = freezed,
    Object players = freezed,
    Object player = freezed,
    Object creator = freezed,
    Object gameType = freezed,
  }) {
    return _then(_value.copyWith(
      gameId: gameId == freezed ? _value.gameId : gameId as String,
      players: players == freezed ? _value.players : players as List<String>,
      player: player == freezed ? _value.player : player as String,
      creator: creator == freezed ? _value.creator : creator as bool,
      gameType: gameType == freezed ? _value.gameType : gameType as String,
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
      List<String> players,
      String player,
      bool creator,
      String gameType});
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
    Object gameId = freezed,
    Object players = freezed,
    Object player = freezed,
    Object creator = freezed,
    Object gameType = freezed,
  }) {
    return _then(_GameInfo(
      gameId == freezed ? _value.gameId : gameId as String,
      players == freezed ? _value.players : players as List<String>,
      player == freezed ? _value.player : player as String,
      creator == freezed ? _value.creator : creator as bool,
      gameType == freezed ? _value.gameType : gameType as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GameInfo implements _GameInfo {
  const _$_GameInfo(
      this.gameId, this.players, this.player, this.creator, this.gameType)
      : assert(gameId != null),
        assert(players != null),
        assert(player != null),
        assert(creator != null),
        assert(gameType != null);

  factory _$_GameInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_GameInfoFromJson(json);

  @override
  final String gameId;
  @override
  final List<String> players;
  @override
  final String player;
  @override
  final bool creator;
  @override
  final String gameType;

  @override
  String toString() {
    return 'GameInfo(gameId: $gameId, players: $players, player: $player, creator: $creator, gameType: $gameType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameInfo &&
            (identical(other.gameId, gameId) ||
                const DeepCollectionEquality().equals(other.gameId, gameId)) &&
            (identical(other.players, players) ||
                const DeepCollectionEquality()
                    .equals(other.players, players)) &&
            (identical(other.player, player) ||
                const DeepCollectionEquality().equals(other.player, player)) &&
            (identical(other.creator, creator) ||
                const DeepCollectionEquality()
                    .equals(other.creator, creator)) &&
            (identical(other.gameType, gameType) ||
                const DeepCollectionEquality()
                    .equals(other.gameType, gameType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gameId) ^
      const DeepCollectionEquality().hash(players) ^
      const DeepCollectionEquality().hash(player) ^
      const DeepCollectionEquality().hash(creator) ^
      const DeepCollectionEquality().hash(gameType);

  @override
  _$GameInfoCopyWith<_GameInfo> get copyWith =>
      __$GameInfoCopyWithImpl<_GameInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GameInfoToJson(this);
  }
}

abstract class _GameInfo implements GameInfo {
  const factory _GameInfo(String gameId, List<String> players, String player,
      bool creator, String gameType) = _$_GameInfo;

  factory _GameInfo.fromJson(Map<String, dynamic> json) = _$_GameInfo.fromJson;

  @override
  String get gameId;
  @override
  List<String> get players;
  @override
  String get player;
  @override
  bool get creator;
  @override
  String get gameType;
  @override
  _$GameInfoCopyWith<_GameInfo> get copyWith;
}
