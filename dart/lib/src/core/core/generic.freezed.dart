// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenericGame {
  DateTime get time;
  GameStatus get status;
  int get round;
  IList<Player> get players;
  IList<PlayerID> get readyPlayers;

  /// Create a copy of GenericGame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenericGameCopyWith<GenericGame> get copyWith =>
      _$GenericGameCopyWithImpl<GenericGame>(this as GenericGame, _$identity);

  /// Serializes this GenericGame to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenericGame &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.round, round) || other.round == round) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality()
                .equals(other.readyPlayers, readyPlayers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      status,
      round,
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(readyPlayers));

  @override
  String toString() {
    return 'GenericGame(time: $time, status: $status, round: $round, players: $players, readyPlayers: $readyPlayers)';
  }
}

/// @nodoc
abstract mixin class $GenericGameCopyWith<$Res> {
  factory $GenericGameCopyWith(
          GenericGame value, $Res Function(GenericGame) _then) =
      _$GenericGameCopyWithImpl;
  @useResult
  $Res call(
      {DateTime time,
      GameStatus status,
      int round,
      IList<Player> players,
      IList<String> readyPlayers});
}

/// @nodoc
class _$GenericGameCopyWithImpl<$Res> implements $GenericGameCopyWith<$Res> {
  _$GenericGameCopyWithImpl(this._self, this._then);

  final GenericGame _self;
  final $Res Function(GenericGame) _then;

  /// Create a copy of GenericGame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? status = null,
    Object? round = null,
    Object? players = null,
    Object? readyPlayers = null,
  }) {
    return _then(_self.copyWith(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      round: null == round
          ? _self.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _self.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<Player>,
      readyPlayers: null == readyPlayers
          ? _self.readyPlayers!
          : readyPlayers // ignore: cast_nullable_to_non_nullable
              as IList<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GenericGame extends GenericGame {
  const _GenericGame(
      {required this.time,
      required this.status,
      required this.round,
      this.players = const IListConst([]),
      this.readyPlayers = const IListConst([])})
      : super._();
  factory _GenericGame.fromJson(Map<String, dynamic> json) =>
      _$GenericGameFromJson(json);

  @override
  final DateTime time;
  @override
  final GameStatus status;
  @override
  final int round;
  @override
  @JsonKey()
  final IList<Player> players;
  @override
  @JsonKey()
  final IList<String> readyPlayers;

  /// Create a copy of GenericGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenericGameCopyWith<_GenericGame> get copyWith =>
      __$GenericGameCopyWithImpl<_GenericGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenericGameToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenericGame &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.round, round) || other.round == round) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality()
                .equals(other.readyPlayers, readyPlayers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      status,
      round,
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(readyPlayers));

  @override
  String toString() {
    return 'GenericGame(time: $time, status: $status, round: $round, players: $players, readyPlayers: $readyPlayers)';
  }
}

/// @nodoc
abstract mixin class _$GenericGameCopyWith<$Res>
    implements $GenericGameCopyWith<$Res> {
  factory _$GenericGameCopyWith(
          _GenericGame value, $Res Function(_GenericGame) _then) =
      __$GenericGameCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime time,
      GameStatus status,
      int round,
      IList<Player> players,
      IList<String> readyPlayers});
}

/// @nodoc
class __$GenericGameCopyWithImpl<$Res> implements _$GenericGameCopyWith<$Res> {
  __$GenericGameCopyWithImpl(this._self, this._then);

  final _GenericGame _self;
  final $Res Function(_GenericGame) _then;

  /// Create a copy of GenericGame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? time = null,
    Object? status = null,
    Object? round = null,
    Object? players = null,
    Object? readyPlayers = null,
  }) {
    return _then(_GenericGame(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      round: null == round
          ? _self.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _self.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<Player>,
      readyPlayers: null == readyPlayers
          ? _self.readyPlayers
          : readyPlayers // ignore: cast_nullable_to_non_nullable
              as IList<String>,
    ));
  }
}

GenericEvent _$GenericEventFromJson(Map<String, dynamic> json) {
  return ReadyNextRound.fromJson(json);
}

/// @nodoc
mixin _$GenericEvent {
  String get player;
  String get type;

  /// Create a copy of GenericEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenericEventCopyWith<GenericEvent> get copyWith =>
      _$GenericEventCopyWithImpl<GenericEvent>(
          this as GenericEvent, _$identity);

  /// Serializes this GenericEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenericEvent &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, player, type);

  @override
  String toString() {
    return 'GenericEvent(player: $player, type: $type)';
  }
}

/// @nodoc
abstract mixin class $GenericEventCopyWith<$Res> {
  factory $GenericEventCopyWith(
          GenericEvent value, $Res Function(GenericEvent) _then) =
      _$GenericEventCopyWithImpl;
  @useResult
  $Res call({String player, String type});
}

/// @nodoc
class _$GenericEventCopyWithImpl<$Res> implements $GenericEventCopyWith<$Res> {
  _$GenericEventCopyWithImpl(this._self, this._then);

  final GenericEvent _self;
  final $Res Function(GenericEvent) _then;

  /// Create a copy of GenericEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      player: null == player
          ? _self.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ReadyNextRound extends GenericEvent {
  const ReadyNextRound(this.player, {this.type = 'generic'}) : super._();
  factory ReadyNextRound.fromJson(Map<String, dynamic> json) =>
      _$ReadyNextRoundFromJson(json);

  @override
  final String player;
  @override
  @JsonKey()
  final String type;

  /// Create a copy of GenericEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReadyNextRoundCopyWith<ReadyNextRound> get copyWith =>
      _$ReadyNextRoundCopyWithImpl<ReadyNextRound>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReadyNextRoundToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReadyNextRound &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, player, type);

  @override
  String toString() {
    return 'GenericEvent.readyNextRound(player: $player, type: $type)';
  }
}

/// @nodoc
abstract mixin class $ReadyNextRoundCopyWith<$Res>
    implements $GenericEventCopyWith<$Res> {
  factory $ReadyNextRoundCopyWith(
          ReadyNextRound value, $Res Function(ReadyNextRound) _then) =
      _$ReadyNextRoundCopyWithImpl;
  @override
  @useResult
  $Res call({String player, String type});
}

/// @nodoc
class _$ReadyNextRoundCopyWithImpl<$Res>
    implements $ReadyNextRoundCopyWith<$Res> {
  _$ReadyNextRoundCopyWithImpl(this._self, this._then);

  final ReadyNextRound _self;
  final $Res Function(ReadyNextRound) _then;

  /// Create a copy of GenericEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? player = null,
    Object? type = null,
  }) {
    return _then(ReadyNextRound(
      null == player
          ? _self.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$GameConfig {
  GameType get gameType;
  PlayerID? get adminID;
  NameSet get nameSet;
  bool get customNames;
  int get rounds;
  int get minPlayers;
  int get maxPlayers;
  bool get autoStart;
  Map<String, Object?> get options;

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameConfigCopyWith<GameConfig> get copyWith =>
      _$GameConfigCopyWithImpl<GameConfig>(this as GameConfig, _$identity);

  /// Serializes this GameConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameConfig &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            (identical(other.adminID, adminID) || other.adminID == adminID) &&
            (identical(other.nameSet, nameSet) || other.nameSet == nameSet) &&
            (identical(other.customNames, customNames) ||
                other.customNames == customNames) &&
            (identical(other.rounds, rounds) || other.rounds == rounds) &&
            (identical(other.minPlayers, minPlayers) ||
                other.minPlayers == minPlayers) &&
            (identical(other.maxPlayers, maxPlayers) ||
                other.maxPlayers == maxPlayers) &&
            (identical(other.autoStart, autoStart) ||
                other.autoStart == autoStart) &&
            const DeepCollectionEquality().equals(other.options, options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameType,
      adminID,
      nameSet,
      customNames,
      rounds,
      minPlayers,
      maxPlayers,
      autoStart,
      const DeepCollectionEquality().hash(options));

  @override
  String toString() {
    return 'GameConfig(gameType: $gameType, adminID: $adminID, nameSet: $nameSet, customNames: $customNames, rounds: $rounds, minPlayers: $minPlayers, maxPlayers: $maxPlayers, autoStart: $autoStart, options: $options)';
  }
}

/// @nodoc
abstract mixin class $GameConfigCopyWith<$Res> {
  factory $GameConfigCopyWith(
          GameConfig value, $Res Function(GameConfig) _then) =
      _$GameConfigCopyWithImpl;
  @useResult
  $Res call(
      {String gameType,
      String? adminID,
      NameSet nameSet,
      bool customNames,
      int rounds,
      int minPlayers,
      int maxPlayers,
      bool autoStart,
      Map<String, Object?> options});
}

/// @nodoc
class _$GameConfigCopyWithImpl<$Res> implements $GameConfigCopyWith<$Res> {
  _$GameConfigCopyWithImpl(this._self, this._then);

  final GameConfig _self;
  final $Res Function(GameConfig) _then;

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameType = null,
    Object? adminID = freezed,
    Object? nameSet = null,
    Object? customNames = null,
    Object? rounds = null,
    Object? minPlayers = null,
    Object? maxPlayers = null,
    Object? autoStart = null,
    Object? options = null,
  }) {
    return _then(_self.copyWith(
      gameType: null == gameType
          ? _self.gameType!
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      adminID: freezed == adminID
          ? _self.adminID!
          : adminID // ignore: cast_nullable_to_non_nullable
              as String?,
      nameSet: null == nameSet
          ? _self.nameSet
          : nameSet // ignore: cast_nullable_to_non_nullable
              as NameSet,
      customNames: null == customNames
          ? _self.customNames
          : customNames // ignore: cast_nullable_to_non_nullable
              as bool,
      rounds: null == rounds
          ? _self.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      minPlayers: null == minPlayers
          ? _self.minPlayers
          : minPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: null == maxPlayers
          ? _self.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      autoStart: null == autoStart
          ? _self.autoStart
          : autoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GameConfig extends GameConfig {
  const _GameConfig(
      {required this.gameType,
      this.adminID,
      this.nameSet = NameSet.basic,
      this.customNames = false,
      this.rounds = 15,
      this.minPlayers = 1,
      this.maxPlayers = 20,
      this.autoStart = true,
      final Map<String, Object?> options = const {}})
      : _options = options,
        super._();
  factory _GameConfig.fromJson(Map<String, dynamic> json) =>
      _$GameConfigFromJson(json);

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
  final Map<String, Object?> _options;
  @override
  @JsonKey()
  Map<String, Object?> get options {
    if (_options is EqualUnmodifiableMapView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_options);
  }

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GameConfigCopyWith<_GameConfig> get copyWith =>
      __$GameConfigCopyWithImpl<_GameConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GameConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameConfig &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            (identical(other.adminID, adminID) || other.adminID == adminID) &&
            (identical(other.nameSet, nameSet) || other.nameSet == nameSet) &&
            (identical(other.customNames, customNames) ||
                other.customNames == customNames) &&
            (identical(other.rounds, rounds) || other.rounds == rounds) &&
            (identical(other.minPlayers, minPlayers) ||
                other.minPlayers == minPlayers) &&
            (identical(other.maxPlayers, maxPlayers) ||
                other.maxPlayers == maxPlayers) &&
            (identical(other.autoStart, autoStart) ||
                other.autoStart == autoStart) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameType,
      adminID,
      nameSet,
      customNames,
      rounds,
      minPlayers,
      maxPlayers,
      autoStart,
      const DeepCollectionEquality().hash(_options));

  @override
  String toString() {
    return 'GameConfig(gameType: $gameType, adminID: $adminID, nameSet: $nameSet, customNames: $customNames, rounds: $rounds, minPlayers: $minPlayers, maxPlayers: $maxPlayers, autoStart: $autoStart, options: $options)';
  }
}

/// @nodoc
abstract mixin class _$GameConfigCopyWith<$Res>
    implements $GameConfigCopyWith<$Res> {
  factory _$GameConfigCopyWith(
          _GameConfig value, $Res Function(_GameConfig) _then) =
      __$GameConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String gameType,
      String? adminID,
      NameSet nameSet,
      bool customNames,
      int rounds,
      int minPlayers,
      int maxPlayers,
      bool autoStart,
      Map<String, Object?> options});
}

/// @nodoc
class __$GameConfigCopyWithImpl<$Res> implements _$GameConfigCopyWith<$Res> {
  __$GameConfigCopyWithImpl(this._self, this._then);

  final _GameConfig _self;
  final $Res Function(_GameConfig) _then;

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gameType = null,
    Object? adminID = freezed,
    Object? nameSet = null,
    Object? customNames = null,
    Object? rounds = null,
    Object? minPlayers = null,
    Object? maxPlayers = null,
    Object? autoStart = null,
    Object? options = null,
  }) {
    return _then(_GameConfig(
      gameType: null == gameType
          ? _self.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      adminID: freezed == adminID
          ? _self.adminID
          : adminID // ignore: cast_nullable_to_non_nullable
              as String?,
      nameSet: null == nameSet
          ? _self.nameSet
          : nameSet // ignore: cast_nullable_to_non_nullable
              as NameSet,
      customNames: null == customNames
          ? _self.customNames
          : customNames // ignore: cast_nullable_to_non_nullable
              as bool,
      rounds: null == rounds
          ? _self.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      minPlayers: null == minPlayers
          ? _self.minPlayers
          : minPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: null == maxPlayers
          ? _self.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      autoStart: null == autoStart
          ? _self.autoStart
          : autoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ));
  }
}

/// @nodoc
mixin _$GameInfo {
  GameCode get gameID;
  IList<PlayerName> get players;
  PlayerName get player;
  bool get creator;
  GameConfig get config;
  GameStatus get status;

  /// Create a copy of GameInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameInfoCopyWith<GameInfo> get copyWith =>
      _$GameInfoCopyWithImpl<GameInfo>(this as GameInfo, _$identity);

  /// Serializes this GameInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameInfo &&
            (identical(other.gameID, gameID) || other.gameID == gameID) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameID,
      const DeepCollectionEquality().hash(players),
      player,
      creator,
      config,
      status);

  @override
  String toString() {
    return 'GameInfo(gameID: $gameID, players: $players, player: $player, creator: $creator, config: $config, status: $status)';
  }
}

/// @nodoc
abstract mixin class $GameInfoCopyWith<$Res> {
  factory $GameInfoCopyWith(GameInfo value, $Res Function(GameInfo) _then) =
      _$GameInfoCopyWithImpl;
  @useResult
  $Res call(
      {String gameID,
      IList<String> players,
      String player,
      bool creator,
      GameConfig config,
      GameStatus status});

  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$GameInfoCopyWithImpl<$Res> implements $GameInfoCopyWith<$Res> {
  _$GameInfoCopyWithImpl(this._self, this._then);

  final GameInfo _self;
  final $Res Function(GameInfo) _then;

  /// Create a copy of GameInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameID = null,
    Object? players = null,
    Object? player = null,
    Object? creator = null,
    Object? config = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      gameID: null == gameID
          ? _self.gameID!
          : gameID // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _self.players!
          : players // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      player: null == player
          ? _self.player!
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _self.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as bool,
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }

  /// Create a copy of GameInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameConfigCopyWith<$Res> get config {
    return $GameConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _GameInfo implements GameInfo {
  const _GameInfo(
      {required this.gameID,
      required this.players,
      required this.player,
      required this.creator,
      required this.config,
      required this.status});
  factory _GameInfo.fromJson(Map<String, dynamic> json) =>
      _$GameInfoFromJson(json);

  @override
  final String gameID;
  @override
  final IList<String> players;
  @override
  final String player;
  @override
  final bool creator;
  @override
  final GameConfig config;
  @override
  final GameStatus status;

  /// Create a copy of GameInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GameInfoCopyWith<_GameInfo> get copyWith =>
      __$GameInfoCopyWithImpl<_GameInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GameInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameInfo &&
            (identical(other.gameID, gameID) || other.gameID == gameID) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameID,
      const DeepCollectionEquality().hash(players),
      player,
      creator,
      config,
      status);

  @override
  String toString() {
    return 'GameInfo(gameID: $gameID, players: $players, player: $player, creator: $creator, config: $config, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$GameInfoCopyWith<$Res>
    implements $GameInfoCopyWith<$Res> {
  factory _$GameInfoCopyWith(_GameInfo value, $Res Function(_GameInfo) _then) =
      __$GameInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String gameID,
      IList<String> players,
      String player,
      bool creator,
      GameConfig config,
      GameStatus status});

  @override
  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$GameInfoCopyWithImpl<$Res> implements _$GameInfoCopyWith<$Res> {
  __$GameInfoCopyWithImpl(this._self, this._then);

  final _GameInfo _self;
  final $Res Function(_GameInfo) _then;

  /// Create a copy of GameInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gameID = null,
    Object? players = null,
    Object? player = null,
    Object? creator = null,
    Object? config = null,
    Object? status = null,
  }) {
    return _then(_GameInfo(
      gameID: null == gameID
          ? _self.gameID
          : gameID // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _self.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      player: null == player
          ? _self.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _self.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as bool,
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ));
  }

  /// Create a copy of GameInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameConfigCopyWith<$Res> get config {
    return $GameConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// @nodoc
mixin _$Lobby {
  GameCode get code;
  GameConfig get config;
  GameStatus get gameStatus;
  ISet<Player> get players;

  /// Create a copy of Lobby
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LobbyCopyWith<Lobby> get copyWith =>
      _$LobbyCopyWithImpl<Lobby>(this as Lobby, _$identity);

  /// Serializes this Lobby to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Lobby &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.gameStatus, gameStatus) ||
                other.gameStatus == gameStatus) &&
            const DeepCollectionEquality().equals(other.players, players));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, config, gameStatus,
      const DeepCollectionEquality().hash(players));

  @override
  String toString() {
    return 'Lobby(code: $code, config: $config, gameStatus: $gameStatus, players: $players)';
  }
}

/// @nodoc
abstract mixin class $LobbyCopyWith<$Res> {
  factory $LobbyCopyWith(Lobby value, $Res Function(Lobby) _then) =
      _$LobbyCopyWithImpl;
  @useResult
  $Res call(
      {String code,
      GameConfig config,
      GameStatus gameStatus,
      ISet<Player> players});

  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$LobbyCopyWithImpl<$Res> implements $LobbyCopyWith<$Res> {
  _$LobbyCopyWithImpl(this._self, this._then);

  final Lobby _self;
  final $Res Function(Lobby) _then;

  /// Create a copy of Lobby
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? config = null,
    Object? gameStatus = null,
    Object? players = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code!
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      gameStatus: null == gameStatus
          ? _self.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      players: null == players
          ? _self.players
          : players // ignore: cast_nullable_to_non_nullable
              as ISet<Player>,
    ));
  }

  /// Create a copy of Lobby
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameConfigCopyWith<$Res> get config {
    return $GameConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Lobby implements Lobby {
  const _Lobby(
      {required this.code,
      required this.config,
      required this.gameStatus,
      this.players = const ISetConst({})});
  factory _Lobby.fromJson(Map<String, dynamic> json) => _$LobbyFromJson(json);

  @override
  final String code;
  @override
  final GameConfig config;
  @override
  final GameStatus gameStatus;
  @override
  @JsonKey()
  final ISet<Player> players;

  /// Create a copy of Lobby
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LobbyCopyWith<_Lobby> get copyWith =>
      __$LobbyCopyWithImpl<_Lobby>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LobbyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Lobby &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.gameStatus, gameStatus) ||
                other.gameStatus == gameStatus) &&
            const DeepCollectionEquality().equals(other.players, players));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, config, gameStatus,
      const DeepCollectionEquality().hash(players));

  @override
  String toString() {
    return 'Lobby(code: $code, config: $config, gameStatus: $gameStatus, players: $players)';
  }
}

/// @nodoc
abstract mixin class _$LobbyCopyWith<$Res> implements $LobbyCopyWith<$Res> {
  factory _$LobbyCopyWith(_Lobby value, $Res Function(_Lobby) _then) =
      __$LobbyCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String code,
      GameConfig config,
      GameStatus gameStatus,
      ISet<Player> players});

  @override
  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$LobbyCopyWithImpl<$Res> implements _$LobbyCopyWith<$Res> {
  __$LobbyCopyWithImpl(this._self, this._then);

  final _Lobby _self;
  final $Res Function(_Lobby) _then;

  /// Create a copy of Lobby
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? config = null,
    Object? gameStatus = null,
    Object? players = null,
  }) {
    return _then(_Lobby(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      gameStatus: null == gameStatus
          ? _self.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      players: null == players
          ? _self.players
          : players // ignore: cast_nullable_to_non_nullable
              as ISet<Player>,
    ));
  }

  /// Create a copy of Lobby
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameConfigCopyWith<$Res> get config {
    return $GameConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

// dart format on
