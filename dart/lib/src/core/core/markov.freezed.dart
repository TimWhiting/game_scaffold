// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'markov.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Matrix _$MatrixFromJson(Map<String, dynamic> json) {
  return _Matrix.fromJson(json);
}

/// @nodoc
class _$MatrixTearOff {
  const _$MatrixTearOff();

  _Matrix call(List<List<Reward>> rewards) {
    return _Matrix(
      rewards,
    );
  }

  Matrix fromJson(Map<String, Object> json) {
    return Matrix.fromJson(json);
  }
}

/// @nodoc
const $Matrix = _$MatrixTearOff();

/// @nodoc
mixin _$Matrix {
  List<List<Reward>> get rewards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatrixCopyWith<Matrix> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatrixCopyWith<$Res> {
  factory $MatrixCopyWith(Matrix value, $Res Function(Matrix) then) =
      _$MatrixCopyWithImpl<$Res>;
  $Res call({List<List<Reward>> rewards});
}

/// @nodoc
class _$MatrixCopyWithImpl<$Res> implements $MatrixCopyWith<$Res> {
  _$MatrixCopyWithImpl(this._value, this._then);

  final Matrix _value;
  // ignore: unused_field
  final $Res Function(Matrix) _then;

  @override
  $Res call({
    Object? rewards = freezed,
  }) {
    return _then(_value.copyWith(
      rewards: rewards == freezed
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<List<Reward>>,
    ));
  }
}

/// @nodoc
abstract class _$MatrixCopyWith<$Res> implements $MatrixCopyWith<$Res> {
  factory _$MatrixCopyWith(_Matrix value, $Res Function(_Matrix) then) =
      __$MatrixCopyWithImpl<$Res>;
  @override
  $Res call({List<List<Reward>> rewards});
}

/// @nodoc
class __$MatrixCopyWithImpl<$Res> extends _$MatrixCopyWithImpl<$Res>
    implements _$MatrixCopyWith<$Res> {
  __$MatrixCopyWithImpl(_Matrix _value, $Res Function(_Matrix) _then)
      : super(_value, (v) => _then(v as _Matrix));

  @override
  _Matrix get _value => super._value as _Matrix;

  @override
  $Res call({
    Object? rewards = freezed,
  }) {
    return _then(_Matrix(
      rewards == freezed
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<List<Reward>>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Matrix implements _Matrix {
  const _$_Matrix(this.rewards);

  factory _$_Matrix.fromJson(Map<String, dynamic> json) =>
      _$_$_MatrixFromJson(json);

  @override
  final List<List<Reward>> rewards;

  @override
  String toString() {
    return 'Matrix(rewards: $rewards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Matrix &&
            (identical(other.rewards, rewards) ||
                const DeepCollectionEquality().equals(other.rewards, rewards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(rewards);

  @JsonKey(ignore: true)
  @override
  _$MatrixCopyWith<_Matrix> get copyWith =>
      __$MatrixCopyWithImpl<_Matrix>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MatrixToJson(this);
  }
}

abstract class _Matrix implements Matrix {
  const factory _Matrix(List<List<Reward>> rewards) = _$_Matrix;

  factory _Matrix.fromJson(Map<String, dynamic> json) = _$_Matrix.fromJson;

  @override
  List<List<Reward>> get rewards => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MatrixCopyWith<_Matrix> get copyWith => throw _privateConstructorUsedError;
}

JointAction _$JointActionFromJson(Map<String, dynamic> json) {
  return _JointAction.fromJson(json);
}

/// @nodoc
class _$JointActionTearOff {
  const _$JointActionTearOff();

  _JointAction twoPlayer({required int p1, required int p2}) {
    return _JointAction(
      p1: p1,
      p2: p2,
    );
  }

  JointAction fromJson(Map<String, Object> json) {
    return JointAction.fromJson(json);
  }
}

/// @nodoc
const $JointAction = _$JointActionTearOff();

/// @nodoc
mixin _$JointAction {
  int get p1 => throw _privateConstructorUsedError;
  int get p2 => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int p1, int p2) twoPlayer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int p1, int p2)? twoPlayer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JointAction value) twoPlayer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JointAction value)? twoPlayer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JointActionCopyWith<JointAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JointActionCopyWith<$Res> {
  factory $JointActionCopyWith(
          JointAction value, $Res Function(JointAction) then) =
      _$JointActionCopyWithImpl<$Res>;
  $Res call({int p1, int p2});
}

/// @nodoc
class _$JointActionCopyWithImpl<$Res> implements $JointActionCopyWith<$Res> {
  _$JointActionCopyWithImpl(this._value, this._then);

  final JointAction _value;
  // ignore: unused_field
  final $Res Function(JointAction) _then;

  @override
  $Res call({
    Object? p1 = freezed,
    Object? p2 = freezed,
  }) {
    return _then(_value.copyWith(
      p1: p1 == freezed
          ? _value.p1
          : p1 // ignore: cast_nullable_to_non_nullable
              as int,
      p2: p2 == freezed
          ? _value.p2
          : p2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$JointActionCopyWith<$Res>
    implements $JointActionCopyWith<$Res> {
  factory _$JointActionCopyWith(
          _JointAction value, $Res Function(_JointAction) then) =
      __$JointActionCopyWithImpl<$Res>;
  @override
  $Res call({int p1, int p2});
}

/// @nodoc
class __$JointActionCopyWithImpl<$Res> extends _$JointActionCopyWithImpl<$Res>
    implements _$JointActionCopyWith<$Res> {
  __$JointActionCopyWithImpl(
      _JointAction _value, $Res Function(_JointAction) _then)
      : super(_value, (v) => _then(v as _JointAction));

  @override
  _JointAction get _value => super._value as _JointAction;

  @override
  $Res call({
    Object? p1 = freezed,
    Object? p2 = freezed,
  }) {
    return _then(_JointAction(
      p1: p1 == freezed
          ? _value.p1
          : p1 // ignore: cast_nullable_to_non_nullable
              as int,
      p2: p2 == freezed
          ? _value.p2
          : p2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_JointAction implements _JointAction {
  const _$_JointAction({required this.p1, required this.p2});

  factory _$_JointAction.fromJson(Map<String, dynamic> json) =>
      _$_$_JointActionFromJson(json);

  @override
  final int p1;
  @override
  final int p2;

  @override
  String toString() {
    return 'JointAction.twoPlayer(p1: $p1, p2: $p2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _JointAction &&
            (identical(other.p1, p1) ||
                const DeepCollectionEquality().equals(other.p1, p1)) &&
            (identical(other.p2, p2) ||
                const DeepCollectionEquality().equals(other.p2, p2)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(p1) ^
      const DeepCollectionEquality().hash(p2);

  @JsonKey(ignore: true)
  @override
  _$JointActionCopyWith<_JointAction> get copyWith =>
      __$JointActionCopyWithImpl<_JointAction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int p1, int p2) twoPlayer,
  }) {
    return twoPlayer(p1, p2);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int p1, int p2)? twoPlayer,
    required TResult orElse(),
  }) {
    if (twoPlayer != null) {
      return twoPlayer(p1, p2);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JointAction value) twoPlayer,
  }) {
    return twoPlayer(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JointAction value)? twoPlayer,
    required TResult orElse(),
  }) {
    if (twoPlayer != null) {
      return twoPlayer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_JointActionToJson(this);
  }
}

abstract class _JointAction implements JointAction {
  const factory _JointAction({required int p1, required int p2}) =
      _$_JointAction;

  factory _JointAction.fromJson(Map<String, dynamic> json) =
      _$_JointAction.fromJson;

  @override
  int get p1 => throw _privateConstructorUsedError;
  @override
  int get p2 => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$JointActionCopyWith<_JointAction> get copyWith =>
      throw _privateConstructorUsedError;
}

Reward _$RewardFromJson(Map<String, dynamic> json) {
  return _Reward.fromJson(json);
}

/// @nodoc
class _$RewardTearOff {
  const _$RewardTearOff();

  _Reward call({required double p1, required double p2}) {
    return _Reward(
      p1: p1,
      p2: p2,
    );
  }

  Reward fromJson(Map<String, Object> json) {
    return Reward.fromJson(json);
  }
}

/// @nodoc
const $Reward = _$RewardTearOff();

/// @nodoc
mixin _$Reward {
  double get p1 => throw _privateConstructorUsedError;
  double get p2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RewardCopyWith<Reward> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardCopyWith<$Res> {
  factory $RewardCopyWith(Reward value, $Res Function(Reward) then) =
      _$RewardCopyWithImpl<$Res>;
  $Res call({double p1, double p2});
}

/// @nodoc
class _$RewardCopyWithImpl<$Res> implements $RewardCopyWith<$Res> {
  _$RewardCopyWithImpl(this._value, this._then);

  final Reward _value;
  // ignore: unused_field
  final $Res Function(Reward) _then;

  @override
  $Res call({
    Object? p1 = freezed,
    Object? p2 = freezed,
  }) {
    return _then(_value.copyWith(
      p1: p1 == freezed
          ? _value.p1
          : p1 // ignore: cast_nullable_to_non_nullable
              as double,
      p2: p2 == freezed
          ? _value.p2
          : p2 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$RewardCopyWith<$Res> implements $RewardCopyWith<$Res> {
  factory _$RewardCopyWith(_Reward value, $Res Function(_Reward) then) =
      __$RewardCopyWithImpl<$Res>;
  @override
  $Res call({double p1, double p2});
}

/// @nodoc
class __$RewardCopyWithImpl<$Res> extends _$RewardCopyWithImpl<$Res>
    implements _$RewardCopyWith<$Res> {
  __$RewardCopyWithImpl(_Reward _value, $Res Function(_Reward) _then)
      : super(_value, (v) => _then(v as _Reward));

  @override
  _Reward get _value => super._value as _Reward;

  @override
  $Res call({
    Object? p1 = freezed,
    Object? p2 = freezed,
  }) {
    return _then(_Reward(
      p1: p1 == freezed
          ? _value.p1
          : p1 // ignore: cast_nullable_to_non_nullable
              as double,
      p2: p2 == freezed
          ? _value.p2
          : p2 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Reward implements _Reward {
  const _$_Reward({required this.p1, required this.p2});

  factory _$_Reward.fromJson(Map<String, dynamic> json) =>
      _$_$_RewardFromJson(json);

  @override
  final double p1;
  @override
  final double p2;

  @override
  String toString() {
    return 'Reward(p1: $p1, p2: $p2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Reward &&
            (identical(other.p1, p1) ||
                const DeepCollectionEquality().equals(other.p1, p1)) &&
            (identical(other.p2, p2) ||
                const DeepCollectionEquality().equals(other.p2, p2)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(p1) ^
      const DeepCollectionEquality().hash(p2);

  @JsonKey(ignore: true)
  @override
  _$RewardCopyWith<_Reward> get copyWith =>
      __$RewardCopyWithImpl<_Reward>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RewardToJson(this);
  }
}

abstract class _Reward implements Reward {
  const factory _Reward({required double p1, required double p2}) = _$_Reward;

  factory _Reward.fromJson(Map<String, dynamic> json) = _$_Reward.fromJson;

  @override
  double get p1 => throw _privateConstructorUsedError;
  @override
  double get p2 => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RewardCopyWith<_Reward> get copyWith => throw _privateConstructorUsedError;
}
