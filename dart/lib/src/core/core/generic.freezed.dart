// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenericGame {

 DateTime get time; GameStatus get status; int get round; IList<Player> get players; IList<PlayerID> get readyPlayers;
/// Create a copy of GenericGame
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenericGameCopyWith<GenericGame> get copyWith => _$GenericGameCopyWithImpl<GenericGame>(this as GenericGame, _$identity);

  /// Serializes this GenericGame to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GenericGame;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenericGame&&(identical(other.time, _this.time) || other.time == _this.time)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.round, _this.round) || other.round == _this.round)&&const DeepCollectionEquality().equals(other.players, _this.players)&&const DeepCollectionEquality().equals(other.readyPlayers, _this.readyPlayers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GenericGame;
  return Object.hash(runtimeType,_this.time,_this.status,_this.round,const DeepCollectionEquality().hash(_this.players),const DeepCollectionEquality().hash(_this.readyPlayers));
}

@override
String toString() {
  final _this = this as GenericGame;
  return 'GenericGame(time: ${_this.time}, status: ${_this.status}, round: ${_this.round}, players: ${_this.players}, readyPlayers: ${_this.readyPlayers})';
}


}

/// @nodoc
abstract mixin class $GenericGameCopyWith<$Res>  {
  factory $GenericGameCopyWith(GenericGame value, $Res Function(GenericGame) _then) = _$GenericGameCopyWithImpl;
@useResult
$Res call({
 DateTime time, GameStatus status, int round, IList<Player> players, IList<PlayerID> readyPlayers
});




}
/// @nodoc
class _$GenericGameCopyWithImpl<$Res>
    implements $GenericGameCopyWith<$Res> {
  _$GenericGameCopyWithImpl(this._self, this._then);

  final GenericGame _self;
  final $Res Function(GenericGame) _then;

/// Create a copy of GenericGame
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? status = null,Object? round = null,Object? players = null,Object? readyPlayers = null,}) {
  return _then(GenericGame(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as IList<Player>,readyPlayers: null == readyPlayers ? _self.readyPlayers : readyPlayers // ignore: cast_nullable_to_non_nullable
as IList<PlayerID>,
  ));
}

}


/// Adds pattern-matching-related methods to [GenericGame].
extension GenericGamePatterns on GenericGame {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenericGame value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenericGame() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenericGame value)  $default,){
final _that = this;
switch (_that) {
case _GenericGame():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenericGame value)?  $default,){
final _that = this;
switch (_that) {
case _GenericGame() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time,  GameStatus status,  int round,  IList<Player> players,  IList<PlayerID> readyPlayers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenericGame() when $default != null:
return $default(_that.time,_that.status,_that.round,_that.players,_that.readyPlayers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time,  GameStatus status,  int round,  IList<Player> players,  IList<PlayerID> readyPlayers)  $default,) {final _that = this;
switch (_that) {
case _GenericGame():
return $default(_that.time,_that.status,_that.round,_that.players,_that.readyPlayers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time,  GameStatus status,  int round,  IList<Player> players,  IList<PlayerID> readyPlayers)?  $default,) {final _that = this;
switch (_that) {
case _GenericGame() when $default != null:
return $default(_that.time,_that.status,_that.round,_that.players,_that.readyPlayers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenericGame extends GenericGame {
  const _GenericGame({required this.time, required this.status, required this.round, this.players = const IListConst([]), this.readyPlayers = const IListConst([])}): super._();
  factory _GenericGame.fromJson(Map<String, dynamic> json) => _$GenericGameFromJson(json);

@override final  DateTime time;
@override final  GameStatus status;
@override final  int round;
@override@JsonKey() final  IList<Player> players;
@override@JsonKey() final  IList<PlayerID> readyPlayers;

/// Create a copy of GenericGame
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenericGameCopyWith<_GenericGame> get copyWith => __$GenericGameCopyWithImpl<_GenericGame>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenericGameToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenericGame&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.round, round) || other.round == round)&&const DeepCollectionEquality().equals(other.players, players)&&const DeepCollectionEquality().equals(other.readyPlayers, readyPlayers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,time,status,round,const DeepCollectionEquality().hash(players),const DeepCollectionEquality().hash(readyPlayers));
}

@override
String toString() {
    return 'GenericGame(time: $time, status: $status, round: $round, players: $players, readyPlayers: $readyPlayers)';
}


}

/// @nodoc
abstract mixin class _$GenericGameCopyWith<$Res> implements $GenericGameCopyWith<$Res> {
  factory _$GenericGameCopyWith(_GenericGame value, $Res Function(_GenericGame) _then) = __$GenericGameCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, GameStatus status, int round, IList<Player> players, IList<PlayerID> readyPlayers
});




}
/// @nodoc
class __$GenericGameCopyWithImpl<$Res>
    implements _$GenericGameCopyWith<$Res> {
  __$GenericGameCopyWithImpl(this._self, this._then);

  final _GenericGame _self;
  final $Res Function(_GenericGame) _then;

/// Create a copy of GenericGame
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? status = null,Object? round = null,Object? players = null,Object? readyPlayers = null,}) {
  return _then(_GenericGame(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as IList<Player>,readyPlayers: null == readyPlayers ? _self.readyPlayers : readyPlayers // ignore: cast_nullable_to_non_nullable
as IList<PlayerID>,
  ));
}


}

GenericEvent _$GenericEventFromJson(
  Map<String, dynamic> json
) {
    return _GenericReadyNextRoundEvent.fromJson(
      json
    );
}

/// @nodoc
mixin _$GenericEvent {

 String get player; String get type;
/// Create a copy of GenericEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenericEventCopyWith<GenericEvent> get copyWith => _$GenericEventCopyWithImpl<GenericEvent>(this as GenericEvent, _$identity);

  /// Serializes this GenericEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GenericEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenericEvent&&(identical(other.player, _this.player) || other.player == _this.player)&&(identical(other.type, _this.type) || other.type == _this.type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GenericEvent;
  return Object.hash(runtimeType,_this.player,_this.type);
}

@override
String toString() {
  final _this = this as GenericEvent;
  return 'GenericEvent(player: ${_this.player}, type: ${_this.type})';
}


}

/// @nodoc
abstract mixin class $GenericEventCopyWith<$Res>  {
  factory $GenericEventCopyWith(GenericEvent value, $Res Function(GenericEvent) _then) = _$GenericEventCopyWithImpl;
@useResult
$Res call({
 String player, String type
});




}
/// @nodoc
class _$GenericEventCopyWithImpl<$Res>
    implements $GenericEventCopyWith<$Res> {
  _$GenericEventCopyWithImpl(this._self, this._then);

  final GenericEvent _self;
  final $Res Function(GenericEvent) _then;

/// Create a copy of GenericEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? player = null,Object? type = null,}) {
  return _then(_self.copyWith(
player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GenericEvent].
extension GenericEventPatterns on GenericEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GenericReadyNextRoundEvent value)?  readyNextRound,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenericReadyNextRoundEvent() when readyNextRound != null:
return readyNextRound(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GenericReadyNextRoundEvent value)  readyNextRound,}){
final _that = this;
switch (_that) {
case _GenericReadyNextRoundEvent():
return readyNextRound(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GenericReadyNextRoundEvent value)?  readyNextRound,}){
final _that = this;
switch (_that) {
case _GenericReadyNextRoundEvent() when readyNextRound != null:
return readyNextRound(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String player,  String type)?  readyNextRound,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenericReadyNextRoundEvent() when readyNextRound != null:
return readyNextRound(_that.player,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String player,  String type)  readyNextRound,}) {final _that = this;
switch (_that) {
case _GenericReadyNextRoundEvent():
return readyNextRound(_that.player,_that.type);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String player,  String type)?  readyNextRound,}) {final _that = this;
switch (_that) {
case _GenericReadyNextRoundEvent() when readyNextRound != null:
return readyNextRound(_that.player,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenericReadyNextRoundEvent extends GenericEvent {
  const _GenericReadyNextRoundEvent(this.player, {this.type = 'generic'}): super._();
  factory _GenericReadyNextRoundEvent.fromJson(Map<String, dynamic> json) => _$GenericReadyNextRoundEventFromJson(json);

@override final  String player;
@override@JsonKey() final  String type;

/// Create a copy of GenericEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenericReadyNextRoundEventCopyWith<_GenericReadyNextRoundEvent> get copyWith => __$GenericReadyNextRoundEventCopyWithImpl<_GenericReadyNextRoundEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenericReadyNextRoundEventToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenericReadyNextRoundEvent&&(identical(other.player, player) || other.player == player)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,player,type);
}

@override
String toString() {
    return 'GenericEvent.readyNextRound(player: $player, type: $type)';
}


}

/// @nodoc
abstract mixin class _$GenericReadyNextRoundEventCopyWith<$Res> implements $GenericEventCopyWith<$Res> {
  factory _$GenericReadyNextRoundEventCopyWith(_GenericReadyNextRoundEvent value, $Res Function(_GenericReadyNextRoundEvent) _then) = __$GenericReadyNextRoundEventCopyWithImpl;
@override @useResult
$Res call({
 String player, String type
});




}
/// @nodoc
class __$GenericReadyNextRoundEventCopyWithImpl<$Res>
    implements _$GenericReadyNextRoundEventCopyWith<$Res> {
  __$GenericReadyNextRoundEventCopyWithImpl(this._self, this._then);

  final _GenericReadyNextRoundEvent _self;
  final $Res Function(_GenericReadyNextRoundEvent) _then;

/// Create a copy of GenericEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? player = null,Object? type = null,}) {
  return _then(_GenericReadyNextRoundEvent(
null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GameConfig {

 GameType get gameType; PlayerID? get adminID; NameSet get nameSet; bool get customNames; int get rounds; int get minPlayers; int get maxPlayers; bool get autoStart; Map<String, Object?> get options;
/// Create a copy of GameConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameConfigCopyWith<GameConfig> get copyWith => _$GameConfigCopyWithImpl<GameConfig>(this as GameConfig, _$identity);

  /// Serializes this GameConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GameConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameConfig&&(identical(other.gameType, _this.gameType) || other.gameType == _this.gameType)&&(identical(other.adminID, _this.adminID) || other.adminID == _this.adminID)&&(identical(other.nameSet, _this.nameSet) || other.nameSet == _this.nameSet)&&(identical(other.customNames, _this.customNames) || other.customNames == _this.customNames)&&(identical(other.rounds, _this.rounds) || other.rounds == _this.rounds)&&(identical(other.minPlayers, _this.minPlayers) || other.minPlayers == _this.minPlayers)&&(identical(other.maxPlayers, _this.maxPlayers) || other.maxPlayers == _this.maxPlayers)&&(identical(other.autoStart, _this.autoStart) || other.autoStart == _this.autoStart)&&const DeepCollectionEquality().equals(other.options, _this.options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GameConfig;
  return Object.hash(runtimeType,_this.gameType,_this.adminID,_this.nameSet,_this.customNames,_this.rounds,_this.minPlayers,_this.maxPlayers,_this.autoStart,const DeepCollectionEquality().hash(_this.options));
}

@override
String toString() {
  final _this = this as GameConfig;
  return 'GameConfig(gameType: ${_this.gameType}, adminID: ${_this.adminID}, nameSet: ${_this.nameSet}, customNames: ${_this.customNames}, rounds: ${_this.rounds}, minPlayers: ${_this.minPlayers}, maxPlayers: ${_this.maxPlayers}, autoStart: ${_this.autoStart}, options: ${_this.options})';
}


}

/// @nodoc
abstract mixin class $GameConfigCopyWith<$Res>  {
  factory $GameConfigCopyWith(GameConfig value, $Res Function(GameConfig) _then) = _$GameConfigCopyWithImpl;
@useResult
$Res call({
 GameType gameType, PlayerID? adminID, NameSet nameSet, bool customNames, int rounds, int minPlayers, int maxPlayers, bool autoStart, Map<String, Object?> options
});




}
/// @nodoc
class _$GameConfigCopyWithImpl<$Res>
    implements $GameConfigCopyWith<$Res> {
  _$GameConfigCopyWithImpl(this._self, this._then);

  final GameConfig _self;
  final $Res Function(GameConfig) _then;

/// Create a copy of GameConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gameType = null,Object? adminID = freezed,Object? nameSet = null,Object? customNames = null,Object? rounds = null,Object? minPlayers = null,Object? maxPlayers = null,Object? autoStart = null,Object? options = null,}) {
  return _then(GameConfig(
gameType: null == gameType ? _self.gameType : gameType // ignore: cast_nullable_to_non_nullable
as GameType,adminID: freezed == adminID ? _self.adminID : adminID // ignore: cast_nullable_to_non_nullable
as PlayerID?,nameSet: null == nameSet ? _self.nameSet : nameSet // ignore: cast_nullable_to_non_nullable
as NameSet,customNames: null == customNames ? _self.customNames : customNames // ignore: cast_nullable_to_non_nullable
as bool,rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as int,minPlayers: null == minPlayers ? _self.minPlayers : minPlayers // ignore: cast_nullable_to_non_nullable
as int,maxPlayers: null == maxPlayers ? _self.maxPlayers : maxPlayers // ignore: cast_nullable_to_non_nullable
as int,autoStart: null == autoStart ? _self.autoStart : autoStart // ignore: cast_nullable_to_non_nullable
as bool,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameConfig].
extension GameConfigPatterns on GameConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameConfig value)  $default,){
final _that = this;
switch (_that) {
case _GameConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameConfig value)?  $default,){
final _that = this;
switch (_that) {
case _GameConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GameType gameType,  PlayerID? adminID,  NameSet nameSet,  bool customNames,  int rounds,  int minPlayers,  int maxPlayers,  bool autoStart,  Map<String, Object?> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameConfig() when $default != null:
return $default(_that.gameType,_that.adminID,_that.nameSet,_that.customNames,_that.rounds,_that.minPlayers,_that.maxPlayers,_that.autoStart,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GameType gameType,  PlayerID? adminID,  NameSet nameSet,  bool customNames,  int rounds,  int minPlayers,  int maxPlayers,  bool autoStart,  Map<String, Object?> options)  $default,) {final _that = this;
switch (_that) {
case _GameConfig():
return $default(_that.gameType,_that.adminID,_that.nameSet,_that.customNames,_that.rounds,_that.minPlayers,_that.maxPlayers,_that.autoStart,_that.options);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GameType gameType,  PlayerID? adminID,  NameSet nameSet,  bool customNames,  int rounds,  int minPlayers,  int maxPlayers,  bool autoStart,  Map<String, Object?> options)?  $default,) {final _that = this;
switch (_that) {
case _GameConfig() when $default != null:
return $default(_that.gameType,_that.adminID,_that.nameSet,_that.customNames,_that.rounds,_that.minPlayers,_that.maxPlayers,_that.autoStart,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameConfig extends GameConfig {
  const _GameConfig({required this.gameType, this.adminID, this.nameSet = NameSet.basic, this.customNames = false, this.rounds = 15, this.minPlayers = 1, this.maxPlayers = 20, this.autoStart = true,  Map<String, Object?> options = const {}}): _options = options,super._();
  factory _GameConfig.fromJson(Map<String, dynamic> json) => _$GameConfigFromJson(json);

@override final  GameType gameType;
@override final  PlayerID? adminID;
@override@JsonKey() final  NameSet nameSet;
@override@JsonKey() final  bool customNames;
@override@JsonKey() final  int rounds;
@override@JsonKey() final  int minPlayers;
@override@JsonKey() final  int maxPlayers;
@override@JsonKey() final  bool autoStart;
 final  Map<String, Object?> _options;
@override@JsonKey() Map<String, Object?> get options {
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_options);
}


/// Create a copy of GameConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameConfigCopyWith<_GameConfig> get copyWith => __$GameConfigCopyWithImpl<_GameConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameConfigToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameConfig&&(identical(other.gameType, gameType) || other.gameType == gameType)&&(identical(other.adminID, adminID) || other.adminID == adminID)&&(identical(other.nameSet, nameSet) || other.nameSet == nameSet)&&(identical(other.customNames, customNames) || other.customNames == customNames)&&(identical(other.rounds, rounds) || other.rounds == rounds)&&(identical(other.minPlayers, minPlayers) || other.minPlayers == minPlayers)&&(identical(other.maxPlayers, maxPlayers) || other.maxPlayers == maxPlayers)&&(identical(other.autoStart, autoStart) || other.autoStart == autoStart)&&const DeepCollectionEquality().equals(other.options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,gameType,adminID,nameSet,customNames,rounds,minPlayers,maxPlayers,autoStart,const DeepCollectionEquality().hash(_options));
}

@override
String toString() {
    return 'GameConfig(gameType: $gameType, adminID: $adminID, nameSet: $nameSet, customNames: $customNames, rounds: $rounds, minPlayers: $minPlayers, maxPlayers: $maxPlayers, autoStart: $autoStart, options: $options)';
}


}

/// @nodoc
abstract mixin class _$GameConfigCopyWith<$Res> implements $GameConfigCopyWith<$Res> {
  factory _$GameConfigCopyWith(_GameConfig value, $Res Function(_GameConfig) _then) = __$GameConfigCopyWithImpl;
@override @useResult
$Res call({
 GameType gameType, PlayerID? adminID, NameSet nameSet, bool customNames, int rounds, int minPlayers, int maxPlayers, bool autoStart, Map<String, Object?> options
});




}
/// @nodoc
class __$GameConfigCopyWithImpl<$Res>
    implements _$GameConfigCopyWith<$Res> {
  __$GameConfigCopyWithImpl(this._self, this._then);

  final _GameConfig _self;
  final $Res Function(_GameConfig) _then;

/// Create a copy of GameConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gameType = null,Object? adminID = freezed,Object? nameSet = null,Object? customNames = null,Object? rounds = null,Object? minPlayers = null,Object? maxPlayers = null,Object? autoStart = null,Object? options = null,}) {
  return _then(_GameConfig(
gameType: null == gameType ? _self.gameType : gameType // ignore: cast_nullable_to_non_nullable
as GameType,adminID: freezed == adminID ? _self.adminID : adminID // ignore: cast_nullable_to_non_nullable
as PlayerID?,nameSet: null == nameSet ? _self.nameSet : nameSet // ignore: cast_nullable_to_non_nullable
as NameSet,customNames: null == customNames ? _self.customNames : customNames // ignore: cast_nullable_to_non_nullable
as bool,rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as int,minPlayers: null == minPlayers ? _self.minPlayers : minPlayers // ignore: cast_nullable_to_non_nullable
as int,maxPlayers: null == maxPlayers ? _self.maxPlayers : maxPlayers // ignore: cast_nullable_to_non_nullable
as int,autoStart: null == autoStart ? _self.autoStart : autoStart // ignore: cast_nullable_to_non_nullable
as bool,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$GameInfo {

 GameCode get gameID; IList<PlayerName> get players; PlayerName get player; bool get creator; GameConfig get config; GameStatus get status;
/// Create a copy of GameInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameInfoCopyWith<GameInfo> get copyWith => _$GameInfoCopyWithImpl<GameInfo>(this as GameInfo, _$identity);

  /// Serializes this GameInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GameInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameInfo&&(identical(other.gameID, _this.gameID) || other.gameID == _this.gameID)&&const DeepCollectionEquality().equals(other.players, _this.players)&&(identical(other.player, _this.player) || other.player == _this.player)&&(identical(other.creator, _this.creator) || other.creator == _this.creator)&&(identical(other.config, _this.config) || other.config == _this.config)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GameInfo;
  return Object.hash(runtimeType,_this.gameID,const DeepCollectionEquality().hash(_this.players),_this.player,_this.creator,_this.config,_this.status);
}

@override
String toString() {
  final _this = this as GameInfo;
  return 'GameInfo(gameID: ${_this.gameID}, players: ${_this.players}, player: ${_this.player}, creator: ${_this.creator}, config: ${_this.config}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $GameInfoCopyWith<$Res>  {
  factory $GameInfoCopyWith(GameInfo value, $Res Function(GameInfo) _then) = _$GameInfoCopyWithImpl;
@useResult
$Res call({
 GameCode gameID, IList<PlayerName> players, PlayerName player, bool creator, GameConfig config, GameStatus status
});


$GameConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$GameInfoCopyWithImpl<$Res>
    implements $GameInfoCopyWith<$Res> {
  _$GameInfoCopyWithImpl(this._self, this._then);

  final GameInfo _self;
  final $Res Function(GameInfo) _then;

/// Create a copy of GameInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gameID = null,Object? players = null,Object? player = null,Object? creator = null,Object? config = null,Object? status = null,}) {
  return _then(GameInfo(
gameID: null == gameID ? _self.gameID : gameID // ignore: cast_nullable_to_non_nullable
as GameCode,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as IList<PlayerName>,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerName,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as bool,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as GameConfig,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [GameInfo].
extension GameInfoPatterns on GameInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameInfo value)  $default,){
final _that = this;
switch (_that) {
case _GameInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameInfo value)?  $default,){
final _that = this;
switch (_that) {
case _GameInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GameCode gameID,  IList<PlayerName> players,  PlayerName player,  bool creator,  GameConfig config,  GameStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameInfo() when $default != null:
return $default(_that.gameID,_that.players,_that.player,_that.creator,_that.config,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GameCode gameID,  IList<PlayerName> players,  PlayerName player,  bool creator,  GameConfig config,  GameStatus status)  $default,) {final _that = this;
switch (_that) {
case _GameInfo():
return $default(_that.gameID,_that.players,_that.player,_that.creator,_that.config,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GameCode gameID,  IList<PlayerName> players,  PlayerName player,  bool creator,  GameConfig config,  GameStatus status)?  $default,) {final _that = this;
switch (_that) {
case _GameInfo() when $default != null:
return $default(_that.gameID,_that.players,_that.player,_that.creator,_that.config,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameInfo implements GameInfo {
  const _GameInfo({required this.gameID, required this.players, required this.player, required this.creator, required this.config, required this.status});
  factory _GameInfo.fromJson(Map<String, dynamic> json) => _$GameInfoFromJson(json);

@override final  GameCode gameID;
@override final  IList<PlayerName> players;
@override final  PlayerName player;
@override final  bool creator;
@override final  GameConfig config;
@override final  GameStatus status;

/// Create a copy of GameInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameInfoCopyWith<_GameInfo> get copyWith => __$GameInfoCopyWithImpl<_GameInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameInfo&&(identical(other.gameID, gameID) || other.gameID == gameID)&&const DeepCollectionEquality().equals(other.players, players)&&(identical(other.player, player) || other.player == player)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.config, config) || other.config == config)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,gameID,const DeepCollectionEquality().hash(players),player,creator,config,status);
}

@override
String toString() {
    return 'GameInfo(gameID: $gameID, players: $players, player: $player, creator: $creator, config: $config, status: $status)';
}


}

/// @nodoc
abstract mixin class _$GameInfoCopyWith<$Res> implements $GameInfoCopyWith<$Res> {
  factory _$GameInfoCopyWith(_GameInfo value, $Res Function(_GameInfo) _then) = __$GameInfoCopyWithImpl;
@override @useResult
$Res call({
 GameCode gameID, IList<PlayerName> players, PlayerName player, bool creator, GameConfig config, GameStatus status
});


@override $GameConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$GameInfoCopyWithImpl<$Res>
    implements _$GameInfoCopyWith<$Res> {
  __$GameInfoCopyWithImpl(this._self, this._then);

  final _GameInfo _self;
  final $Res Function(_GameInfo) _then;

/// Create a copy of GameInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gameID = null,Object? players = null,Object? player = null,Object? creator = null,Object? config = null,Object? status = null,}) {
  return _then(_GameInfo(
gameID: null == gameID ? _self.gameID : gameID // ignore: cast_nullable_to_non_nullable
as GameCode,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as IList<PlayerName>,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerName,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as bool,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as GameConfig,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
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

 GameCode get code; GameConfig get config; GameStatus get gameStatus; ISet<Player> get players;
/// Create a copy of Lobby
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LobbyCopyWith<Lobby> get copyWith => _$LobbyCopyWithImpl<Lobby>(this as Lobby, _$identity);

  /// Serializes this Lobby to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Lobby;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lobby&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.config, _this.config) || other.config == _this.config)&&(identical(other.gameStatus, _this.gameStatus) || other.gameStatus == _this.gameStatus)&&const DeepCollectionEquality().equals(other.players, _this.players));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Lobby;
  return Object.hash(runtimeType,_this.code,_this.config,_this.gameStatus,const DeepCollectionEquality().hash(_this.players));
}

@override
String toString() {
  final _this = this as Lobby;
  return 'Lobby(code: ${_this.code}, config: ${_this.config}, gameStatus: ${_this.gameStatus}, players: ${_this.players})';
}


}

/// @nodoc
abstract mixin class $LobbyCopyWith<$Res>  {
  factory $LobbyCopyWith(Lobby value, $Res Function(Lobby) _then) = _$LobbyCopyWithImpl;
@useResult
$Res call({
 GameCode code, GameConfig config, GameStatus gameStatus, ISet<Player> players
});


$GameConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$LobbyCopyWithImpl<$Res>
    implements $LobbyCopyWith<$Res> {
  _$LobbyCopyWithImpl(this._self, this._then);

  final Lobby _self;
  final $Res Function(Lobby) _then;

/// Create a copy of Lobby
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? config = null,Object? gameStatus = null,Object? players = null,}) {
  return _then(Lobby(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as GameCode,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as GameConfig,gameStatus: null == gameStatus ? _self.gameStatus : gameStatus // ignore: cast_nullable_to_non_nullable
as GameStatus,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [Lobby].
extension LobbyPatterns on Lobby {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lobby value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lobby() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lobby value)  $default,){
final _that = this;
switch (_that) {
case _Lobby():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lobby value)?  $default,){
final _that = this;
switch (_that) {
case _Lobby() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GameCode code,  GameConfig config,  GameStatus gameStatus,  ISet<Player> players)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lobby() when $default != null:
return $default(_that.code,_that.config,_that.gameStatus,_that.players);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GameCode code,  GameConfig config,  GameStatus gameStatus,  ISet<Player> players)  $default,) {final _that = this;
switch (_that) {
case _Lobby():
return $default(_that.code,_that.config,_that.gameStatus,_that.players);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GameCode code,  GameConfig config,  GameStatus gameStatus,  ISet<Player> players)?  $default,) {final _that = this;
switch (_that) {
case _Lobby() when $default != null:
return $default(_that.code,_that.config,_that.gameStatus,_that.players);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lobby implements Lobby {
  const _Lobby({required this.code, required this.config, required this.gameStatus, this.players = const ISetConst({})});
  factory _Lobby.fromJson(Map<String, dynamic> json) => _$LobbyFromJson(json);

@override final  GameCode code;
@override final  GameConfig config;
@override final  GameStatus gameStatus;
@override@JsonKey() final  ISet<Player> players;

/// Create a copy of Lobby
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LobbyCopyWith<_Lobby> get copyWith => __$LobbyCopyWithImpl<_Lobby>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LobbyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lobby&&(identical(other.code, code) || other.code == code)&&(identical(other.config, config) || other.config == config)&&(identical(other.gameStatus, gameStatus) || other.gameStatus == gameStatus)&&const DeepCollectionEquality().equals(other.players, players));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,config,gameStatus,const DeepCollectionEquality().hash(players));
}

@override
String toString() {
    return 'Lobby(code: $code, config: $config, gameStatus: $gameStatus, players: $players)';
}


}

/// @nodoc
abstract mixin class _$LobbyCopyWith<$Res> implements $LobbyCopyWith<$Res> {
  factory _$LobbyCopyWith(_Lobby value, $Res Function(_Lobby) _then) = __$LobbyCopyWithImpl;
@override @useResult
$Res call({
 GameCode code, GameConfig config, GameStatus gameStatus, ISet<Player> players
});


@override $GameConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$LobbyCopyWithImpl<$Res>
    implements _$LobbyCopyWith<$Res> {
  __$LobbyCopyWithImpl(this._self, this._then);

  final _Lobby _self;
  final $Res Function(_Lobby) _then;

/// Create a copy of Lobby
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? config = null,Object? gameStatus = null,Object? players = null,}) {
  return _then(_Lobby(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as GameCode,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as GameConfig,gameStatus: null == gameStatus ? _self.gameStatus : gameStatus // ignore: cast_nullable_to_non_nullable
as GameStatus,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
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
