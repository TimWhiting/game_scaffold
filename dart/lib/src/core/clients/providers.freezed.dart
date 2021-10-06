// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoadingFutureTearOff {
  const _$LoadingFutureTearOff();

  FutureLoading<T> loading<T>() {
    return FutureLoading<T>();
  }

  FutureRefreshing<T> refreshing<T>(T lastValue) {
    return FutureRefreshing<T>(
      lastValue,
    );
  }

  FutureValue<T> value<T>(T value) {
    return FutureValue<T>(
      value,
    );
  }
}

/// @nodoc
const $LoadingFuture = _$LoadingFutureTearOff();

/// @nodoc
mixin _$LoadingFuture<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T lastValue) refreshing,
    required TResult Function(T value) value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T lastValue)? refreshing,
    TResult Function(T value)? value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T lastValue)? refreshing,
    TResult Function(T value)? value,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FutureLoading<T> value) loading,
    required TResult Function(FutureRefreshing<T> value) refreshing,
    required TResult Function(FutureValue<T> value) value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FutureLoading<T> value)? loading,
    TResult Function(FutureRefreshing<T> value)? refreshing,
    TResult Function(FutureValue<T> value)? value,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FutureLoading<T> value)? loading,
    TResult Function(FutureRefreshing<T> value)? refreshing,
    TResult Function(FutureValue<T> value)? value,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingFutureCopyWith<T, $Res> {
  factory $LoadingFutureCopyWith(
          LoadingFuture<T> value, $Res Function(LoadingFuture<T>) then) =
      _$LoadingFutureCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$LoadingFutureCopyWithImpl<T, $Res>
    implements $LoadingFutureCopyWith<T, $Res> {
  _$LoadingFutureCopyWithImpl(this._value, this._then);

  final LoadingFuture<T> _value;
  // ignore: unused_field
  final $Res Function(LoadingFuture<T>) _then;
}

/// @nodoc
abstract class $FutureLoadingCopyWith<T, $Res> {
  factory $FutureLoadingCopyWith(
          FutureLoading<T> value, $Res Function(FutureLoading<T>) then) =
      _$FutureLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$FutureLoadingCopyWithImpl<T, $Res>
    extends _$LoadingFutureCopyWithImpl<T, $Res>
    implements $FutureLoadingCopyWith<T, $Res> {
  _$FutureLoadingCopyWithImpl(
      FutureLoading<T> _value, $Res Function(FutureLoading<T>) _then)
      : super(_value, (v) => _then(v as FutureLoading<T>));

  @override
  FutureLoading<T> get _value => super._value as FutureLoading<T>;
}

/// @nodoc

class _$FutureLoading<T> extends FutureLoading<T> {
  const _$FutureLoading() : super._();

  @override
  String toString() {
    return 'LoadingFuture<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FutureLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T lastValue) refreshing,
    required TResult Function(T value) value,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T lastValue)? refreshing,
    TResult Function(T value)? value,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T lastValue)? refreshing,
    TResult Function(T value)? value,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FutureLoading<T> value) loading,
    required TResult Function(FutureRefreshing<T> value) refreshing,
    required TResult Function(FutureValue<T> value) value,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FutureLoading<T> value)? loading,
    TResult Function(FutureRefreshing<T> value)? refreshing,
    TResult Function(FutureValue<T> value)? value,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FutureLoading<T> value)? loading,
    TResult Function(FutureRefreshing<T> value)? refreshing,
    TResult Function(FutureValue<T> value)? value,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FutureLoading<T> extends LoadingFuture<T> {
  const factory FutureLoading() = _$FutureLoading<T>;
  const FutureLoading._() : super._();
}

/// @nodoc
abstract class $FutureRefreshingCopyWith<T, $Res> {
  factory $FutureRefreshingCopyWith(
          FutureRefreshing<T> value, $Res Function(FutureRefreshing<T>) then) =
      _$FutureRefreshingCopyWithImpl<T, $Res>;
  $Res call({T lastValue});
}

/// @nodoc
class _$FutureRefreshingCopyWithImpl<T, $Res>
    extends _$LoadingFutureCopyWithImpl<T, $Res>
    implements $FutureRefreshingCopyWith<T, $Res> {
  _$FutureRefreshingCopyWithImpl(
      FutureRefreshing<T> _value, $Res Function(FutureRefreshing<T>) _then)
      : super(_value, (v) => _then(v as FutureRefreshing<T>));

  @override
  FutureRefreshing<T> get _value => super._value as FutureRefreshing<T>;

  @override
  $Res call({
    Object? lastValue = freezed,
  }) {
    return _then(FutureRefreshing<T>(
      lastValue == freezed
          ? _value.lastValue
          : lastValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$FutureRefreshing<T> extends FutureRefreshing<T> {
  const _$FutureRefreshing(this.lastValue) : super._();

  @override
  final T lastValue;

  @override
  String toString() {
    return 'LoadingFuture<$T>.refreshing(lastValue: $lastValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FutureRefreshing<T> &&
            (identical(other.lastValue, lastValue) ||
                const DeepCollectionEquality()
                    .equals(other.lastValue, lastValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lastValue);

  @JsonKey(ignore: true)
  @override
  $FutureRefreshingCopyWith<T, FutureRefreshing<T>> get copyWith =>
      _$FutureRefreshingCopyWithImpl<T, FutureRefreshing<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T lastValue) refreshing,
    required TResult Function(T value) value,
  }) {
    return refreshing(lastValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T lastValue)? refreshing,
    TResult Function(T value)? value,
  }) {
    return refreshing?.call(lastValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T lastValue)? refreshing,
    TResult Function(T value)? value,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(lastValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FutureLoading<T> value) loading,
    required TResult Function(FutureRefreshing<T> value) refreshing,
    required TResult Function(FutureValue<T> value) value,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FutureLoading<T> value)? loading,
    TResult Function(FutureRefreshing<T> value)? refreshing,
    TResult Function(FutureValue<T> value)? value,
  }) {
    return refreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FutureLoading<T> value)? loading,
    TResult Function(FutureRefreshing<T> value)? refreshing,
    TResult Function(FutureValue<T> value)? value,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class FutureRefreshing<T> extends LoadingFuture<T> {
  const factory FutureRefreshing(T lastValue) = _$FutureRefreshing<T>;
  const FutureRefreshing._() : super._();

  T get lastValue => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FutureRefreshingCopyWith<T, FutureRefreshing<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FutureValueCopyWith<T, $Res> {
  factory $FutureValueCopyWith(
          FutureValue<T> value, $Res Function(FutureValue<T>) then) =
      _$FutureValueCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class _$FutureValueCopyWithImpl<T, $Res>
    extends _$LoadingFutureCopyWithImpl<T, $Res>
    implements $FutureValueCopyWith<T, $Res> {
  _$FutureValueCopyWithImpl(
      FutureValue<T> _value, $Res Function(FutureValue<T>) _then)
      : super(_value, (v) => _then(v as FutureValue<T>));

  @override
  FutureValue<T> get _value => super._value as FutureValue<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(FutureValue<T>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$FutureValue<T> extends FutureValue<T> {
  const _$FutureValue(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'LoadingFuture<$T>.value(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FutureValue<T> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $FutureValueCopyWith<T, FutureValue<T>> get copyWith =>
      _$FutureValueCopyWithImpl<T, FutureValue<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T lastValue) refreshing,
    required TResult Function(T value) value,
  }) {
    return value(this.value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T lastValue)? refreshing,
    TResult Function(T value)? value,
  }) {
    return value?.call(this.value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T lastValue)? refreshing,
    TResult Function(T value)? value,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this.value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FutureLoading<T> value) loading,
    required TResult Function(FutureRefreshing<T> value) refreshing,
    required TResult Function(FutureValue<T> value) value,
  }) {
    return value(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FutureLoading<T> value)? loading,
    TResult Function(FutureRefreshing<T> value)? refreshing,
    TResult Function(FutureValue<T> value)? value,
  }) {
    return value?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FutureLoading<T> value)? loading,
    TResult Function(FutureRefreshing<T> value)? refreshing,
    TResult Function(FutureValue<T> value)? value,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this);
    }
    return orElse();
  }
}

abstract class FutureValue<T> extends LoadingFuture<T> {
  const factory FutureValue(T value) = _$FutureValue<T>;
  const FutureValue._() : super._();

  T get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FutureValueCopyWith<T, FutureValue<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
