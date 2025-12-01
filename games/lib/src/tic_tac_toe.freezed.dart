// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tic_tac_toe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicTacToeGameEvent {

 int get player; int get location;
/// Create a copy of TicTacToeGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicTacToeGameEventCopyWith<TicTacToeGameEvent> get copyWith => _$TicTacToeGameEventCopyWithImpl<TicTacToeGameEvent>(this as TicTacToeGameEvent, _$identity);

  /// Serializes this TicTacToeGameEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicTacToeGameEvent&&(identical(other.player, player) || other.player == player)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,player,location);

@override
String toString() {
  return 'TicTacToeGameEvent(player: $player, location: $location)';
}


}

/// @nodoc
abstract mixin class $TicTacToeGameEventCopyWith<$Res>  {
  factory $TicTacToeGameEventCopyWith(TicTacToeGameEvent value, $Res Function(TicTacToeGameEvent) _then) = _$TicTacToeGameEventCopyWithImpl;
@useResult
$Res call({
 int player, int location
});




}
/// @nodoc
class _$TicTacToeGameEventCopyWithImpl<$Res>
    implements $TicTacToeGameEventCopyWith<$Res> {
  _$TicTacToeGameEventCopyWithImpl(this._self, this._then);

  final TicTacToeGameEvent _self;
  final $Res Function(TicTacToeGameEvent) _then;

/// Create a copy of TicTacToeGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? player = null,Object? location = null,}) {
  return _then(_self.copyWith(
player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TicTacToeGameEvent].
extension TicTacToeGameEventPatterns on TicTacToeGameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicTacToeGameEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicTacToeGameEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicTacToeGameEvent value)  $default,){
final _that = this;
switch (_that) {
case _TicTacToeGameEvent():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicTacToeGameEvent value)?  $default,){
final _that = this;
switch (_that) {
case _TicTacToeGameEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int player,  int location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicTacToeGameEvent() when $default != null:
return $default(_that.player,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int player,  int location)  $default,) {final _that = this;
switch (_that) {
case _TicTacToeGameEvent():
return $default(_that.player,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int player,  int location)?  $default,) {final _that = this;
switch (_that) {
case _TicTacToeGameEvent() when $default != null:
return $default(_that.player,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicTacToeGameEvent extends TicTacToeGameEvent {
  const _TicTacToeGameEvent({required this.player, required this.location}): super._();
  factory _TicTacToeGameEvent.fromJson(Map<String, dynamic> json) => _$TicTacToeGameEventFromJson(json);

@override final  int player;
@override final  int location;

/// Create a copy of TicTacToeGameEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicTacToeGameEventCopyWith<_TicTacToeGameEvent> get copyWith => __$TicTacToeGameEventCopyWithImpl<_TicTacToeGameEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicTacToeGameEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicTacToeGameEvent&&(identical(other.player, player) || other.player == player)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,player,location);

@override
String toString() {
  return 'TicTacToeGameEvent(player: $player, location: $location)';
}


}

/// @nodoc
abstract mixin class _$TicTacToeGameEventCopyWith<$Res> implements $TicTacToeGameEventCopyWith<$Res> {
  factory _$TicTacToeGameEventCopyWith(_TicTacToeGameEvent value, $Res Function(_TicTacToeGameEvent) _then) = __$TicTacToeGameEventCopyWithImpl;
@override @useResult
$Res call({
 int player, int location
});




}
/// @nodoc
class __$TicTacToeGameEventCopyWithImpl<$Res>
    implements _$TicTacToeGameEventCopyWith<$Res> {
  __$TicTacToeGameEventCopyWithImpl(this._self, this._then);

  final _TicTacToeGameEvent _self;
  final $Res Function(_TicTacToeGameEvent) _then;

/// Create a copy of TicTacToeGameEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? player = null,Object? location = null,}) {
  return _then(_TicTacToeGameEvent(
player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TicTacToeGame {

 IList<int?> get board; int get currentPlayer; String get type;
/// Create a copy of TicTacToeGame
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicTacToeGameCopyWith<TicTacToeGame> get copyWith => _$TicTacToeGameCopyWithImpl<TicTacToeGame>(this as TicTacToeGame, _$identity);

  /// Serializes this TicTacToeGame to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicTacToeGame&&const DeepCollectionEquality().equals(other.board, board)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(board),currentPlayer,type);

@override
String toString() {
  return 'TicTacToeGame(board: $board, currentPlayer: $currentPlayer, type: $type)';
}


}

/// @nodoc
abstract mixin class $TicTacToeGameCopyWith<$Res>  {
  factory $TicTacToeGameCopyWith(TicTacToeGame value, $Res Function(TicTacToeGame) _then) = _$TicTacToeGameCopyWithImpl;
@useResult
$Res call({
 IList<int?> board, int currentPlayer, String type
});




}
/// @nodoc
class _$TicTacToeGameCopyWithImpl<$Res>
    implements $TicTacToeGameCopyWith<$Res> {
  _$TicTacToeGameCopyWithImpl(this._self, this._then);

  final TicTacToeGame _self;
  final $Res Function(TicTacToeGame) _then;

/// Create a copy of TicTacToeGame
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? board = null,Object? currentPlayer = null,Object? type = null,}) {
  return _then(_self.copyWith(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as IList<int?>,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TicTacToeGame].
extension TicTacToeGamePatterns on TicTacToeGame {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicTacToeGame value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicTacToeGame() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicTacToeGame value)  $default,){
final _that = this;
switch (_that) {
case _TicTacToeGame():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicTacToeGame value)?  $default,){
final _that = this;
switch (_that) {
case _TicTacToeGame() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IList<int?> board,  int currentPlayer,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicTacToeGame() when $default != null:
return $default(_that.board,_that.currentPlayer,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IList<int?> board,  int currentPlayer,  String type)  $default,) {final _that = this;
switch (_that) {
case _TicTacToeGame():
return $default(_that.board,_that.currentPlayer,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IList<int?> board,  int currentPlayer,  String type)?  $default,) {final _that = this;
switch (_that) {
case _TicTacToeGame() when $default != null:
return $default(_that.board,_that.currentPlayer,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicTacToeGame extends TicTacToeGame {
  const _TicTacToeGame({required this.board, required this.currentPlayer, this.type = 'tictactoe'}): super._();
  factory _TicTacToeGame.fromJson(Map<String, dynamic> json) => _$TicTacToeGameFromJson(json);

@override final  IList<int?> board;
@override final  int currentPlayer;
@override@JsonKey() final  String type;

/// Create a copy of TicTacToeGame
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicTacToeGameCopyWith<_TicTacToeGame> get copyWith => __$TicTacToeGameCopyWithImpl<_TicTacToeGame>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicTacToeGameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicTacToeGame&&const DeepCollectionEquality().equals(other.board, board)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(board),currentPlayer,type);

@override
String toString() {
  return 'TicTacToeGame(board: $board, currentPlayer: $currentPlayer, type: $type)';
}


}

/// @nodoc
abstract mixin class _$TicTacToeGameCopyWith<$Res> implements $TicTacToeGameCopyWith<$Res> {
  factory _$TicTacToeGameCopyWith(_TicTacToeGame value, $Res Function(_TicTacToeGame) _then) = __$TicTacToeGameCopyWithImpl;
@override @useResult
$Res call({
 IList<int?> board, int currentPlayer, String type
});




}
/// @nodoc
class __$TicTacToeGameCopyWithImpl<$Res>
    implements _$TicTacToeGameCopyWith<$Res> {
  __$TicTacToeGameCopyWithImpl(this._self, this._then);

  final _TicTacToeGame _self;
  final $Res Function(_TicTacToeGame) _then;

/// Create a copy of TicTacToeGame
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? board = null,Object? currentPlayer = null,Object? type = null,}) {
  return _then(_TicTacToeGame(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as IList<int?>,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
