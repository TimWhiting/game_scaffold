// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoundInfo {
  @protected
  RoundService? get service;
  String get code;
  PlayerName get playerName;
  GameInfo? get lobby;
  GameState? get game;
  String? get error;

  /// Create a copy of RoundInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoundInfoCopyWith<RoundInfo> get copyWith =>
      _$RoundInfoCopyWithImpl<RoundInfo>(this as RoundInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoundInfo &&
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

  @override
  String toString() {
    return 'RoundInfo(service: $service, code: $code, playerName: $playerName, lobby: $lobby, game: $game, error: $error)';
  }
}

/// @nodoc
abstract mixin class $RoundInfoCopyWith<$Res> {
  factory $RoundInfoCopyWith(RoundInfo value, $Res Function(RoundInfo) _then) =
      _$RoundInfoCopyWithImpl;
  @useResult
  $Res call(
      {@protected RoundService? service,
      String code,
      String playerName,
      GameInfo? lobby,
      GameState<Event, Game>? game,
      String? error});

  $GameInfoCopyWith<$Res>? get lobby;
}

/// @nodoc
class _$RoundInfoCopyWithImpl<$Res> implements $RoundInfoCopyWith<$Res> {
  _$RoundInfoCopyWithImpl(this._self, this._then);

  final RoundInfo _self;
  final $Res Function(RoundInfo) _then;

  /// Create a copy of RoundInfo
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      service: freezed == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as RoundService?,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: null == playerName
          ? _self.playerName!
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      lobby: freezed == lobby
          ? _self.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as GameInfo?,
      game: freezed == game
          ? _self.game!
          : game // ignore: cast_nullable_to_non_nullable
              as GameState<Event, Game>?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RoundInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameInfoCopyWith<$Res>? get lobby {
    if (_self.lobby == null) {
      return null;
    }

    return $GameInfoCopyWith<$Res>(_self.lobby!, (value) {
      return _then(_self.copyWith(lobby: value));
    });
  }
}

/// @nodoc

class _RoundInfo extends RoundInfo {
  const _RoundInfo(@protected this.service,
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
  final GameState<Event, Game>? game;
  @override
  final String? error;

  /// Create a copy of RoundInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoundInfoCopyWith<_RoundInfo> get copyWith =>
      __$RoundInfoCopyWithImpl<_RoundInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoundInfo &&
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

  @override
  String toString() {
    return 'RoundInfo(service: $service, code: $code, playerName: $playerName, lobby: $lobby, game: $game, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$RoundInfoCopyWith<$Res>
    implements $RoundInfoCopyWith<$Res> {
  factory _$RoundInfoCopyWith(
          _RoundInfo value, $Res Function(_RoundInfo) _then) =
      __$RoundInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@protected RoundService? service,
      String code,
      String playerName,
      GameInfo? lobby,
      GameState<Event, Game>? game,
      String? error});

  @override
  $GameInfoCopyWith<$Res>? get lobby;
}

/// @nodoc
class __$RoundInfoCopyWithImpl<$Res> implements _$RoundInfoCopyWith<$Res> {
  __$RoundInfoCopyWithImpl(this._self, this._then);

  final _RoundInfo _self;
  final $Res Function(_RoundInfo) _then;

  /// Create a copy of RoundInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? service = freezed,
    Object? code = null,
    Object? playerName = null,
    Object? lobby = freezed,
    Object? game = freezed,
    Object? error = freezed,
  }) {
    return _then(_RoundInfo(
      freezed == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as RoundService?,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: null == playerName
          ? _self.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      lobby: freezed == lobby
          ? _self.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as GameInfo?,
      game: freezed == game
          ? _self.game
          : game // ignore: cast_nullable_to_non_nullable
              as GameState<Event, Game>?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RoundInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameInfoCopyWith<$Res>? get lobby {
    if (_self.lobby == null) {
      return null;
    }

    return $GameInfoCopyWith<$Res>(_self.lobby!, (value) {
      return _then(_self.copyWith(lobby: value));
    });
  }
}

// dart format on
