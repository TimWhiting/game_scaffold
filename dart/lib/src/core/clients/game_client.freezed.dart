// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse<T> _$ApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
  switch (json['runtimeType']) {
    case 'success':
      return _ApiResponse<T>.fromJson(json, fromJsonT);
    case 'error':
      return _Error<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ApiResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$ApiResponseTearOff {
  const _$ApiResponseTearOff();

  _ApiResponse<T> success<T>(T success) {
    return _ApiResponse<T>(
      success,
    );
  }

  _Error<T> error<T>(String error) {
    return _Error<T>(
      error,
    );
  }

  ApiResponse<T> fromJson<T>(
      Map<String, Object?> json, T Function(Object? json) fromJsonT) {
    return ApiResponse<T>.fromJson(json, fromJsonT);
  }
}

/// @nodoc
const $ApiResponse = _$ApiResponseTearOff();

/// @nodoc
mixin _$ApiResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T success) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T success)? success,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T success)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResponse<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ApiResponse<T> value)? success,
    TResult Function(_Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResponse<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  final ApiResponse<T> _value;
  // ignore: unused_field
  final $Res Function(ApiResponse<T>) _then;
}

/// @nodoc
abstract class _$ApiResponseCopyWith<T, $Res> {
  factory _$ApiResponseCopyWith(
          _ApiResponse<T> value, $Res Function(_ApiResponse<T>) then) =
      __$ApiResponseCopyWithImpl<T, $Res>;
  $Res call({T success});
}

/// @nodoc
class __$ApiResponseCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res>
    implements _$ApiResponseCopyWith<T, $Res> {
  __$ApiResponseCopyWithImpl(
      _ApiResponse<T> _value, $Res Function(_ApiResponse<T>) _then)
      : super(_value, (v) => _then(v as _ApiResponse<T>));

  @override
  _ApiResponse<T> get _value => super._value as _ApiResponse<T>;

  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_ApiResponse<T>(
      success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_ApiResponse<T> implements _ApiResponse<T> {
  const _$_ApiResponse(this.success, {String? $type})
      : $type = $type ?? 'success';

  factory _$_ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$$_ApiResponseFromJson(json, fromJsonT);

  @override
  final T success;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiResponse<$T>.success(success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiResponse<T> &&
            const DeepCollectionEquality().equals(other.success, success));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(success));

  @JsonKey(ignore: true)
  @override
  _$ApiResponseCopyWith<T, _ApiResponse<T>> get copyWith =>
      __$ApiResponseCopyWithImpl<T, _ApiResponse<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T success) success,
    required TResult Function(String error) error,
  }) {
    return success(this.success);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T success)? success,
    TResult Function(String error)? error,
  }) {
    return success?.call(this.success);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T success)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this.success);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResponse<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ApiResponse<T> value)? success,
    TResult Function(_Error<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResponse<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return _$$_ApiResponseToJson(this, toJsonT);
  }
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  const factory _ApiResponse(T success) = _$_ApiResponse<T>;

  factory _ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =
      _$_ApiResponse<T>.fromJson;

  T get success;
  @JsonKey(ignore: true)
  _$ApiResponseCopyWith<T, _ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) then) =
      __$ErrorCopyWithImpl<T, $Res>;
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<T, $Res> extends _$ApiResponseCopyWithImpl<T, $Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(_Error<T> _value, $Res Function(_Error<T>) _then)
      : super(_value, (v) => _then(v as _Error<T>));

  @override
  _Error<T> get _value => super._value as _Error<T>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error<T>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_Error<T> implements _Error<T> {
  const _$_Error(this.error, {String? $type}) : $type = $type ?? 'error';

  factory _$_Error.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$$_ErrorFromJson(json, fromJsonT);

  @override
  final String error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiResponse<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<T, _Error<T>> get copyWith =>
      __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T success) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T success)? success,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T success)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResponse<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ApiResponse<T> value)? success,
    TResult Function(_Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResponse<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return _$$_ErrorToJson(this, toJsonT);
  }
}

abstract class _Error<T> implements ApiResponse<T> {
  const factory _Error(String error) = _$_Error<T>;

  factory _Error.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =
      _$_Error<T>.fromJson;

  String get error;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<T, _Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

GameServiceRequest _$GameServiceRequestFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'createGame':
      return CreateGameRequest.fromJson(json);
    case 'deleteGame':
      return DeleteGameRequest.fromJson(json);
    case 'listGames':
      return ListGamesRequest.fromJson(json);
    case 'exitGame':
      return ExitGameRequest.fromJson(json);
    case 'joinGame':
      return JoinGameRequest.fromJson(json);
    case 'startGame':
      return StartGameRequest.fromJson(json);
    case 'watchLobby':
      return WatchLobbyRequest.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GameServiceRequest',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$GameServiceRequestTearOff {
  const _$GameServiceRequestTearOff();

  CreateGameRequest createGame(
      {required String authID, required GameConfig config}) {
    return CreateGameRequest(
      authID: authID,
      config: config,
    );
  }

  DeleteGameRequest deleteGame(
      {required String playerID,
      required String authID,
      required String code}) {
    return DeleteGameRequest(
      playerID: playerID,
      authID: authID,
      code: code,
    );
  }

  ListGamesRequest listGames({required String authID}) {
    return ListGamesRequest(
      authID: authID,
    );
  }

  ExitGameRequest exitGame(
      {required String playerID,
      required String authID,
      required String code}) {
    return ExitGameRequest(
      playerID: playerID,
      authID: authID,
      code: code,
    );
  }

  JoinGameRequest joinGame({required String authID, required String code}) {
    return JoinGameRequest(
      authID: authID,
      code: code,
    );
  }

  StartGameRequest startGame({required String playerID, required String code}) {
    return StartGameRequest(
      playerID: playerID,
      code: code,
    );
  }

  WatchLobbyRequest watchLobby(
      {required String playerID,
      required String authID,
      required String code}) {
    return WatchLobbyRequest(
      playerID: playerID,
      authID: authID,
      code: code,
    );
  }

  GameServiceRequest fromJson(Map<String, Object?> json) {
    return GameServiceRequest.fromJson(json);
  }
}

/// @nodoc
const $GameServiceRequest = _$GameServiceRequestTearOff();

/// @nodoc
mixin _$GameServiceRequest {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authID, GameConfig config) createGame,
    required TResult Function(String playerID, String authID, String code)
        deleteGame,
    required TResult Function(String authID) listGames,
    required TResult Function(String playerID, String authID, String code)
        exitGame,
    required TResult Function(String authID, String code) joinGame,
    required TResult Function(String playerID, String code) startGame,
    required TResult Function(String playerID, String authID, String code)
        watchLobby,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String authID, GameConfig config)? createGame,
    TResult Function(String playerID, String authID, String code)? deleteGame,
    TResult Function(String authID)? listGames,
    TResult Function(String playerID, String authID, String code)? exitGame,
    TResult Function(String authID, String code)? joinGame,
    TResult Function(String playerID, String code)? startGame,
    TResult Function(String playerID, String authID, String code)? watchLobby,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameRequest value) createGame,
    required TResult Function(DeleteGameRequest value) deleteGame,
    required TResult Function(ListGamesRequest value) listGames,
    required TResult Function(ExitGameRequest value) exitGame,
    required TResult Function(JoinGameRequest value) joinGame,
    required TResult Function(StartGameRequest value) startGame,
    required TResult Function(WatchLobbyRequest value) watchLobby,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameRequest value)? createGame,
    TResult Function(DeleteGameRequest value)? deleteGame,
    TResult Function(ListGamesRequest value)? listGames,
    TResult Function(ExitGameRequest value)? exitGame,
    TResult Function(JoinGameRequest value)? joinGame,
    TResult Function(StartGameRequest value)? startGame,
    TResult Function(WatchLobbyRequest value)? watchLobby,
  }) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameServiceRequestCopyWith<$Res> {
  factory $GameServiceRequestCopyWith(
          GameServiceRequest value, $Res Function(GameServiceRequest) then) =
      _$GameServiceRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameServiceRequestCopyWithImpl<$Res>
    implements $GameServiceRequestCopyWith<$Res> {
  _$GameServiceRequestCopyWithImpl(this._value, this._then);

  final GameServiceRequest _value;
  // ignore: unused_field
  final $Res Function(GameServiceRequest) _then;
}

/// @nodoc
abstract class $CreateGameRequestCopyWith<$Res> {
  factory $CreateGameRequestCopyWith(
          CreateGameRequest value, $Res Function(CreateGameRequest) then) =
      _$CreateGameRequestCopyWithImpl<$Res>;
  $Res call({String authID, GameConfig config});

  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$CreateGameRequestCopyWithImpl<$Res>
    extends _$GameServiceRequestCopyWithImpl<$Res>
    implements $CreateGameRequestCopyWith<$Res> {
  _$CreateGameRequestCopyWithImpl(
      CreateGameRequest _value, $Res Function(CreateGameRequest) _then)
      : super(_value, (v) => _then(v as CreateGameRequest));

  @override
  CreateGameRequest get _value => super._value as CreateGameRequest;

  @override
  $Res call({
    Object? authID = freezed,
    Object? config = freezed,
  }) {
    return _then(CreateGameRequest(
      authID: authID == freezed
          ? _value.authID
          : authID // ignore: cast_nullable_to_non_nullable
              as String,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as GameConfig,
    ));
  }

  @override
  $GameConfigCopyWith<$Res> get config {
    return $GameConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateGameRequest implements CreateGameRequest {
  const _$CreateGameRequest(
      {required this.authID, required this.config, String? $type})
      : $type = $type ?? 'createGame';

  factory _$CreateGameRequest.fromJson(Map<String, dynamic> json) =>
      _$$CreateGameRequestFromJson(json);

  @override
  final String authID;
  @override
  final GameConfig config;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceRequest.createGame(authID: $authID, config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateGameRequest &&
            const DeepCollectionEquality().equals(other.authID, authID) &&
            const DeepCollectionEquality().equals(other.config, config));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authID),
      const DeepCollectionEquality().hash(config));

  @JsonKey(ignore: true)
  @override
  $CreateGameRequestCopyWith<CreateGameRequest> get copyWith =>
      _$CreateGameRequestCopyWithImpl<CreateGameRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authID, GameConfig config) createGame,
    required TResult Function(String playerID, String authID, String code)
        deleteGame,
    required TResult Function(String authID) listGames,
    required TResult Function(String playerID, String authID, String code)
        exitGame,
    required TResult Function(String authID, String code) joinGame,
    required TResult Function(String playerID, String code) startGame,
    required TResult Function(String playerID, String authID, String code)
        watchLobby,
  }) {
    return createGame(authID, config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String authID, GameConfig config)? createGame,
    TResult Function(String playerID, String authID, String code)? deleteGame,
    TResult Function(String authID)? listGames,
    TResult Function(String playerID, String authID, String code)? exitGame,
    TResult Function(String authID, String code)? joinGame,
    TResult Function(String playerID, String code)? startGame,
    TResult Function(String playerID, String authID, String code)? watchLobby,
  }) {
    return createGame?.call(authID, config);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameRequest value) createGame,
    required TResult Function(DeleteGameRequest value) deleteGame,
    required TResult Function(ListGamesRequest value) listGames,
    required TResult Function(ExitGameRequest value) exitGame,
    required TResult Function(JoinGameRequest value) joinGame,
    required TResult Function(StartGameRequest value) startGame,
    required TResult Function(WatchLobbyRequest value) watchLobby,
  }) {
    return createGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameRequest value)? createGame,
    TResult Function(DeleteGameRequest value)? deleteGame,
    TResult Function(ListGamesRequest value)? listGames,
    TResult Function(ExitGameRequest value)? exitGame,
    TResult Function(JoinGameRequest value)? joinGame,
    TResult Function(StartGameRequest value)? startGame,
    TResult Function(WatchLobbyRequest value)? watchLobby,
  }) {
    return createGame?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateGameRequestToJson(this);
  }
}

abstract class CreateGameRequest implements GameServiceRequest {
  const factory CreateGameRequest(
      {required String authID,
      required GameConfig config}) = _$CreateGameRequest;

  factory CreateGameRequest.fromJson(Map<String, dynamic> json) =
      _$CreateGameRequest.fromJson;

  String get authID;
  GameConfig get config;
  @JsonKey(ignore: true)
  $CreateGameRequestCopyWith<CreateGameRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteGameRequestCopyWith<$Res> {
  factory $DeleteGameRequestCopyWith(
          DeleteGameRequest value, $Res Function(DeleteGameRequest) then) =
      _$DeleteGameRequestCopyWithImpl<$Res>;
  $Res call({String playerID, String authID, String code});
}

/// @nodoc
class _$DeleteGameRequestCopyWithImpl<$Res>
    extends _$GameServiceRequestCopyWithImpl<$Res>
    implements $DeleteGameRequestCopyWith<$Res> {
  _$DeleteGameRequestCopyWithImpl(
      DeleteGameRequest _value, $Res Function(DeleteGameRequest) _then)
      : super(_value, (v) => _then(v as DeleteGameRequest));

  @override
  DeleteGameRequest get _value => super._value as DeleteGameRequest;

  @override
  $Res call({
    Object? playerID = freezed,
    Object? authID = freezed,
    Object? code = freezed,
  }) {
    return _then(DeleteGameRequest(
      playerID: playerID == freezed
          ? _value.playerID
          : playerID // ignore: cast_nullable_to_non_nullable
              as String,
      authID: authID == freezed
          ? _value.authID
          : authID // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteGameRequest implements DeleteGameRequest {
  const _$DeleteGameRequest(
      {required this.playerID,
      required this.authID,
      required this.code,
      String? $type})
      : $type = $type ?? 'deleteGame';

  factory _$DeleteGameRequest.fromJson(Map<String, dynamic> json) =>
      _$$DeleteGameRequestFromJson(json);

  @override
  final String playerID;
  @override
  final String authID;
  @override
  final String code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceRequest.deleteGame(playerID: $playerID, authID: $authID, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteGameRequest &&
            const DeepCollectionEquality().equals(other.playerID, playerID) &&
            const DeepCollectionEquality().equals(other.authID, authID) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerID),
      const DeepCollectionEquality().hash(authID),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  $DeleteGameRequestCopyWith<DeleteGameRequest> get copyWith =>
      _$DeleteGameRequestCopyWithImpl<DeleteGameRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authID, GameConfig config) createGame,
    required TResult Function(String playerID, String authID, String code)
        deleteGame,
    required TResult Function(String authID) listGames,
    required TResult Function(String playerID, String authID, String code)
        exitGame,
    required TResult Function(String authID, String code) joinGame,
    required TResult Function(String playerID, String code) startGame,
    required TResult Function(String playerID, String authID, String code)
        watchLobby,
  }) {
    return deleteGame(playerID, authID, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String authID, GameConfig config)? createGame,
    TResult Function(String playerID, String authID, String code)? deleteGame,
    TResult Function(String authID)? listGames,
    TResult Function(String playerID, String authID, String code)? exitGame,
    TResult Function(String authID, String code)? joinGame,
    TResult Function(String playerID, String code)? startGame,
    TResult Function(String playerID, String authID, String code)? watchLobby,
  }) {
    return deleteGame?.call(playerID, authID, code);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameRequest value) createGame,
    required TResult Function(DeleteGameRequest value) deleteGame,
    required TResult Function(ListGamesRequest value) listGames,
    required TResult Function(ExitGameRequest value) exitGame,
    required TResult Function(JoinGameRequest value) joinGame,
    required TResult Function(StartGameRequest value) startGame,
    required TResult Function(WatchLobbyRequest value) watchLobby,
  }) {
    return deleteGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameRequest value)? createGame,
    TResult Function(DeleteGameRequest value)? deleteGame,
    TResult Function(ListGamesRequest value)? listGames,
    TResult Function(ExitGameRequest value)? exitGame,
    TResult Function(JoinGameRequest value)? joinGame,
    TResult Function(StartGameRequest value)? startGame,
    TResult Function(WatchLobbyRequest value)? watchLobby,
  }) {
    return deleteGame?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteGameRequestToJson(this);
  }
}

abstract class DeleteGameRequest implements GameServiceRequest {
  const factory DeleteGameRequest(
      {required String playerID,
      required String authID,
      required String code}) = _$DeleteGameRequest;

  factory DeleteGameRequest.fromJson(Map<String, dynamic> json) =
      _$DeleteGameRequest.fromJson;

  String get playerID;
  String get authID;
  String get code;
  @JsonKey(ignore: true)
  $DeleteGameRequestCopyWith<DeleteGameRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListGamesRequestCopyWith<$Res> {
  factory $ListGamesRequestCopyWith(
          ListGamesRequest value, $Res Function(ListGamesRequest) then) =
      _$ListGamesRequestCopyWithImpl<$Res>;
  $Res call({String authID});
}

/// @nodoc
class _$ListGamesRequestCopyWithImpl<$Res>
    extends _$GameServiceRequestCopyWithImpl<$Res>
    implements $ListGamesRequestCopyWith<$Res> {
  _$ListGamesRequestCopyWithImpl(
      ListGamesRequest _value, $Res Function(ListGamesRequest) _then)
      : super(_value, (v) => _then(v as ListGamesRequest));

  @override
  ListGamesRequest get _value => super._value as ListGamesRequest;

  @override
  $Res call({
    Object? authID = freezed,
  }) {
    return _then(ListGamesRequest(
      authID: authID == freezed
          ? _value.authID
          : authID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListGamesRequest implements ListGamesRequest {
  const _$ListGamesRequest({required this.authID, String? $type})
      : $type = $type ?? 'listGames';

  factory _$ListGamesRequest.fromJson(Map<String, dynamic> json) =>
      _$$ListGamesRequestFromJson(json);

  @override
  final String authID;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceRequest.listGames(authID: $authID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListGamesRequest &&
            const DeepCollectionEquality().equals(other.authID, authID));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(authID));

  @JsonKey(ignore: true)
  @override
  $ListGamesRequestCopyWith<ListGamesRequest> get copyWith =>
      _$ListGamesRequestCopyWithImpl<ListGamesRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authID, GameConfig config) createGame,
    required TResult Function(String playerID, String authID, String code)
        deleteGame,
    required TResult Function(String authID) listGames,
    required TResult Function(String playerID, String authID, String code)
        exitGame,
    required TResult Function(String authID, String code) joinGame,
    required TResult Function(String playerID, String code) startGame,
    required TResult Function(String playerID, String authID, String code)
        watchLobby,
  }) {
    return listGames(authID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String authID, GameConfig config)? createGame,
    TResult Function(String playerID, String authID, String code)? deleteGame,
    TResult Function(String authID)? listGames,
    TResult Function(String playerID, String authID, String code)? exitGame,
    TResult Function(String authID, String code)? joinGame,
    TResult Function(String playerID, String code)? startGame,
    TResult Function(String playerID, String authID, String code)? watchLobby,
  }) {
    return listGames?.call(authID);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameRequest value) createGame,
    required TResult Function(DeleteGameRequest value) deleteGame,
    required TResult Function(ListGamesRequest value) listGames,
    required TResult Function(ExitGameRequest value) exitGame,
    required TResult Function(JoinGameRequest value) joinGame,
    required TResult Function(StartGameRequest value) startGame,
    required TResult Function(WatchLobbyRequest value) watchLobby,
  }) {
    return listGames(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameRequest value)? createGame,
    TResult Function(DeleteGameRequest value)? deleteGame,
    TResult Function(ListGamesRequest value)? listGames,
    TResult Function(ExitGameRequest value)? exitGame,
    TResult Function(JoinGameRequest value)? joinGame,
    TResult Function(StartGameRequest value)? startGame,
    TResult Function(WatchLobbyRequest value)? watchLobby,
  }) {
    return listGames?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ListGamesRequestToJson(this);
  }
}

abstract class ListGamesRequest implements GameServiceRequest {
  const factory ListGamesRequest({required String authID}) = _$ListGamesRequest;

  factory ListGamesRequest.fromJson(Map<String, dynamic> json) =
      _$ListGamesRequest.fromJson;

  String get authID;
  @JsonKey(ignore: true)
  $ListGamesRequestCopyWith<ListGamesRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExitGameRequestCopyWith<$Res> {
  factory $ExitGameRequestCopyWith(
          ExitGameRequest value, $Res Function(ExitGameRequest) then) =
      _$ExitGameRequestCopyWithImpl<$Res>;
  $Res call({String playerID, String authID, String code});
}

/// @nodoc
class _$ExitGameRequestCopyWithImpl<$Res>
    extends _$GameServiceRequestCopyWithImpl<$Res>
    implements $ExitGameRequestCopyWith<$Res> {
  _$ExitGameRequestCopyWithImpl(
      ExitGameRequest _value, $Res Function(ExitGameRequest) _then)
      : super(_value, (v) => _then(v as ExitGameRequest));

  @override
  ExitGameRequest get _value => super._value as ExitGameRequest;

  @override
  $Res call({
    Object? playerID = freezed,
    Object? authID = freezed,
    Object? code = freezed,
  }) {
    return _then(ExitGameRequest(
      playerID: playerID == freezed
          ? _value.playerID
          : playerID // ignore: cast_nullable_to_non_nullable
              as String,
      authID: authID == freezed
          ? _value.authID
          : authID // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExitGameRequest implements ExitGameRequest {
  const _$ExitGameRequest(
      {required this.playerID,
      required this.authID,
      required this.code,
      String? $type})
      : $type = $type ?? 'exitGame';

  factory _$ExitGameRequest.fromJson(Map<String, dynamic> json) =>
      _$$ExitGameRequestFromJson(json);

  @override
  final String playerID;
  @override
  final String authID;
  @override
  final String code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceRequest.exitGame(playerID: $playerID, authID: $authID, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExitGameRequest &&
            const DeepCollectionEquality().equals(other.playerID, playerID) &&
            const DeepCollectionEquality().equals(other.authID, authID) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerID),
      const DeepCollectionEquality().hash(authID),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  $ExitGameRequestCopyWith<ExitGameRequest> get copyWith =>
      _$ExitGameRequestCopyWithImpl<ExitGameRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authID, GameConfig config) createGame,
    required TResult Function(String playerID, String authID, String code)
        deleteGame,
    required TResult Function(String authID) listGames,
    required TResult Function(String playerID, String authID, String code)
        exitGame,
    required TResult Function(String authID, String code) joinGame,
    required TResult Function(String playerID, String code) startGame,
    required TResult Function(String playerID, String authID, String code)
        watchLobby,
  }) {
    return exitGame(playerID, authID, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String authID, GameConfig config)? createGame,
    TResult Function(String playerID, String authID, String code)? deleteGame,
    TResult Function(String authID)? listGames,
    TResult Function(String playerID, String authID, String code)? exitGame,
    TResult Function(String authID, String code)? joinGame,
    TResult Function(String playerID, String code)? startGame,
    TResult Function(String playerID, String authID, String code)? watchLobby,
  }) {
    return exitGame?.call(playerID, authID, code);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameRequest value) createGame,
    required TResult Function(DeleteGameRequest value) deleteGame,
    required TResult Function(ListGamesRequest value) listGames,
    required TResult Function(ExitGameRequest value) exitGame,
    required TResult Function(JoinGameRequest value) joinGame,
    required TResult Function(StartGameRequest value) startGame,
    required TResult Function(WatchLobbyRequest value) watchLobby,
  }) {
    return exitGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameRequest value)? createGame,
    TResult Function(DeleteGameRequest value)? deleteGame,
    TResult Function(ListGamesRequest value)? listGames,
    TResult Function(ExitGameRequest value)? exitGame,
    TResult Function(JoinGameRequest value)? joinGame,
    TResult Function(StartGameRequest value)? startGame,
    TResult Function(WatchLobbyRequest value)? watchLobby,
  }) {
    return exitGame?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExitGameRequestToJson(this);
  }
}

abstract class ExitGameRequest implements GameServiceRequest {
  const factory ExitGameRequest(
      {required String playerID,
      required String authID,
      required String code}) = _$ExitGameRequest;

  factory ExitGameRequest.fromJson(Map<String, dynamic> json) =
      _$ExitGameRequest.fromJson;

  String get playerID;
  String get authID;
  String get code;
  @JsonKey(ignore: true)
  $ExitGameRequestCopyWith<ExitGameRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinGameRequestCopyWith<$Res> {
  factory $JoinGameRequestCopyWith(
          JoinGameRequest value, $Res Function(JoinGameRequest) then) =
      _$JoinGameRequestCopyWithImpl<$Res>;
  $Res call({String authID, String code});
}

/// @nodoc
class _$JoinGameRequestCopyWithImpl<$Res>
    extends _$GameServiceRequestCopyWithImpl<$Res>
    implements $JoinGameRequestCopyWith<$Res> {
  _$JoinGameRequestCopyWithImpl(
      JoinGameRequest _value, $Res Function(JoinGameRequest) _then)
      : super(_value, (v) => _then(v as JoinGameRequest));

  @override
  JoinGameRequest get _value => super._value as JoinGameRequest;

  @override
  $Res call({
    Object? authID = freezed,
    Object? code = freezed,
  }) {
    return _then(JoinGameRequest(
      authID: authID == freezed
          ? _value.authID
          : authID // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinGameRequest implements JoinGameRequest {
  const _$JoinGameRequest(
      {required this.authID, required this.code, String? $type})
      : $type = $type ?? 'joinGame';

  factory _$JoinGameRequest.fromJson(Map<String, dynamic> json) =>
      _$$JoinGameRequestFromJson(json);

  @override
  final String authID;
  @override
  final String code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceRequest.joinGame(authID: $authID, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JoinGameRequest &&
            const DeepCollectionEquality().equals(other.authID, authID) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authID),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  $JoinGameRequestCopyWith<JoinGameRequest> get copyWith =>
      _$JoinGameRequestCopyWithImpl<JoinGameRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authID, GameConfig config) createGame,
    required TResult Function(String playerID, String authID, String code)
        deleteGame,
    required TResult Function(String authID) listGames,
    required TResult Function(String playerID, String authID, String code)
        exitGame,
    required TResult Function(String authID, String code) joinGame,
    required TResult Function(String playerID, String code) startGame,
    required TResult Function(String playerID, String authID, String code)
        watchLobby,
  }) {
    return joinGame(authID, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String authID, GameConfig config)? createGame,
    TResult Function(String playerID, String authID, String code)? deleteGame,
    TResult Function(String authID)? listGames,
    TResult Function(String playerID, String authID, String code)? exitGame,
    TResult Function(String authID, String code)? joinGame,
    TResult Function(String playerID, String code)? startGame,
    TResult Function(String playerID, String authID, String code)? watchLobby,
  }) {
    return joinGame?.call(authID, code);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameRequest value) createGame,
    required TResult Function(DeleteGameRequest value) deleteGame,
    required TResult Function(ListGamesRequest value) listGames,
    required TResult Function(ExitGameRequest value) exitGame,
    required TResult Function(JoinGameRequest value) joinGame,
    required TResult Function(StartGameRequest value) startGame,
    required TResult Function(WatchLobbyRequest value) watchLobby,
  }) {
    return joinGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameRequest value)? createGame,
    TResult Function(DeleteGameRequest value)? deleteGame,
    TResult Function(ListGamesRequest value)? listGames,
    TResult Function(ExitGameRequest value)? exitGame,
    TResult Function(JoinGameRequest value)? joinGame,
    TResult Function(StartGameRequest value)? startGame,
    TResult Function(WatchLobbyRequest value)? watchLobby,
  }) {
    return joinGame?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinGameRequestToJson(this);
  }
}

abstract class JoinGameRequest implements GameServiceRequest {
  const factory JoinGameRequest(
      {required String authID, required String code}) = _$JoinGameRequest;

  factory JoinGameRequest.fromJson(Map<String, dynamic> json) =
      _$JoinGameRequest.fromJson;

  String get authID;
  String get code;
  @JsonKey(ignore: true)
  $JoinGameRequestCopyWith<JoinGameRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartGameRequestCopyWith<$Res> {
  factory $StartGameRequestCopyWith(
          StartGameRequest value, $Res Function(StartGameRequest) then) =
      _$StartGameRequestCopyWithImpl<$Res>;
  $Res call({String playerID, String code});
}

/// @nodoc
class _$StartGameRequestCopyWithImpl<$Res>
    extends _$GameServiceRequestCopyWithImpl<$Res>
    implements $StartGameRequestCopyWith<$Res> {
  _$StartGameRequestCopyWithImpl(
      StartGameRequest _value, $Res Function(StartGameRequest) _then)
      : super(_value, (v) => _then(v as StartGameRequest));

  @override
  StartGameRequest get _value => super._value as StartGameRequest;

  @override
  $Res call({
    Object? playerID = freezed,
    Object? code = freezed,
  }) {
    return _then(StartGameRequest(
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
@JsonSerializable()
class _$StartGameRequest implements StartGameRequest {
  const _$StartGameRequest(
      {required this.playerID, required this.code, String? $type})
      : $type = $type ?? 'startGame';

  factory _$StartGameRequest.fromJson(Map<String, dynamic> json) =>
      _$$StartGameRequestFromJson(json);

  @override
  final String playerID;
  @override
  final String code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceRequest.startGame(playerID: $playerID, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StartGameRequest &&
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
  $StartGameRequestCopyWith<StartGameRequest> get copyWith =>
      _$StartGameRequestCopyWithImpl<StartGameRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authID, GameConfig config) createGame,
    required TResult Function(String playerID, String authID, String code)
        deleteGame,
    required TResult Function(String authID) listGames,
    required TResult Function(String playerID, String authID, String code)
        exitGame,
    required TResult Function(String authID, String code) joinGame,
    required TResult Function(String playerID, String code) startGame,
    required TResult Function(String playerID, String authID, String code)
        watchLobby,
  }) {
    return startGame(playerID, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String authID, GameConfig config)? createGame,
    TResult Function(String playerID, String authID, String code)? deleteGame,
    TResult Function(String authID)? listGames,
    TResult Function(String playerID, String authID, String code)? exitGame,
    TResult Function(String authID, String code)? joinGame,
    TResult Function(String playerID, String code)? startGame,
    TResult Function(String playerID, String authID, String code)? watchLobby,
  }) {
    return startGame?.call(playerID, code);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameRequest value) createGame,
    required TResult Function(DeleteGameRequest value) deleteGame,
    required TResult Function(ListGamesRequest value) listGames,
    required TResult Function(ExitGameRequest value) exitGame,
    required TResult Function(JoinGameRequest value) joinGame,
    required TResult Function(StartGameRequest value) startGame,
    required TResult Function(WatchLobbyRequest value) watchLobby,
  }) {
    return startGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameRequest value)? createGame,
    TResult Function(DeleteGameRequest value)? deleteGame,
    TResult Function(ListGamesRequest value)? listGames,
    TResult Function(ExitGameRequest value)? exitGame,
    TResult Function(JoinGameRequest value)? joinGame,
    TResult Function(StartGameRequest value)? startGame,
    TResult Function(WatchLobbyRequest value)? watchLobby,
  }) {
    return startGame?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StartGameRequestToJson(this);
  }
}

abstract class StartGameRequest implements GameServiceRequest {
  const factory StartGameRequest(
      {required String playerID, required String code}) = _$StartGameRequest;

  factory StartGameRequest.fromJson(Map<String, dynamic> json) =
      _$StartGameRequest.fromJson;

  String get playerID;
  String get code;
  @JsonKey(ignore: true)
  $StartGameRequestCopyWith<StartGameRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchLobbyRequestCopyWith<$Res> {
  factory $WatchLobbyRequestCopyWith(
          WatchLobbyRequest value, $Res Function(WatchLobbyRequest) then) =
      _$WatchLobbyRequestCopyWithImpl<$Res>;
  $Res call({String playerID, String authID, String code});
}

/// @nodoc
class _$WatchLobbyRequestCopyWithImpl<$Res>
    extends _$GameServiceRequestCopyWithImpl<$Res>
    implements $WatchLobbyRequestCopyWith<$Res> {
  _$WatchLobbyRequestCopyWithImpl(
      WatchLobbyRequest _value, $Res Function(WatchLobbyRequest) _then)
      : super(_value, (v) => _then(v as WatchLobbyRequest));

  @override
  WatchLobbyRequest get _value => super._value as WatchLobbyRequest;

  @override
  $Res call({
    Object? playerID = freezed,
    Object? authID = freezed,
    Object? code = freezed,
  }) {
    return _then(WatchLobbyRequest(
      playerID: playerID == freezed
          ? _value.playerID
          : playerID // ignore: cast_nullable_to_non_nullable
              as String,
      authID: authID == freezed
          ? _value.authID
          : authID // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchLobbyRequest implements WatchLobbyRequest {
  const _$WatchLobbyRequest(
      {required this.playerID,
      required this.authID,
      required this.code,
      String? $type})
      : $type = $type ?? 'watchLobby';

  factory _$WatchLobbyRequest.fromJson(Map<String, dynamic> json) =>
      _$$WatchLobbyRequestFromJson(json);

  @override
  final String playerID;
  @override
  final String authID;
  @override
  final String code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceRequest.watchLobby(playerID: $playerID, authID: $authID, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchLobbyRequest &&
            const DeepCollectionEquality().equals(other.playerID, playerID) &&
            const DeepCollectionEquality().equals(other.authID, authID) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerID),
      const DeepCollectionEquality().hash(authID),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  $WatchLobbyRequestCopyWith<WatchLobbyRequest> get copyWith =>
      _$WatchLobbyRequestCopyWithImpl<WatchLobbyRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authID, GameConfig config) createGame,
    required TResult Function(String playerID, String authID, String code)
        deleteGame,
    required TResult Function(String authID) listGames,
    required TResult Function(String playerID, String authID, String code)
        exitGame,
    required TResult Function(String authID, String code) joinGame,
    required TResult Function(String playerID, String code) startGame,
    required TResult Function(String playerID, String authID, String code)
        watchLobby,
  }) {
    return watchLobby(playerID, authID, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String authID, GameConfig config)? createGame,
    TResult Function(String playerID, String authID, String code)? deleteGame,
    TResult Function(String authID)? listGames,
    TResult Function(String playerID, String authID, String code)? exitGame,
    TResult Function(String authID, String code)? joinGame,
    TResult Function(String playerID, String code)? startGame,
    TResult Function(String playerID, String authID, String code)? watchLobby,
  }) {
    return watchLobby?.call(playerID, authID, code);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameRequest value) createGame,
    required TResult Function(DeleteGameRequest value) deleteGame,
    required TResult Function(ListGamesRequest value) listGames,
    required TResult Function(ExitGameRequest value) exitGame,
    required TResult Function(JoinGameRequest value) joinGame,
    required TResult Function(StartGameRequest value) startGame,
    required TResult Function(WatchLobbyRequest value) watchLobby,
  }) {
    return watchLobby(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameRequest value)? createGame,
    TResult Function(DeleteGameRequest value)? deleteGame,
    TResult Function(ListGamesRequest value)? listGames,
    TResult Function(ExitGameRequest value)? exitGame,
    TResult Function(JoinGameRequest value)? joinGame,
    TResult Function(StartGameRequest value)? startGame,
    TResult Function(WatchLobbyRequest value)? watchLobby,
  }) {
    return watchLobby?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchLobbyRequestToJson(this);
  }
}

abstract class WatchLobbyRequest implements GameServiceRequest {
  const factory WatchLobbyRequest(
      {required String playerID,
      required String authID,
      required String code}) = _$WatchLobbyRequest;

  factory WatchLobbyRequest.fromJson(Map<String, dynamic> json) =
      _$WatchLobbyRequest.fromJson;

  String get playerID;
  String get authID;
  String get code;
  @JsonKey(ignore: true)
  $WatchLobbyRequestCopyWith<WatchLobbyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

GameServiceResponse _$GameServiceResponseFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'createGame':
      return CreateGameResponse.fromJson(json);
    case 'deleteGame':
      return DeleteGameResponse.fromJson(json);
    case 'listGames':
      return ListGamesResponse.fromJson(json);
    case 'exitGame':
      return ExitGameResponse.fromJson(json);
    case 'joinGame':
      return JoinGameResponse.fromJson(json);
    case 'startGame':
      return StartGameResponse.fromJson(json);
    case 'watchLobby':
      return WatchLobbyResponse.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GameServiceResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$GameServiceResponseTearOff {
  const _$GameServiceResponseTearOff();

  CreateGameResponse createGame(
      {required String playerID, required String code}) {
    return CreateGameResponse(
      playerID: playerID,
      code: code,
    );
  }

  DeleteGameResponse deleteGame() {
    return const DeleteGameResponse();
  }

  ListGamesResponse listGames({required IList<GameInfo> games}) {
    return ListGamesResponse(
      games: games,
    );
  }

  ExitGameResponse exitGame() {
    return const ExitGameResponse();
  }

  JoinGameResponse joinGame({required String playerID}) {
    return JoinGameResponse(
      playerID: playerID,
    );
  }

  StartGameResponse startGame() {
    return const StartGameResponse();
  }

  WatchLobbyResponse watchLobby({required GameInfo gameInfo}) {
    return WatchLobbyResponse(
      gameInfo: gameInfo,
    );
  }

  GameServiceResponse fromJson(Map<String, Object?> json) {
    return GameServiceResponse.fromJson(json);
  }
}

/// @nodoc
const $GameServiceResponse = _$GameServiceResponseTearOff();

/// @nodoc
mixin _$GameServiceResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code) createGame,
    required TResult Function() deleteGame,
    required TResult Function(IList<GameInfo> games) listGames,
    required TResult Function() exitGame,
    required TResult Function(String playerID) joinGame,
    required TResult Function() startGame,
    required TResult Function(GameInfo gameInfo) watchLobby,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code)? createGame,
    TResult Function()? deleteGame,
    TResult Function(IList<GameInfo> games)? listGames,
    TResult Function()? exitGame,
    TResult Function(String playerID)? joinGame,
    TResult Function()? startGame,
    TResult Function(GameInfo gameInfo)? watchLobby,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameResponse value) createGame,
    required TResult Function(DeleteGameResponse value) deleteGame,
    required TResult Function(ListGamesResponse value) listGames,
    required TResult Function(ExitGameResponse value) exitGame,
    required TResult Function(JoinGameResponse value) joinGame,
    required TResult Function(StartGameResponse value) startGame,
    required TResult Function(WatchLobbyResponse value) watchLobby,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameResponse value)? createGame,
    TResult Function(DeleteGameResponse value)? deleteGame,
    TResult Function(ListGamesResponse value)? listGames,
    TResult Function(ExitGameResponse value)? exitGame,
    TResult Function(JoinGameResponse value)? joinGame,
    TResult Function(StartGameResponse value)? startGame,
    TResult Function(WatchLobbyResponse value)? watchLobby,
  }) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameServiceResponseCopyWith<$Res> {
  factory $GameServiceResponseCopyWith(
          GameServiceResponse value, $Res Function(GameServiceResponse) then) =
      _$GameServiceResponseCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameServiceResponseCopyWithImpl<$Res>
    implements $GameServiceResponseCopyWith<$Res> {
  _$GameServiceResponseCopyWithImpl(this._value, this._then);

  final GameServiceResponse _value;
  // ignore: unused_field
  final $Res Function(GameServiceResponse) _then;
}

/// @nodoc
abstract class $CreateGameResponseCopyWith<$Res> {
  factory $CreateGameResponseCopyWith(
          CreateGameResponse value, $Res Function(CreateGameResponse) then) =
      _$CreateGameResponseCopyWithImpl<$Res>;
  $Res call({String playerID, String code});
}

/// @nodoc
class _$CreateGameResponseCopyWithImpl<$Res>
    extends _$GameServiceResponseCopyWithImpl<$Res>
    implements $CreateGameResponseCopyWith<$Res> {
  _$CreateGameResponseCopyWithImpl(
      CreateGameResponse _value, $Res Function(CreateGameResponse) _then)
      : super(_value, (v) => _then(v as CreateGameResponse));

  @override
  CreateGameResponse get _value => super._value as CreateGameResponse;

  @override
  $Res call({
    Object? playerID = freezed,
    Object? code = freezed,
  }) {
    return _then(CreateGameResponse(
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
@JsonSerializable()
class _$CreateGameResponse implements CreateGameResponse {
  const _$CreateGameResponse(
      {required this.playerID, required this.code, String? $type})
      : $type = $type ?? 'createGame';

  factory _$CreateGameResponse.fromJson(Map<String, dynamic> json) =>
      _$$CreateGameResponseFromJson(json);

  @override
  final String playerID;
  @override
  final String code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceResponse.createGame(playerID: $playerID, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateGameResponse &&
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
  $CreateGameResponseCopyWith<CreateGameResponse> get copyWith =>
      _$CreateGameResponseCopyWithImpl<CreateGameResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code) createGame,
    required TResult Function() deleteGame,
    required TResult Function(IList<GameInfo> games) listGames,
    required TResult Function() exitGame,
    required TResult Function(String playerID) joinGame,
    required TResult Function() startGame,
    required TResult Function(GameInfo gameInfo) watchLobby,
  }) {
    return createGame(playerID, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code)? createGame,
    TResult Function()? deleteGame,
    TResult Function(IList<GameInfo> games)? listGames,
    TResult Function()? exitGame,
    TResult Function(String playerID)? joinGame,
    TResult Function()? startGame,
    TResult Function(GameInfo gameInfo)? watchLobby,
  }) {
    return createGame?.call(playerID, code);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameResponse value) createGame,
    required TResult Function(DeleteGameResponse value) deleteGame,
    required TResult Function(ListGamesResponse value) listGames,
    required TResult Function(ExitGameResponse value) exitGame,
    required TResult Function(JoinGameResponse value) joinGame,
    required TResult Function(StartGameResponse value) startGame,
    required TResult Function(WatchLobbyResponse value) watchLobby,
  }) {
    return createGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameResponse value)? createGame,
    TResult Function(DeleteGameResponse value)? deleteGame,
    TResult Function(ListGamesResponse value)? listGames,
    TResult Function(ExitGameResponse value)? exitGame,
    TResult Function(JoinGameResponse value)? joinGame,
    TResult Function(StartGameResponse value)? startGame,
    TResult Function(WatchLobbyResponse value)? watchLobby,
  }) {
    return createGame?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateGameResponseToJson(this);
  }
}

abstract class CreateGameResponse implements GameServiceResponse {
  const factory CreateGameResponse(
      {required String playerID, required String code}) = _$CreateGameResponse;

  factory CreateGameResponse.fromJson(Map<String, dynamic> json) =
      _$CreateGameResponse.fromJson;

  String get playerID;
  String get code;
  @JsonKey(ignore: true)
  $CreateGameResponseCopyWith<CreateGameResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteGameResponseCopyWith<$Res> {
  factory $DeleteGameResponseCopyWith(
          DeleteGameResponse value, $Res Function(DeleteGameResponse) then) =
      _$DeleteGameResponseCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeleteGameResponseCopyWithImpl<$Res>
    extends _$GameServiceResponseCopyWithImpl<$Res>
    implements $DeleteGameResponseCopyWith<$Res> {
  _$DeleteGameResponseCopyWithImpl(
      DeleteGameResponse _value, $Res Function(DeleteGameResponse) _then)
      : super(_value, (v) => _then(v as DeleteGameResponse));

  @override
  DeleteGameResponse get _value => super._value as DeleteGameResponse;
}

/// @nodoc
@JsonSerializable()
class _$DeleteGameResponse implements DeleteGameResponse {
  const _$DeleteGameResponse({String? $type}) : $type = $type ?? 'deleteGame';

  factory _$DeleteGameResponse.fromJson(Map<String, dynamic> json) =>
      _$$DeleteGameResponseFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceResponse.deleteGame()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteGameResponse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code) createGame,
    required TResult Function() deleteGame,
    required TResult Function(IList<GameInfo> games) listGames,
    required TResult Function() exitGame,
    required TResult Function(String playerID) joinGame,
    required TResult Function() startGame,
    required TResult Function(GameInfo gameInfo) watchLobby,
  }) {
    return deleteGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code)? createGame,
    TResult Function()? deleteGame,
    TResult Function(IList<GameInfo> games)? listGames,
    TResult Function()? exitGame,
    TResult Function(String playerID)? joinGame,
    TResult Function()? startGame,
    TResult Function(GameInfo gameInfo)? watchLobby,
  }) {
    return deleteGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameResponse value) createGame,
    required TResult Function(DeleteGameResponse value) deleteGame,
    required TResult Function(ListGamesResponse value) listGames,
    required TResult Function(ExitGameResponse value) exitGame,
    required TResult Function(JoinGameResponse value) joinGame,
    required TResult Function(StartGameResponse value) startGame,
    required TResult Function(WatchLobbyResponse value) watchLobby,
  }) {
    return deleteGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameResponse value)? createGame,
    TResult Function(DeleteGameResponse value)? deleteGame,
    TResult Function(ListGamesResponse value)? listGames,
    TResult Function(ExitGameResponse value)? exitGame,
    TResult Function(JoinGameResponse value)? joinGame,
    TResult Function(StartGameResponse value)? startGame,
    TResult Function(WatchLobbyResponse value)? watchLobby,
  }) {
    return deleteGame?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteGameResponseToJson(this);
  }
}

abstract class DeleteGameResponse implements GameServiceResponse {
  const factory DeleteGameResponse() = _$DeleteGameResponse;

  factory DeleteGameResponse.fromJson(Map<String, dynamic> json) =
      _$DeleteGameResponse.fromJson;
}

/// @nodoc
abstract class $ListGamesResponseCopyWith<$Res> {
  factory $ListGamesResponseCopyWith(
          ListGamesResponse value, $Res Function(ListGamesResponse) then) =
      _$ListGamesResponseCopyWithImpl<$Res>;
  $Res call({IList<GameInfo> games});
}

/// @nodoc
class _$ListGamesResponseCopyWithImpl<$Res>
    extends _$GameServiceResponseCopyWithImpl<$Res>
    implements $ListGamesResponseCopyWith<$Res> {
  _$ListGamesResponseCopyWithImpl(
      ListGamesResponse _value, $Res Function(ListGamesResponse) _then)
      : super(_value, (v) => _then(v as ListGamesResponse));

  @override
  ListGamesResponse get _value => super._value as ListGamesResponse;

  @override
  $Res call({
    Object? games = freezed,
  }) {
    return _then(ListGamesResponse(
      games: games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as IList<GameInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListGamesResponse implements ListGamesResponse {
  const _$ListGamesResponse({required this.games, String? $type})
      : $type = $type ?? 'listGames';

  factory _$ListGamesResponse.fromJson(Map<String, dynamic> json) =>
      _$$ListGamesResponseFromJson(json);

  @override
  final IList<GameInfo> games;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceResponse.listGames(games: $games)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListGamesResponse &&
            const DeepCollectionEquality().equals(other.games, games));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(games));

  @JsonKey(ignore: true)
  @override
  $ListGamesResponseCopyWith<ListGamesResponse> get copyWith =>
      _$ListGamesResponseCopyWithImpl<ListGamesResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code) createGame,
    required TResult Function() deleteGame,
    required TResult Function(IList<GameInfo> games) listGames,
    required TResult Function() exitGame,
    required TResult Function(String playerID) joinGame,
    required TResult Function() startGame,
    required TResult Function(GameInfo gameInfo) watchLobby,
  }) {
    return listGames(games);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code)? createGame,
    TResult Function()? deleteGame,
    TResult Function(IList<GameInfo> games)? listGames,
    TResult Function()? exitGame,
    TResult Function(String playerID)? joinGame,
    TResult Function()? startGame,
    TResult Function(GameInfo gameInfo)? watchLobby,
  }) {
    return listGames?.call(games);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameResponse value) createGame,
    required TResult Function(DeleteGameResponse value) deleteGame,
    required TResult Function(ListGamesResponse value) listGames,
    required TResult Function(ExitGameResponse value) exitGame,
    required TResult Function(JoinGameResponse value) joinGame,
    required TResult Function(StartGameResponse value) startGame,
    required TResult Function(WatchLobbyResponse value) watchLobby,
  }) {
    return listGames(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameResponse value)? createGame,
    TResult Function(DeleteGameResponse value)? deleteGame,
    TResult Function(ListGamesResponse value)? listGames,
    TResult Function(ExitGameResponse value)? exitGame,
    TResult Function(JoinGameResponse value)? joinGame,
    TResult Function(StartGameResponse value)? startGame,
    TResult Function(WatchLobbyResponse value)? watchLobby,
  }) {
    return listGames?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ListGamesResponseToJson(this);
  }
}

abstract class ListGamesResponse implements GameServiceResponse {
  const factory ListGamesResponse({required IList<GameInfo> games}) =
      _$ListGamesResponse;

  factory ListGamesResponse.fromJson(Map<String, dynamic> json) =
      _$ListGamesResponse.fromJson;

  IList<GameInfo> get games;
  @JsonKey(ignore: true)
  $ListGamesResponseCopyWith<ListGamesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExitGameResponseCopyWith<$Res> {
  factory $ExitGameResponseCopyWith(
          ExitGameResponse value, $Res Function(ExitGameResponse) then) =
      _$ExitGameResponseCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExitGameResponseCopyWithImpl<$Res>
    extends _$GameServiceResponseCopyWithImpl<$Res>
    implements $ExitGameResponseCopyWith<$Res> {
  _$ExitGameResponseCopyWithImpl(
      ExitGameResponse _value, $Res Function(ExitGameResponse) _then)
      : super(_value, (v) => _then(v as ExitGameResponse));

  @override
  ExitGameResponse get _value => super._value as ExitGameResponse;
}

/// @nodoc
@JsonSerializable()
class _$ExitGameResponse implements ExitGameResponse {
  const _$ExitGameResponse({String? $type}) : $type = $type ?? 'exitGame';

  factory _$ExitGameResponse.fromJson(Map<String, dynamic> json) =>
      _$$ExitGameResponseFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceResponse.exitGame()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExitGameResponse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code) createGame,
    required TResult Function() deleteGame,
    required TResult Function(IList<GameInfo> games) listGames,
    required TResult Function() exitGame,
    required TResult Function(String playerID) joinGame,
    required TResult Function() startGame,
    required TResult Function(GameInfo gameInfo) watchLobby,
  }) {
    return exitGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code)? createGame,
    TResult Function()? deleteGame,
    TResult Function(IList<GameInfo> games)? listGames,
    TResult Function()? exitGame,
    TResult Function(String playerID)? joinGame,
    TResult Function()? startGame,
    TResult Function(GameInfo gameInfo)? watchLobby,
  }) {
    return exitGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameResponse value) createGame,
    required TResult Function(DeleteGameResponse value) deleteGame,
    required TResult Function(ListGamesResponse value) listGames,
    required TResult Function(ExitGameResponse value) exitGame,
    required TResult Function(JoinGameResponse value) joinGame,
    required TResult Function(StartGameResponse value) startGame,
    required TResult Function(WatchLobbyResponse value) watchLobby,
  }) {
    return exitGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameResponse value)? createGame,
    TResult Function(DeleteGameResponse value)? deleteGame,
    TResult Function(ListGamesResponse value)? listGames,
    TResult Function(ExitGameResponse value)? exitGame,
    TResult Function(JoinGameResponse value)? joinGame,
    TResult Function(StartGameResponse value)? startGame,
    TResult Function(WatchLobbyResponse value)? watchLobby,
  }) {
    return exitGame?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExitGameResponseToJson(this);
  }
}

abstract class ExitGameResponse implements GameServiceResponse {
  const factory ExitGameResponse() = _$ExitGameResponse;

  factory ExitGameResponse.fromJson(Map<String, dynamic> json) =
      _$ExitGameResponse.fromJson;
}

/// @nodoc
abstract class $JoinGameResponseCopyWith<$Res> {
  factory $JoinGameResponseCopyWith(
          JoinGameResponse value, $Res Function(JoinGameResponse) then) =
      _$JoinGameResponseCopyWithImpl<$Res>;
  $Res call({String playerID});
}

/// @nodoc
class _$JoinGameResponseCopyWithImpl<$Res>
    extends _$GameServiceResponseCopyWithImpl<$Res>
    implements $JoinGameResponseCopyWith<$Res> {
  _$JoinGameResponseCopyWithImpl(
      JoinGameResponse _value, $Res Function(JoinGameResponse) _then)
      : super(_value, (v) => _then(v as JoinGameResponse));

  @override
  JoinGameResponse get _value => super._value as JoinGameResponse;

  @override
  $Res call({
    Object? playerID = freezed,
  }) {
    return _then(JoinGameResponse(
      playerID: playerID == freezed
          ? _value.playerID
          : playerID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinGameResponse implements JoinGameResponse {
  const _$JoinGameResponse({required this.playerID, String? $type})
      : $type = $type ?? 'joinGame';

  factory _$JoinGameResponse.fromJson(Map<String, dynamic> json) =>
      _$$JoinGameResponseFromJson(json);

  @override
  final String playerID;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceResponse.joinGame(playerID: $playerID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JoinGameResponse &&
            const DeepCollectionEquality().equals(other.playerID, playerID));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(playerID));

  @JsonKey(ignore: true)
  @override
  $JoinGameResponseCopyWith<JoinGameResponse> get copyWith =>
      _$JoinGameResponseCopyWithImpl<JoinGameResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code) createGame,
    required TResult Function() deleteGame,
    required TResult Function(IList<GameInfo> games) listGames,
    required TResult Function() exitGame,
    required TResult Function(String playerID) joinGame,
    required TResult Function() startGame,
    required TResult Function(GameInfo gameInfo) watchLobby,
  }) {
    return joinGame(playerID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code)? createGame,
    TResult Function()? deleteGame,
    TResult Function(IList<GameInfo> games)? listGames,
    TResult Function()? exitGame,
    TResult Function(String playerID)? joinGame,
    TResult Function()? startGame,
    TResult Function(GameInfo gameInfo)? watchLobby,
  }) {
    return joinGame?.call(playerID);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameResponse value) createGame,
    required TResult Function(DeleteGameResponse value) deleteGame,
    required TResult Function(ListGamesResponse value) listGames,
    required TResult Function(ExitGameResponse value) exitGame,
    required TResult Function(JoinGameResponse value) joinGame,
    required TResult Function(StartGameResponse value) startGame,
    required TResult Function(WatchLobbyResponse value) watchLobby,
  }) {
    return joinGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameResponse value)? createGame,
    TResult Function(DeleteGameResponse value)? deleteGame,
    TResult Function(ListGamesResponse value)? listGames,
    TResult Function(ExitGameResponse value)? exitGame,
    TResult Function(JoinGameResponse value)? joinGame,
    TResult Function(StartGameResponse value)? startGame,
    TResult Function(WatchLobbyResponse value)? watchLobby,
  }) {
    return joinGame?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinGameResponseToJson(this);
  }
}

abstract class JoinGameResponse implements GameServiceResponse {
  const factory JoinGameResponse({required String playerID}) =
      _$JoinGameResponse;

  factory JoinGameResponse.fromJson(Map<String, dynamic> json) =
      _$JoinGameResponse.fromJson;

  String get playerID;
  @JsonKey(ignore: true)
  $JoinGameResponseCopyWith<JoinGameResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartGameResponseCopyWith<$Res> {
  factory $StartGameResponseCopyWith(
          StartGameResponse value, $Res Function(StartGameResponse) then) =
      _$StartGameResponseCopyWithImpl<$Res>;
}

/// @nodoc
class _$StartGameResponseCopyWithImpl<$Res>
    extends _$GameServiceResponseCopyWithImpl<$Res>
    implements $StartGameResponseCopyWith<$Res> {
  _$StartGameResponseCopyWithImpl(
      StartGameResponse _value, $Res Function(StartGameResponse) _then)
      : super(_value, (v) => _then(v as StartGameResponse));

  @override
  StartGameResponse get _value => super._value as StartGameResponse;
}

/// @nodoc
@JsonSerializable()
class _$StartGameResponse implements StartGameResponse {
  const _$StartGameResponse({String? $type}) : $type = $type ?? 'startGame';

  factory _$StartGameResponse.fromJson(Map<String, dynamic> json) =>
      _$$StartGameResponseFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceResponse.startGame()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StartGameResponse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code) createGame,
    required TResult Function() deleteGame,
    required TResult Function(IList<GameInfo> games) listGames,
    required TResult Function() exitGame,
    required TResult Function(String playerID) joinGame,
    required TResult Function() startGame,
    required TResult Function(GameInfo gameInfo) watchLobby,
  }) {
    return startGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code)? createGame,
    TResult Function()? deleteGame,
    TResult Function(IList<GameInfo> games)? listGames,
    TResult Function()? exitGame,
    TResult Function(String playerID)? joinGame,
    TResult Function()? startGame,
    TResult Function(GameInfo gameInfo)? watchLobby,
  }) {
    return startGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameResponse value) createGame,
    required TResult Function(DeleteGameResponse value) deleteGame,
    required TResult Function(ListGamesResponse value) listGames,
    required TResult Function(ExitGameResponse value) exitGame,
    required TResult Function(JoinGameResponse value) joinGame,
    required TResult Function(StartGameResponse value) startGame,
    required TResult Function(WatchLobbyResponse value) watchLobby,
  }) {
    return startGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameResponse value)? createGame,
    TResult Function(DeleteGameResponse value)? deleteGame,
    TResult Function(ListGamesResponse value)? listGames,
    TResult Function(ExitGameResponse value)? exitGame,
    TResult Function(JoinGameResponse value)? joinGame,
    TResult Function(StartGameResponse value)? startGame,
    TResult Function(WatchLobbyResponse value)? watchLobby,
  }) {
    return startGame?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StartGameResponseToJson(this);
  }
}

abstract class StartGameResponse implements GameServiceResponse {
  const factory StartGameResponse() = _$StartGameResponse;

  factory StartGameResponse.fromJson(Map<String, dynamic> json) =
      _$StartGameResponse.fromJson;
}

/// @nodoc
abstract class $WatchLobbyResponseCopyWith<$Res> {
  factory $WatchLobbyResponseCopyWith(
          WatchLobbyResponse value, $Res Function(WatchLobbyResponse) then) =
      _$WatchLobbyResponseCopyWithImpl<$Res>;
  $Res call({GameInfo gameInfo});

  $GameInfoCopyWith<$Res> get gameInfo;
}

/// @nodoc
class _$WatchLobbyResponseCopyWithImpl<$Res>
    extends _$GameServiceResponseCopyWithImpl<$Res>
    implements $WatchLobbyResponseCopyWith<$Res> {
  _$WatchLobbyResponseCopyWithImpl(
      WatchLobbyResponse _value, $Res Function(WatchLobbyResponse) _then)
      : super(_value, (v) => _then(v as WatchLobbyResponse));

  @override
  WatchLobbyResponse get _value => super._value as WatchLobbyResponse;

  @override
  $Res call({
    Object? gameInfo = freezed,
  }) {
    return _then(WatchLobbyResponse(
      gameInfo: gameInfo == freezed
          ? _value.gameInfo
          : gameInfo // ignore: cast_nullable_to_non_nullable
              as GameInfo,
    ));
  }

  @override
  $GameInfoCopyWith<$Res> get gameInfo {
    return $GameInfoCopyWith<$Res>(_value.gameInfo, (value) {
      return _then(_value.copyWith(gameInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchLobbyResponse implements WatchLobbyResponse {
  const _$WatchLobbyResponse({required this.gameInfo, String? $type})
      : $type = $type ?? 'watchLobby';

  factory _$WatchLobbyResponse.fromJson(Map<String, dynamic> json) =>
      _$$WatchLobbyResponseFromJson(json);

  @override
  final GameInfo gameInfo;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GameServiceResponse.watchLobby(gameInfo: $gameInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchLobbyResponse &&
            const DeepCollectionEquality().equals(other.gameInfo, gameInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(gameInfo));

  @JsonKey(ignore: true)
  @override
  $WatchLobbyResponseCopyWith<WatchLobbyResponse> get copyWith =>
      _$WatchLobbyResponseCopyWithImpl<WatchLobbyResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerID, String code) createGame,
    required TResult Function() deleteGame,
    required TResult Function(IList<GameInfo> games) listGames,
    required TResult Function() exitGame,
    required TResult Function(String playerID) joinGame,
    required TResult Function() startGame,
    required TResult Function(GameInfo gameInfo) watchLobby,
  }) {
    return watchLobby(gameInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String playerID, String code)? createGame,
    TResult Function()? deleteGame,
    TResult Function(IList<GameInfo> games)? listGames,
    TResult Function()? exitGame,
    TResult Function(String playerID)? joinGame,
    TResult Function()? startGame,
    TResult Function(GameInfo gameInfo)? watchLobby,
  }) {
    return watchLobby?.call(gameInfo);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateGameResponse value) createGame,
    required TResult Function(DeleteGameResponse value) deleteGame,
    required TResult Function(ListGamesResponse value) listGames,
    required TResult Function(ExitGameResponse value) exitGame,
    required TResult Function(JoinGameResponse value) joinGame,
    required TResult Function(StartGameResponse value) startGame,
    required TResult Function(WatchLobbyResponse value) watchLobby,
  }) {
    return watchLobby(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateGameResponse value)? createGame,
    TResult Function(DeleteGameResponse value)? deleteGame,
    TResult Function(ListGamesResponse value)? listGames,
    TResult Function(ExitGameResponse value)? exitGame,
    TResult Function(JoinGameResponse value)? joinGame,
    TResult Function(StartGameResponse value)? startGame,
    TResult Function(WatchLobbyResponse value)? watchLobby,
  }) {
    return watchLobby?.call(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchLobbyResponseToJson(this);
  }
}

abstract class WatchLobbyResponse implements GameServiceResponse {
  const factory WatchLobbyResponse({required GameInfo gameInfo}) =
      _$WatchLobbyResponse;

  factory WatchLobbyResponse.fromJson(Map<String, dynamic> json) =
      _$WatchLobbyResponse.fromJson;

  GameInfo get gameInfo;
  @JsonKey(ignore: true)
  $WatchLobbyResponseCopyWith<WatchLobbyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
