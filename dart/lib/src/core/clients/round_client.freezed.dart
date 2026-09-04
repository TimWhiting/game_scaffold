// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoundInfo {

@protected RoundService? get service; String get code; PlayerName get playerName; GameInfo? get lobby; GameState<Event, Game>? get game; String? get error;
/// Create a copy of RoundInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundInfoCopyWith<RoundInfo> get copyWith => _$RoundInfoCopyWithImpl<RoundInfo>(this as RoundInfo, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoundInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundInfo&&(identical(other.service, _this.service) || other.service == _this.service)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.playerName, _this.playerName) || other.playerName == _this.playerName)&&(identical(other.lobby, _this.lobby) || other.lobby == _this.lobby)&&(identical(other.game, _this.game) || other.game == _this.game)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as RoundInfo;
  return Object.hash(runtimeType,_this.service,_this.code,_this.playerName,_this.lobby,_this.game,_this.error);
}

@override
String toString() {
  final _this = this as RoundInfo;
  return 'RoundInfo(service: ${_this.service}, code: ${_this.code}, playerName: ${_this.playerName}, lobby: ${_this.lobby}, game: ${_this.game}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $RoundInfoCopyWith<$Res>  {
  factory $RoundInfoCopyWith(RoundInfo value, $Res Function(RoundInfo) _then) = _$RoundInfoCopyWithImpl;
@useResult
$Res call({
@protected RoundService? service, String code, PlayerName playerName, GameInfo? lobby, GameState<Event, Game>? game, String? error
});


$GameInfoCopyWith<$Res>? get lobby;

}
/// @nodoc
class _$RoundInfoCopyWithImpl<$Res>
    implements $RoundInfoCopyWith<$Res> {
  _$RoundInfoCopyWithImpl(this._self, this._then);

  final RoundInfo _self;
  final $Res Function(RoundInfo) _then;

/// Create a copy of RoundInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? service = freezed,Object? code = null,Object? playerName = null,Object? lobby = freezed,Object? game = freezed,Object? error = freezed,}) {
  return _then(RoundInfo(
freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as RoundService?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,playerName: null == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as PlayerName,lobby: freezed == lobby ? _self.lobby : lobby // ignore: cast_nullable_to_non_nullable
as GameInfo?,game: freezed == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as GameState<Event, Game>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [RoundInfo].
extension RoundInfoPatterns on RoundInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoundInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoundInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoundInfo value)  $default,){
final _that = this;
switch (_that) {
case _RoundInfo():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoundInfo value)?  $default,){
final _that = this;
switch (_that) {
case _RoundInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@protected  RoundService? service,  String code,  PlayerName playerName,  GameInfo? lobby,  GameState<Event, Game>? game,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoundInfo() when $default != null:
return $default(_that.service,_that.code,_that.playerName,_that.lobby,_that.game,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@protected  RoundService? service,  String code,  PlayerName playerName,  GameInfo? lobby,  GameState<Event, Game>? game,  String? error)  $default,) {final _that = this;
switch (_that) {
case _RoundInfo():
return $default(_that.service,_that.code,_that.playerName,_that.lobby,_that.game,_that.error);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@protected  RoundService? service,  String code,  PlayerName playerName,  GameInfo? lobby,  GameState<Event, Game>? game,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _RoundInfo() when $default != null:
return $default(_that.service,_that.code,_that.playerName,_that.lobby,_that.game,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _RoundInfo extends RoundInfo {
  const _RoundInfo(@protected this.service, {required this.code, required this.playerName, this.lobby, this.game, this.error}): super._();
  

@override@protected final  RoundService? service;
@override final  String code;
@override final  PlayerName playerName;
@override final  GameInfo? lobby;
@override final  GameState<Event, Game>? game;
@override final  String? error;

/// Create a copy of RoundInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoundInfoCopyWith<_RoundInfo> get copyWith => __$RoundInfoCopyWithImpl<_RoundInfo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoundInfo&&(identical(other.service, service) || other.service == service)&&(identical(other.code, code) || other.code == code)&&(identical(other.playerName, playerName) || other.playerName == playerName)&&(identical(other.lobby, lobby) || other.lobby == lobby)&&(identical(other.game, game) || other.game == game)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,service,code,playerName,lobby,game,error);
}

@override
String toString() {
    return 'RoundInfo(service: $service, code: $code, playerName: $playerName, lobby: $lobby, game: $game, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RoundInfoCopyWith<$Res> implements $RoundInfoCopyWith<$Res> {
  factory _$RoundInfoCopyWith(_RoundInfo value, $Res Function(_RoundInfo) _then) = __$RoundInfoCopyWithImpl;
@override @useResult
$Res call({
@protected RoundService? service, String code, PlayerName playerName, GameInfo? lobby, GameState<Event, Game>? game, String? error
});


@override $GameInfoCopyWith<$Res>? get lobby;

}
/// @nodoc
class __$RoundInfoCopyWithImpl<$Res>
    implements _$RoundInfoCopyWith<$Res> {
  __$RoundInfoCopyWithImpl(this._self, this._then);

  final _RoundInfo _self;
  final $Res Function(_RoundInfo) _then;

/// Create a copy of RoundInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? service = freezed,Object? code = null,Object? playerName = null,Object? lobby = freezed,Object? game = freezed,Object? error = freezed,}) {
  return _then(_RoundInfo(
freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as RoundService?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,playerName: null == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as PlayerName,lobby: freezed == lobby ? _self.lobby : lobby // ignore: cast_nullable_to_non_nullable
as GameInfo?,game: freezed == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as GameState<Event, Game>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
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
