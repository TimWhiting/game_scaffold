// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$GenericGameImplCopyWith<$Res>
    implements $GenericGameCopyWith<$Res> {
  factory _$$GenericGameImplCopyWith(
          _$GenericGameImpl value, $Res Function(_$GenericGameImpl) then) =
      __$$GenericGameImplCopyWithImpl<$Res>;
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
class __$$GenericGameImplCopyWithImpl<$Res>
    extends _$GenericGameCopyWithImpl<$Res, _$GenericGameImpl>
    implements _$$GenericGameImplCopyWith<$Res> {
  __$$GenericGameImplCopyWithImpl(
      _$GenericGameImpl _value, $Res Function(_$GenericGameImpl) _then)
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
    return _then(_$GenericGameImpl(
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
class _$GenericGameImpl extends _GenericGame {
  const _$GenericGameImpl(
      {required this.time,
      required this.status,
      required this.round,
      this.players = const IListConst([]),
      this.readyPlayers = const IListConst([])})
      : super._();

  factory _$GenericGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenericGameImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericGameImpl &&
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
  _$$GenericGameImplCopyWith<_$GenericGameImpl> get copyWith =>
      __$$GenericGameImplCopyWithImpl<_$GenericGameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericGameImplToJson(
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
      final IList<String> readyPlayers}) = _$GenericGameImpl;
  const _GenericGame._() : super._();

  factory _GenericGame.fromJson(Map<String, dynamic> json) =
      _$GenericGameImpl.fromJson;

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
  _$$GenericGameImplCopyWith<_$GenericGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenericEvent _$GenericEventFromJson(Map<String, dynamic> json) {
  return _GenericReadyNextRoundEvent.fromJson(json);
}

/// @nodoc
mixin _$GenericEvent {
  String get player => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String player, String type) readyNextRound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String player, String type)? readyNextRound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String player, String type)? readyNextRound,
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
  $Res call({String player, String type});
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
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericReadyNextRoundEventImplCopyWith<$Res>
    implements $GenericEventCopyWith<$Res> {
  factory _$$GenericReadyNextRoundEventImplCopyWith(
          _$GenericReadyNextRoundEventImpl value,
          $Res Function(_$GenericReadyNextRoundEventImpl) then) =
      __$$GenericReadyNextRoundEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String player, String type});
}

/// @nodoc
class __$$GenericReadyNextRoundEventImplCopyWithImpl<$Res>
    extends _$GenericEventCopyWithImpl<$Res, _$GenericReadyNextRoundEventImpl>
    implements _$$GenericReadyNextRoundEventImplCopyWith<$Res> {
  __$$GenericReadyNextRoundEventImplCopyWithImpl(
      _$GenericReadyNextRoundEventImpl _value,
      $Res Function(_$GenericReadyNextRoundEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? type = null,
  }) {
    return _then(_$GenericReadyNextRoundEventImpl(
      null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenericReadyNextRoundEventImpl extends _GenericReadyNextRoundEvent {
  const _$GenericReadyNextRoundEventImpl(this.player, {this.type = 'generic'})
      : super._();

  factory _$GenericReadyNextRoundEventImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GenericReadyNextRoundEventImplFromJson(json);

  @override
  final String player;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'GenericEvent.readyNextRound(player: $player, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericReadyNextRoundEventImpl &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericReadyNextRoundEventImplCopyWith<_$GenericReadyNextRoundEventImpl>
      get copyWith => __$$GenericReadyNextRoundEventImplCopyWithImpl<
          _$GenericReadyNextRoundEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String player, String type) readyNextRound,
  }) {
    return readyNextRound(player, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String player, String type)? readyNextRound,
  }) {
    return readyNextRound?.call(player, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String player, String type)? readyNextRound,
    required TResult orElse(),
  }) {
    if (readyNextRound != null) {
      return readyNextRound(player, type);
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
    return _$$GenericReadyNextRoundEventImplToJson(
      this,
    );
  }
}

abstract class _GenericReadyNextRoundEvent extends GenericEvent {
  const factory _GenericReadyNextRoundEvent(final String player,
      {final String type}) = _$GenericReadyNextRoundEventImpl;
  const _GenericReadyNextRoundEvent._() : super._();

  factory _GenericReadyNextRoundEvent.fromJson(Map<String, dynamic> json) =
      _$GenericReadyNextRoundEventImpl.fromJson;

  @override
  String get player;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$GenericReadyNextRoundEventImplCopyWith<_$GenericReadyNextRoundEventImpl>
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
abstract class _$$GameConfigImplCopyWith<$Res>
    implements $GameConfigCopyWith<$Res> {
  factory _$$GameConfigImplCopyWith(
          _$GameConfigImpl value, $Res Function(_$GameConfigImpl) then) =
      __$$GameConfigImplCopyWithImpl<$Res>;
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
class __$$GameConfigImplCopyWithImpl<$Res>
    extends _$GameConfigCopyWithImpl<$Res, _$GameConfigImpl>
    implements _$$GameConfigImplCopyWith<$Res> {
  __$$GameConfigImplCopyWithImpl(
      _$GameConfigImpl _value, $Res Function(_$GameConfigImpl) _then)
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
    return _then(_$GameConfigImpl(
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
class _$GameConfigImpl extends _GameConfig {
  const _$GameConfigImpl(
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

  factory _$GameConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameConfigImplFromJson(json);

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

  @override
  String toString() {
    return 'GameConfig(gameType: $gameType, adminID: $adminID, nameSet: $nameSet, customNames: $customNames, rounds: $rounds, minPlayers: $minPlayers, maxPlayers: $maxPlayers, autoStart: $autoStart, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameConfigImpl &&
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
  _$$GameConfigImplCopyWith<_$GameConfigImpl> get copyWith =>
      __$$GameConfigImplCopyWithImpl<_$GameConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameConfigImplToJson(
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
      final Map<String, Object?> options}) = _$GameConfigImpl;
  const _GameConfig._() : super._();

  factory _GameConfig.fromJson(Map<String, dynamic> json) =
      _$GameConfigImpl.fromJson;

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
  _$$GameConfigImplCopyWith<_$GameConfigImpl> get copyWith =>
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
abstract class _$$GameInfoImplCopyWith<$Res>
    implements $GameInfoCopyWith<$Res> {
  factory _$$GameInfoImplCopyWith(
          _$GameInfoImpl value, $Res Function(_$GameInfoImpl) then) =
      __$$GameInfoImplCopyWithImpl<$Res>;
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
class __$$GameInfoImplCopyWithImpl<$Res>
    extends _$GameInfoCopyWithImpl<$Res, _$GameInfoImpl>
    implements _$$GameInfoImplCopyWith<$Res> {
  __$$GameInfoImplCopyWithImpl(
      _$GameInfoImpl _value, $Res Function(_$GameInfoImpl) _then)
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
    return _then(_$GameInfoImpl(
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
class _$GameInfoImpl implements _GameInfo {
  const _$GameInfoImpl(
      {required this.gameID,
      required this.players,
      required this.player,
      required this.creator,
      required this.config,
      required this.status});

  factory _$GameInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameInfoImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameInfoImpl &&
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
  _$$GameInfoImplCopyWith<_$GameInfoImpl> get copyWith =>
      __$$GameInfoImplCopyWithImpl<_$GameInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameInfoImplToJson(
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
      required final GameStatus status}) = _$GameInfoImpl;

  factory _GameInfo.fromJson(Map<String, dynamic> json) =
      _$GameInfoImpl.fromJson;

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
  _$$GameInfoImplCopyWith<_$GameInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Lobby _$LobbyFromJson(Map<String, dynamic> json) {
  return _Lobby.fromJson(json);
}

/// @nodoc
mixin _$Lobby {
  String get code => throw _privateConstructorUsedError;
  GameConfig get config => throw _privateConstructorUsedError;
  GameStatus get gameStatus => throw _privateConstructorUsedError;
  ISet<Player> get players => throw _privateConstructorUsedError;

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
      GameConfig config,
      GameStatus gameStatus,
      ISet<Player> players});

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
    Object? config = null,
    Object? gameStatus = null,
    Object? players = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      gameStatus: null == gameStatus
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as ISet<Player>,
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
abstract class _$$LobbyImplCopyWith<$Res> implements $LobbyCopyWith<$Res> {
  factory _$$LobbyImplCopyWith(
          _$LobbyImpl value, $Res Function(_$LobbyImpl) then) =
      __$$LobbyImplCopyWithImpl<$Res>;
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
class __$$LobbyImplCopyWithImpl<$Res>
    extends _$LobbyCopyWithImpl<$Res, _$LobbyImpl>
    implements _$$LobbyImplCopyWith<$Res> {
  __$$LobbyImplCopyWithImpl(
      _$LobbyImpl _value, $Res Function(_$LobbyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? config = null,
    Object? gameStatus = null,
    Object? players = null,
  }) {
    return _then(_$LobbyImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
      gameStatus: null == gameStatus
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as ISet<Player>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LobbyImpl implements _Lobby {
  const _$LobbyImpl(
      {required this.code,
      required this.config,
      required this.gameStatus,
      this.players = const ISetConst({})});

  factory _$LobbyImpl.fromJson(Map<String, dynamic> json) =>
      _$$LobbyImplFromJson(json);

  @override
  final String code;
  @override
  final GameConfig config;
  @override
  final GameStatus gameStatus;
  @override
  @JsonKey()
  final ISet<Player> players;

  @override
  String toString() {
    return 'Lobby(code: $code, config: $config, gameStatus: $gameStatus, players: $players)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LobbyImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.gameStatus, gameStatus) ||
                other.gameStatus == gameStatus) &&
            const DeepCollectionEquality().equals(other.players, players));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, config, gameStatus,
      const DeepCollectionEquality().hash(players));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LobbyImplCopyWith<_$LobbyImpl> get copyWith =>
      __$$LobbyImplCopyWithImpl<_$LobbyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LobbyImplToJson(
      this,
    );
  }
}

abstract class _Lobby implements Lobby {
  const factory _Lobby(
      {required final String code,
      required final GameConfig config,
      required final GameStatus gameStatus,
      final ISet<Player> players}) = _$LobbyImpl;

  factory _Lobby.fromJson(Map<String, dynamic> json) = _$LobbyImpl.fromJson;

  @override
  String get code;
  @override
  GameConfig get config;
  @override
  GameStatus get gameStatus;
  @override
  ISet<Player> get players;
  @override
  @JsonKey(ignore: true)
  _$$LobbyImplCopyWith<_$LobbyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
