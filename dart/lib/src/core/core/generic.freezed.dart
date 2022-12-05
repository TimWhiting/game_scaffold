// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'generic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericGame _$GenericGameFromJson(Map<String, dynamic> json) {
  return _GenericGame.fromJson(json);
}

/// @nodoc
mixin _$GenericGame {
  DateTime get time => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;
  IList<Player> get players => throw _privateConstructorUsedError;
  IList<String> get readyPlayers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericGameCopyWith<GenericGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericGameCopyWith<$Res> {
  factory $GenericGameCopyWith(
          GenericGame value, $Res Function(GenericGame) then) =
      _$GenericGameCopyWithImpl<$Res, GenericGame>;
  @useResult
  $Res call(
      {DateTime time,
      GameStatus status,
      int round,
      IList<Player> players,
      IList<String> readyPlayers});
}

/// @nodoc
class _$GenericGameCopyWithImpl<$Res, $Val extends GenericGame>
    implements $GenericGameCopyWith<$Res> {
  _$GenericGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? status = null,
    Object? round = null,
    Object? players = null,
    Object? readyPlayers = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<Player>,
      readyPlayers: null == readyPlayers
          ? _value.readyPlayers
          : readyPlayers // ignore: cast_nullable_to_non_nullable
              as IList<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenericGameCopyWith<$Res>
    implements $GenericGameCopyWith<$Res> {
  factory _$$_GenericGameCopyWith(
          _$_GenericGame value, $Res Function(_$_GenericGame) then) =
      __$$_GenericGameCopyWithImpl<$Res>;
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
class __$$_GenericGameCopyWithImpl<$Res>
    extends _$GenericGameCopyWithImpl<$Res, _$_GenericGame>
    implements _$$_GenericGameCopyWith<$Res> {
  __$$_GenericGameCopyWithImpl(
      _$_GenericGame _value, $Res Function(_$_GenericGame) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? status = null,
    Object? round = null,
    Object? players = null,
    Object? readyPlayers = null,
  }) {
    return _then(_$_GenericGame(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<Player>,
      readyPlayers: null == readyPlayers
          ? _value.readyPlayers
          : readyPlayers // ignore: cast_nullable_to_non_nullable
              as IList<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericGame extends _GenericGame {
  const _$_GenericGame(
      {required this.time,
      required this.status,
      required this.round,
      this.players = const IListConst([]),
      this.readyPlayers = const IListConst([])})
      : super._();

  factory _$_GenericGame.fromJson(Map<String, dynamic> json) =>
      _$$_GenericGameFromJson(json);

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

  @override
  String toString() {
    return 'GenericGame(time: $time, status: $status, round: $round, players: $players, readyPlayers: $readyPlayers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericGame &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.round, round) || other.round == round) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality()
                .equals(other.readyPlayers, readyPlayers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      status,
      round,
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(readyPlayers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenericGameCopyWith<_$_GenericGame> get copyWith =>
      __$$_GenericGameCopyWithImpl<_$_GenericGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenericGameToJson(
      this,
    );
  }
}

abstract class _GenericGame extends GenericGame {
  const factory _GenericGame(
      {required final DateTime time,
      required final GameStatus status,
      required final int round,
      final IList<Player> players,
      final IList<String> readyPlayers}) = _$_GenericGame;
  const _GenericGame._() : super._();

  factory _GenericGame.fromJson(Map<String, dynamic> json) =
      _$_GenericGame.fromJson;

  @override
  DateTime get time;
  @override
  GameStatus get status;
  @override
  int get round;
  @override
  IList<Player> get players;
  @override
  IList<String> get readyPlayers;
  @override
  @JsonKey(ignore: true)
  _$$_GenericGameCopyWith<_$_GenericGame> get copyWith =>
      throw _privateConstructorUsedError;
}

GenericEvent _$GenericEventFromJson(Map<String, dynamic> json) {
  return _GenericReadyNextRoundEvent.fromJson(json);
}

/// @nodoc
mixin _$GenericEvent {
  String get player => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String player) readyNextRound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String player)? readyNextRound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String player)? readyNextRound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenericReadyNextRoundEvent value)? readyNextRound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericEventCopyWith<GenericEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericEventCopyWith<$Res> {
  factory $GenericEventCopyWith(
          GenericEvent value, $Res Function(GenericEvent) then) =
      _$GenericEventCopyWithImpl<$Res, GenericEvent>;
  @useResult
  $Res call({String player});
}

/// @nodoc
class _$GenericEventCopyWithImpl<$Res, $Val extends GenericEvent>
    implements $GenericEventCopyWith<$Res> {
  _$GenericEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenericReadyNextRoundEventCopyWith<$Res>
    implements $GenericEventCopyWith<$Res> {
  factory _$$_GenericReadyNextRoundEventCopyWith(
          _$_GenericReadyNextRoundEvent value,
          $Res Function(_$_GenericReadyNextRoundEvent) then) =
      __$$_GenericReadyNextRoundEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String player});
}

/// @nodoc
class __$$_GenericReadyNextRoundEventCopyWithImpl<$Res>
    extends _$GenericEventCopyWithImpl<$Res, _$_GenericReadyNextRoundEvent>
    implements _$$_GenericReadyNextRoundEventCopyWith<$Res> {
  __$$_GenericReadyNextRoundEventCopyWithImpl(
      _$_GenericReadyNextRoundEvent _value,
      $Res Function(_$_GenericReadyNextRoundEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
  }) {
    return _then(_$_GenericReadyNextRoundEvent(
      null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericReadyNextRoundEvent extends _GenericReadyNextRoundEvent {
  const _$_GenericReadyNextRoundEvent(this.player) : super._();

  factory _$_GenericReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =>
      _$$_GenericReadyNextRoundEventFromJson(json);

  @override
  final String player;

  @override
  String toString() {
    return 'GenericEvent.readyNextRound(player: $player)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericReadyNextRoundEvent &&
            (identical(other.player, player) || other.player == player));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenericReadyNextRoundEventCopyWith<_$_GenericReadyNextRoundEvent>
      get copyWith => __$$_GenericReadyNextRoundEventCopyWithImpl<
          _$_GenericReadyNextRoundEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String player) readyNextRound,
  }) {
    return readyNextRound(player);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String player)? readyNextRound,
  }) {
    return readyNextRound?.call(player);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String player)? readyNextRound,
    required TResult orElse(),
  }) {
    if (readyNextRound != null) {
      return readyNextRound(player);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenericReadyNextRoundEvent value) readyNextRound,
  }) {
    return readyNextRound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenericReadyNextRoundEvent value)? readyNextRound,
  }) {
    return readyNextRound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericReadyNextRoundEvent value)? readyNextRound,
    required TResult orElse(),
  }) {
    if (readyNextRound != null) {
      return readyNextRound(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenericReadyNextRoundEventToJson(
      this,
    );
  }
}

abstract class _GenericReadyNextRoundEvent extends GenericEvent {
  const factory _GenericReadyNextRoundEvent(final String player) =
      _$_GenericReadyNextRoundEvent;
  const _GenericReadyNextRoundEvent._() : super._();

  factory _GenericReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =
      _$_GenericReadyNextRoundEvent.fromJson;

  @override
  String get player;
  @override
  @JsonKey(ignore: true)
  _$$_GenericReadyNextRoundEventCopyWith<_$_GenericReadyNextRoundEvent>
      get copyWith => throw _privateConstructorUsedError;
}

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
  Map<String, Object?> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameConfigCopyWith<GameConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameConfigCopyWith<$Res> {
  factory $GameConfigCopyWith(
          GameConfig value, $Res Function(GameConfig) then) =
      _$GameConfigCopyWithImpl<$Res, GameConfig>;
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
class _$GameConfigCopyWithImpl<$Res, $Val extends GameConfig>
    implements $GameConfigCopyWith<$Res> {
  _$GameConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      adminID: freezed == adminID
          ? _value.adminID
          : adminID // ignore: cast_nullable_to_non_nullable
              as String?,
      nameSet: null == nameSet
          ? _value.nameSet
          : nameSet // ignore: cast_nullable_to_non_nullable
              as NameSet,
      customNames: null == customNames
          ? _value.customNames
          : customNames // ignore: cast_nullable_to_non_nullable
              as bool,
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      minPlayers: null == minPlayers
          ? _value.minPlayers
          : minPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: null == maxPlayers
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      autoStart: null == autoStart
          ? _value.autoStart
          : autoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameConfigCopyWith<$Res>
    implements $GameConfigCopyWith<$Res> {
  factory _$$_GameConfigCopyWith(
          _$_GameConfig value, $Res Function(_$_GameConfig) then) =
      __$$_GameConfigCopyWithImpl<$Res>;
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
class __$$_GameConfigCopyWithImpl<$Res>
    extends _$GameConfigCopyWithImpl<$Res, _$_GameConfig>
    implements _$$_GameConfigCopyWith<$Res> {
  __$$_GameConfigCopyWithImpl(
      _$_GameConfig _value, $Res Function(_$_GameConfig) _then)
      : super(_value, _then);

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
    return _then(_$_GameConfig(
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      adminID: freezed == adminID
          ? _value.adminID
          : adminID // ignore: cast_nullable_to_non_nullable
              as String?,
      nameSet: null == nameSet
          ? _value.nameSet
          : nameSet // ignore: cast_nullable_to_non_nullable
              as NameSet,
      customNames: null == customNames
          ? _value.customNames
          : customNames // ignore: cast_nullable_to_non_nullable
              as bool,
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      minPlayers: null == minPlayers
          ? _value.minPlayers
          : minPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: null == maxPlayers
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      autoStart: null == autoStart
          ? _value.autoStart
          : autoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameConfig extends _GameConfig {
  const _$_GameConfig(
      {required this.gameType,
      this.adminID,
      this.nameSet = NameSet.basic,
      this.customNames = false,
      this.rounds = 15,
      this.minPlayers = 1,
      this.maxPlayers = 10,
      this.autoStart = true,
      final Map<String, Object?> options = const {}})
      : _options = options,
        super._();

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
  final Map<String, Object?> _options;
  @override
  @JsonKey()
  Map<String, Object?> get options {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_options);
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameConfigCopyWith<_$_GameConfig> get copyWith =>
      __$$_GameConfigCopyWithImpl<_$_GameConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameConfigToJson(
      this,
    );
  }
}

abstract class _GameConfig extends GameConfig {
  const factory _GameConfig(
      {required final String gameType,
      final String? adminID,
      final NameSet nameSet,
      final bool customNames,
      final int rounds,
      final int minPlayers,
      final int maxPlayers,
      final bool autoStart,
      final Map<String, Object?> options}) = _$_GameConfig;
  const _GameConfig._() : super._();

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
  Map<String, Object?> get options;
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
  GameConfig get config => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameInfoCopyWith<GameInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameInfoCopyWith<$Res> {
  factory $GameInfoCopyWith(GameInfo value, $Res Function(GameInfo) then) =
      _$GameInfoCopyWithImpl<$Res, GameInfo>;
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
class _$GameInfoCopyWithImpl<$Res, $Val extends GameInfo>
    implements $GameInfoCopyWith<$Res> {
  _$GameInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      gameID: null == gameID
          ? _value.gameID
          : gameID // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as bool,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameConfigCopyWith<$Res> get config {
    return $GameConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameInfoCopyWith<$Res> implements $GameInfoCopyWith<$Res> {
  factory _$$_GameInfoCopyWith(
          _$_GameInfo value, $Res Function(_$_GameInfo) then) =
      __$$_GameInfoCopyWithImpl<$Res>;
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
class __$$_GameInfoCopyWithImpl<$Res>
    extends _$GameInfoCopyWithImpl<$Res, _$_GameInfo>
    implements _$$_GameInfoCopyWith<$Res> {
  __$$_GameInfoCopyWithImpl(
      _$_GameInfo _value, $Res Function(_$_GameInfo) _then)
      : super(_value, _then);

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
    return _then(_$_GameInfo(
      gameID: null == gameID
          ? _value.gameID
          : gameID // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as bool,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      status: null == status
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
      required this.config,
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
  final GameConfig config;
  @override
  final GameStatus status;

  @override
  String toString() {
    return 'GameInfo(gameID: $gameID, players: $players, player: $player, creator: $creator, config: $config, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameInfo &&
            (identical(other.gameID, gameID) || other.gameID == gameID) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameID,
      const DeepCollectionEquality().hash(players),
      player,
      creator,
      config,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      required final GameConfig config,
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
  GameConfig get config;
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
      _$LobbyCopyWithImpl<$Res, Lobby>;
  @useResult
  $Res call(
      {String code,
      ISet<Player> players,
      GameConfig config,
      GameStatus gameStatus});

  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$LobbyCopyWithImpl<$Res, $Val extends Lobby>
    implements $LobbyCopyWith<$Res> {
  _$LobbyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? players = null,
    Object? config = null,
    Object? gameStatus = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as ISet<Player>,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      gameStatus: null == gameStatus
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameConfigCopyWith<$Res> get config {
    return $GameConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LobbyCopyWith<$Res> implements $LobbyCopyWith<$Res> {
  factory _$$_LobbyCopyWith(_$_Lobby value, $Res Function(_$_Lobby) then) =
      __$$_LobbyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      ISet<Player> players,
      GameConfig config,
      GameStatus gameStatus});

  @override
  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$_LobbyCopyWithImpl<$Res> extends _$LobbyCopyWithImpl<$Res, _$_Lobby>
    implements _$$_LobbyCopyWith<$Res> {
  __$$_LobbyCopyWithImpl(_$_Lobby _value, $Res Function(_$_Lobby) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? players = null,
    Object? config = null,
    Object? gameStatus = null,
  }) {
    return _then(_$_Lobby(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as ISet<Player>,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      gameStatus: null == gameStatus
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
      this.players = const ISetConst({}),
      required this.config,
      required this.gameStatus});

  factory _$_Lobby.fromJson(Map<String, dynamic> json) =>
      _$$_LobbyFromJson(json);

  @override
  final String code;
  @override
  @JsonKey()
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
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.gameStatus, gameStatus) ||
                other.gameStatus == gameStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code,
      const DeepCollectionEquality().hash(players), config, gameStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      final ISet<Player> players,
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
