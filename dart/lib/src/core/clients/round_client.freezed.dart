// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'round_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoundServiceRequest<T> _$RoundServiceRequestFromJson<T extends Event>(
    Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
  switch (json['runtimeType']) {
    case 'sendEvent':
      return SendEventRequest<T>.fromJson(json, fromJsonT);
    case 'watchGame':
      return WatchGameRequest<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RoundServiceRequest',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$RoundServiceRequestTearOff {
  const _$RoundServiceRequestTearOff();

  SendEventRequest<T> sendEvent<T extends Event>(
      {required String playerID, required String code, required T event}) {
    return SendEventRequest<T>(
      playerID: playerID,
      code: code,
      event: event,
    );
  }

  WatchGameRequest<T> watchGame<T extends Event>(
      {required String playerID, required String code}) {
    return WatchGameRequest<T>(
      playerID: playerID,
      code: code,
    );
  }

  RoundServiceRequest<T> fromJson<T extends Event>(
      Map<String, Object?> json, T Function(Object? json) fromJsonT) {
    return RoundServiceRequest<T>.fromJson(json, fromJsonT);
  }
}

/// @nodoc
const $RoundServiceRequest = _$RoundServiceRequestTearOff();

/// @nodoc
mixin _$RoundServiceRequest<T extends Event> {
  String get playerID => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code, T event) sendEvent,
    required TResult Function(String playerID, String code) watchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code, T event)? sendEvent,
    TResult Function(String playerID, String code)? watchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerID, String code, T event)? sendEvent,
    TResult Function(String playerID, String code)? watchGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEventRequest<T> value) sendEvent,
    required TResult Function(WatchGameRequest<T> value) watchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendEventRequest<T> value)? sendEvent,
    TResult Function(WatchGameRequest<T> value)? watchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventRequest<T> value)? sendEvent,
    TResult Function(WatchGameRequest<T> value)? watchGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoundServiceRequestCopyWith<T, RoundServiceRequest<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundServiceRequestCopyWith<T extends Event, $Res> {
  factory $RoundServiceRequestCopyWith(RoundServiceRequest<T> value,
          $Res Function(RoundServiceRequest<T>) then) =
      _$RoundServiceRequestCopyWithImpl<T, $Res>;
  $Res call({String playerID, String code});
}

/// @nodoc
class _$RoundServiceRequestCopyWithImpl<T extends Event, $Res>
    implements $RoundServiceRequestCopyWith<T, $Res> {
  _$RoundServiceRequestCopyWithImpl(this._value, this._then);

  final RoundServiceRequest<T> _value;
  // ignore: unused_field
  final $Res Function(RoundServiceRequest<T>) _then;

  @override
  $Res call({
    Object? playerID = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      playerID: playerID == freezed
          ? _value.playerID
          : playerID // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $SendEventRequestCopyWith<T extends Event, $Res>
    implements $RoundServiceRequestCopyWith<T, $Res> {
  factory $SendEventRequestCopyWith(
          SendEventRequest<T> value, $Res Function(SendEventRequest<T>) then) =
      _$SendEventRequestCopyWithImpl<T, $Res>;
  @override
  $Res call({String playerID, String code, T event});
}

/// @nodoc
class _$SendEventRequestCopyWithImpl<T extends Event, $Res>
    extends _$RoundServiceRequestCopyWithImpl<T, $Res>
    implements $SendEventRequestCopyWith<T, $Res> {
  _$SendEventRequestCopyWithImpl(
      SendEventRequest<T> _value, $Res Function(SendEventRequest<T>) _then)
      : super(_value, (v) => _then(v as SendEventRequest<T>));

  @override
  SendEventRequest<T> get _value => super._value as SendEventRequest<T>;

  @override
  $Res call({
    Object? playerID = freezed,
    Object? code = freezed,
    Object? event = freezed,
  }) {
    return _then(SendEventRequest<T>(
      playerID: playerID == freezed
          ? _value.playerID
          : playerID // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$SendEventRequest<T extends Event> implements SendEventRequest<T> {
  const _$SendEventRequest(
      {required this.playerID,
      required this.code,
      required this.event,
      String? $type})
      : $type = $type ?? 'sendEvent';

  factory _$SendEventRequest.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$$SendEventRequestFromJson(json, fromJsonT);

  @override
  final String playerID;
  @override
  final String code;
  @override
  final T event;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoundServiceRequest<$T>.sendEvent(playerID: $playerID, code: $code, event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SendEventRequest<T> &&
            const DeepCollectionEquality().equals(other.playerID, playerID) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.event, event));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerID),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(event));

  @JsonKey(ignore: true)
  @override
  $SendEventRequestCopyWith<T, SendEventRequest<T>> get copyWith =>
      _$SendEventRequestCopyWithImpl<T, SendEventRequest<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code, T event) sendEvent,
    required TResult Function(String playerID, String code) watchGame,
  }) {
    return sendEvent(playerID, code, event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code, T event)? sendEvent,
    TResult Function(String playerID, String code)? watchGame,
  }) {
    return sendEvent?.call(playerID, code, event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerID, String code, T event)? sendEvent,
    TResult Function(String playerID, String code)? watchGame,
    required TResult orElse(),
  }) {
    if (sendEvent != null) {
      return sendEvent(playerID, code, event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEventRequest<T> value) sendEvent,
    required TResult Function(WatchGameRequest<T> value) watchGame,
  }) {
    return sendEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendEventRequest<T> value)? sendEvent,
    TResult Function(WatchGameRequest<T> value)? watchGame,
  }) {
    return sendEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventRequest<T> value)? sendEvent,
    TResult Function(WatchGameRequest<T> value)? watchGame,
    required TResult orElse(),
  }) {
    if (sendEvent != null) {
      return sendEvent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return _$$SendEventRequestToJson(this, toJsonT);
  }
}

abstract class SendEventRequest<T extends Event>
    implements RoundServiceRequest<T> {
  const factory SendEventRequest(
      {required String playerID,
      required String code,
      required T event}) = _$SendEventRequest<T>;

  factory SendEventRequest.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =
      _$SendEventRequest<T>.fromJson;

  @override
  String get playerID;
  @override
  String get code;
  T get event;
  @override
  @JsonKey(ignore: true)
  $SendEventRequestCopyWith<T, SendEventRequest<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchGameRequestCopyWith<T extends Event, $Res>
    implements $RoundServiceRequestCopyWith<T, $Res> {
  factory $WatchGameRequestCopyWith(
          WatchGameRequest<T> value, $Res Function(WatchGameRequest<T>) then) =
      _$WatchGameRequestCopyWithImpl<T, $Res>;
  @override
  $Res call({String playerID, String code});
}

/// @nodoc
class _$WatchGameRequestCopyWithImpl<T extends Event, $Res>
    extends _$RoundServiceRequestCopyWithImpl<T, $Res>
    implements $WatchGameRequestCopyWith<T, $Res> {
  _$WatchGameRequestCopyWithImpl(
      WatchGameRequest<T> _value, $Res Function(WatchGameRequest<T>) _then)
      : super(_value, (v) => _then(v as WatchGameRequest<T>));

  @override
  WatchGameRequest<T> get _value => super._value as WatchGameRequest<T>;

  @override
  $Res call({
    Object? playerID = freezed,
    Object? code = freezed,
  }) {
    return _then(WatchGameRequest<T>(
      playerID: playerID == freezed
          ? _value.playerID
          : playerID // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$WatchGameRequest<T extends Event> implements WatchGameRequest<T> {
  const _$WatchGameRequest(
      {required this.playerID, required this.code, String? $type})
      : $type = $type ?? 'watchGame';

  factory _$WatchGameRequest.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$$WatchGameRequestFromJson(json, fromJsonT);

  @override
  final String playerID;
  @override
  final String code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoundServiceRequest<$T>.watchGame(playerID: $playerID, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchGameRequest<T> &&
            const DeepCollectionEquality().equals(other.playerID, playerID) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerID),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  $WatchGameRequestCopyWith<T, WatchGameRequest<T>> get copyWith =>
      _$WatchGameRequestCopyWithImpl<T, WatchGameRequest<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code, T event) sendEvent,
    required TResult Function(String playerID, String code) watchGame,
  }) {
    return watchGame(playerID, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code, T event)? sendEvent,
    TResult Function(String playerID, String code)? watchGame,
  }) {
    return watchGame?.call(playerID, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerID, String code, T event)? sendEvent,
    TResult Function(String playerID, String code)? watchGame,
    required TResult orElse(),
  }) {
    if (watchGame != null) {
      return watchGame(playerID, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEventRequest<T> value) sendEvent,
    required TResult Function(WatchGameRequest<T> value) watchGame,
  }) {
    return watchGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendEventRequest<T> value)? sendEvent,
    TResult Function(WatchGameRequest<T> value)? watchGame,
  }) {
    return watchGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventRequest<T> value)? sendEvent,
    TResult Function(WatchGameRequest<T> value)? watchGame,
    required TResult orElse(),
  }) {
    if (watchGame != null) {
      return watchGame(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return _$$WatchGameRequestToJson(this, toJsonT);
  }
}

abstract class WatchGameRequest<T extends Event>
    implements RoundServiceRequest<T> {
  const factory WatchGameRequest(
      {required String playerID, required String code}) = _$WatchGameRequest<T>;

  factory WatchGameRequest.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =
      _$WatchGameRequest<T>.fromJson;

  @override
  String get playerID;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  $WatchGameRequestCopyWith<T, WatchGameRequest<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

RoundServiceResponse<T> _$RoundServiceResponseFromJson<T extends Game<Event>>(
    Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
  switch (json['runtimeType']) {
    case 'sendEvent':
      return SendEventResponse<T>.fromJson(json, fromJsonT);
    case 'watchGame':
      return WatchGameResponse<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'RoundServiceResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$RoundServiceResponseTearOff {
  const _$RoundServiceResponseTearOff();

  SendEventResponse<T> sendEvent<T extends Game<Event>>() {
    return SendEventResponse<T>();
  }

  WatchGameResponse<T> watchGame<T extends Game<Event>>({required T game}) {
    return WatchGameResponse<T>(
      game: game,
    );
  }

  RoundServiceResponse<T> fromJson<T extends Game<Event>>(
      Map<String, Object?> json, T Function(Object? json) fromJsonT) {
    return RoundServiceResponse<T>.fromJson(json, fromJsonT);
  }
}

/// @nodoc
const $RoundServiceResponse = _$RoundServiceResponseTearOff();

/// @nodoc
mixin _$RoundServiceResponse<T extends Game<Event>> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendEvent,
    required TResult Function(T game) watchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? sendEvent,
    TResult Function(T game)? watchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendEvent,
    TResult Function(T game)? watchGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEventResponse<T> value) sendEvent,
    required TResult Function(WatchGameResponse<T> value) watchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendEventResponse<T> value)? sendEvent,
    TResult Function(WatchGameResponse<T> value)? watchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventResponse<T> value)? sendEvent,
    TResult Function(WatchGameResponse<T> value)? watchGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundServiceResponseCopyWith<T extends Game<Event>, $Res> {
  factory $RoundServiceResponseCopyWith(RoundServiceResponse<T> value,
          $Res Function(RoundServiceResponse<T>) then) =
      _$RoundServiceResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$RoundServiceResponseCopyWithImpl<T extends Game<Event>, $Res>
    implements $RoundServiceResponseCopyWith<T, $Res> {
  _$RoundServiceResponseCopyWithImpl(this._value, this._then);

  final RoundServiceResponse<T> _value;
  // ignore: unused_field
  final $Res Function(RoundServiceResponse<T>) _then;
}

/// @nodoc
abstract class $SendEventResponseCopyWith<T extends Game<Event>, $Res> {
  factory $SendEventResponseCopyWith(SendEventResponse<T> value,
          $Res Function(SendEventResponse<T>) then) =
      _$SendEventResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$SendEventResponseCopyWithImpl<T extends Game<Event>, $Res>
    extends _$RoundServiceResponseCopyWithImpl<T, $Res>
    implements $SendEventResponseCopyWith<T, $Res> {
  _$SendEventResponseCopyWithImpl(
      SendEventResponse<T> _value, $Res Function(SendEventResponse<T>) _then)
      : super(_value, (v) => _then(v as SendEventResponse<T>));

  @override
  SendEventResponse<T> get _value => super._value as SendEventResponse<T>;
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$SendEventResponse<T extends Game<Event>>
    implements SendEventResponse<T> {
  const _$SendEventResponse({String? $type}) : $type = $type ?? 'sendEvent';

  factory _$SendEventResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$$SendEventResponseFromJson(json, fromJsonT);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoundServiceResponse<$T>.sendEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SendEventResponse<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendEvent,
    required TResult Function(T game) watchGame,
  }) {
    return sendEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? sendEvent,
    TResult Function(T game)? watchGame,
  }) {
    return sendEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendEvent,
    TResult Function(T game)? watchGame,
    required TResult orElse(),
  }) {
    if (sendEvent != null) {
      return sendEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEventResponse<T> value) sendEvent,
    required TResult Function(WatchGameResponse<T> value) watchGame,
  }) {
    return sendEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendEventResponse<T> value)? sendEvent,
    TResult Function(WatchGameResponse<T> value)? watchGame,
  }) {
    return sendEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventResponse<T> value)? sendEvent,
    TResult Function(WatchGameResponse<T> value)? watchGame,
    required TResult orElse(),
  }) {
    if (sendEvent != null) {
      return sendEvent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return _$$SendEventResponseToJson(this, toJsonT);
  }
}

abstract class SendEventResponse<T extends Game<Event>>
    implements RoundServiceResponse<T> {
  const factory SendEventResponse() = _$SendEventResponse<T>;

  factory SendEventResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =
      _$SendEventResponse<T>.fromJson;
}

/// @nodoc
abstract class $WatchGameResponseCopyWith<T extends Game<Event>, $Res> {
  factory $WatchGameResponseCopyWith(WatchGameResponse<T> value,
          $Res Function(WatchGameResponse<T>) then) =
      _$WatchGameResponseCopyWithImpl<T, $Res>;
  $Res call({T game});
}

/// @nodoc
class _$WatchGameResponseCopyWithImpl<T extends Game<Event>, $Res>
    extends _$RoundServiceResponseCopyWithImpl<T, $Res>
    implements $WatchGameResponseCopyWith<T, $Res> {
  _$WatchGameResponseCopyWithImpl(
      WatchGameResponse<T> _value, $Res Function(WatchGameResponse<T>) _then)
      : super(_value, (v) => _then(v as WatchGameResponse<T>));

  @override
  WatchGameResponse<T> get _value => super._value as WatchGameResponse<T>;

  @override
  $Res call({
    Object? game = freezed,
  }) {
    return _then(WatchGameResponse<T>(
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$WatchGameResponse<T extends Game<Event>>
    implements WatchGameResponse<T> {
  const _$WatchGameResponse({required this.game, String? $type})
      : $type = $type ?? 'watchGame';

  factory _$WatchGameResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$$WatchGameResponseFromJson(json, fromJsonT);

  @override
  final T game;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RoundServiceResponse<$T>.watchGame(game: $game)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchGameResponse<T> &&
            const DeepCollectionEquality().equals(other.game, game));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(game));

  @JsonKey(ignore: true)
  @override
  $WatchGameResponseCopyWith<T, WatchGameResponse<T>> get copyWith =>
      _$WatchGameResponseCopyWithImpl<T, WatchGameResponse<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendEvent,
    required TResult Function(T game) watchGame,
  }) {
    return watchGame(game);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? sendEvent,
    TResult Function(T game)? watchGame,
  }) {
    return watchGame?.call(game);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendEvent,
    TResult Function(T game)? watchGame,
    required TResult orElse(),
  }) {
    if (watchGame != null) {
      return watchGame(game);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEventResponse<T> value) sendEvent,
    required TResult Function(WatchGameResponse<T> value) watchGame,
  }) {
    return watchGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendEventResponse<T> value)? sendEvent,
    TResult Function(WatchGameResponse<T> value)? watchGame,
  }) {
    return watchGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventResponse<T> value)? sendEvent,
    TResult Function(WatchGameResponse<T> value)? watchGame,
    required TResult orElse(),
  }) {
    if (watchGame != null) {
      return watchGame(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return _$$WatchGameResponseToJson(this, toJsonT);
  }
}

abstract class WatchGameResponse<T extends Game<Event>>
    implements RoundServiceResponse<T> {
  const factory WatchGameResponse({required T game}) = _$WatchGameResponse<T>;

  factory WatchGameResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =
      _$WatchGameResponse<T>.fromJson;

  T get game;
  @JsonKey(ignore: true)
  $WatchGameResponseCopyWith<T, WatchGameResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
