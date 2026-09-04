// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameClientInfo {

@protected GameService? get service; String? get code; PlayerName? get playerName; GameConfig? get config; IList<GameInfo>? get games;
/// Create a copy of GameClientInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameClientInfoCopyWith<GameClientInfo> get copyWith => _$GameClientInfoCopyWithImpl<GameClientInfo>(this as GameClientInfo, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GameClientInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameClientInfo&&(identical(other.service, _this.service) || other.service == _this.service)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.playerName, _this.playerName) || other.playerName == _this.playerName)&&(identical(other.config, _this.config) || other.config == _this.config)&&const DeepCollectionEquality().equals(other.games, _this.games));
}


@override
int get hashCode {
  final _this = this as GameClientInfo;
  return Object.hash(runtimeType,_this.service,_this.code,_this.playerName,_this.config,const DeepCollectionEquality().hash(_this.games));
}

@override
String toString() {
  final _this = this as GameClientInfo;
  return 'GameClientInfo(service: ${_this.service}, code: ${_this.code}, playerName: ${_this.playerName}, config: ${_this.config}, games: ${_this.games})';
}


}

/// @nodoc
abstract mixin class $GameClientInfoCopyWith<$Res>  {
  factory $GameClientInfoCopyWith(GameClientInfo value, $Res Function(GameClientInfo) _then) = _$GameClientInfoCopyWithImpl;
@useResult
$Res call({
@protected GameService? service, String? code, PlayerName? playerName, GameConfig? config, IList<GameInfo>? games
});


$GameConfigCopyWith<$Res>? get config;

}
/// @nodoc
class _$GameClientInfoCopyWithImpl<$Res>
    implements $GameClientInfoCopyWith<$Res> {
  _$GameClientInfoCopyWithImpl(this._self, this._then);

  final GameClientInfo _self;
  final $Res Function(GameClientInfo) _then;

/// Create a copy of GameClientInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? service = freezed,Object? code = freezed,Object? playerName = freezed,Object? config = freezed,Object? games = freezed,}) {
  return _then(GameClientInfo(
freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as GameService?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,playerName: freezed == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as PlayerName?,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as GameConfig?,games: freezed == games ? _self.games : games // ignore: cast_nullable_to_non_nullable
as IList<GameInfo>?,
  ));
}
/// Create a copy of GameClientInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameConfigCopyWith<$Res>? get config {
    if (_self.config == null) {
    return null;
  }

  return $GameConfigCopyWith<$Res>(_self.config!, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameClientInfo].
extension GameClientInfoPatterns on GameClientInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameClientInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameClientInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameClientInfo value)  $default,){
final _that = this;
switch (_that) {
case _GameClientInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameClientInfo value)?  $default,){
final _that = this;
switch (_that) {
case _GameClientInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@protected  GameService? service,  String? code,  PlayerName? playerName,  GameConfig? config,  IList<GameInfo>? games)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameClientInfo() when $default != null:
return $default(_that.service,_that.code,_that.playerName,_that.config,_that.games);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@protected  GameService? service,  String? code,  PlayerName? playerName,  GameConfig? config,  IList<GameInfo>? games)  $default,) {final _that = this;
switch (_that) {
case _GameClientInfo():
return $default(_that.service,_that.code,_that.playerName,_that.config,_that.games);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@protected  GameService? service,  String? code,  PlayerName? playerName,  GameConfig? config,  IList<GameInfo>? games)?  $default,) {final _that = this;
switch (_that) {
case _GameClientInfo() when $default != null:
return $default(_that.service,_that.code,_that.playerName,_that.config,_that.games);case _:
  return null;

}
}

}

/// @nodoc


class _GameClientInfo extends GameClientInfo {
  const _GameClientInfo(@protected this.service, {this.code, this.playerName, this.config, this.games}): super._();
  

@override@protected final  GameService? service;
@override final  String? code;
@override final  PlayerName? playerName;
@override final  GameConfig? config;
@override final  IList<GameInfo>? games;

/// Create a copy of GameClientInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameClientInfoCopyWith<_GameClientInfo> get copyWith => __$GameClientInfoCopyWithImpl<_GameClientInfo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameClientInfo&&(identical(other.service, service) || other.service == service)&&(identical(other.code, code) || other.code == code)&&(identical(other.playerName, playerName) || other.playerName == playerName)&&(identical(other.config, config) || other.config == config)&&const DeepCollectionEquality().equals(other.games, games));
}


@override
int get hashCode {
    return Object.hash(runtimeType,service,code,playerName,config,const DeepCollectionEquality().hash(games));
}

@override
String toString() {
    return 'GameClientInfo(service: $service, code: $code, playerName: $playerName, config: $config, games: $games)';
}


}

/// @nodoc
abstract mixin class _$GameClientInfoCopyWith<$Res> implements $GameClientInfoCopyWith<$Res> {
  factory _$GameClientInfoCopyWith(_GameClientInfo value, $Res Function(_GameClientInfo) _then) = __$GameClientInfoCopyWithImpl;
@override @useResult
$Res call({
@protected GameService? service, String? code, PlayerName? playerName, GameConfig? config, IList<GameInfo>? games
});


@override $GameConfigCopyWith<$Res>? get config;

}
/// @nodoc
class __$GameClientInfoCopyWithImpl<$Res>
    implements _$GameClientInfoCopyWith<$Res> {
  __$GameClientInfoCopyWithImpl(this._self, this._then);

  final _GameClientInfo _self;
  final $Res Function(_GameClientInfo) _then;

/// Create a copy of GameClientInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? service = freezed,Object? code = freezed,Object? playerName = freezed,Object? config = freezed,Object? games = freezed,}) {
  return _then(_GameClientInfo(
freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as GameService?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,playerName: freezed == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as PlayerName?,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as GameConfig?,games: freezed == games ? _self.games : games // ignore: cast_nullable_to_non_nullable
as IList<GameInfo>?,
  ));
}

/// Create a copy of GameClientInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameConfigCopyWith<$Res>? get config {
    if (_self.config == null) {
    return null;
  }

  return $GameConfigCopyWith<$Res>(_self.config!, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
