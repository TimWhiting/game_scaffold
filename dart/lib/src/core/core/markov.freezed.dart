// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'markov.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Matrix _$MatrixFromJson(Map<String, dynamic> json) {
  return _Matrix.fromJson(json);
}

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
abstract class _$$_MatrixCopyWith<$Res> implements $MatrixCopyWith<$Res> {
  factory _$$_MatrixCopyWith(_$_Matrix value, $Res Function(_$_Matrix) then) =
      __$$_MatrixCopyWithImpl<$Res>;
  @override
  $Res call({List<List<Reward>> rewards});
}

/// @nodoc
class __$$_MatrixCopyWithImpl<$Res> extends _$MatrixCopyWithImpl<$Res>
    implements _$$_MatrixCopyWith<$Res> {
  __$$_MatrixCopyWithImpl(_$_Matrix _value, $Res Function(_$_Matrix) _then)
      : super(_value, (v) => _then(v as _$_Matrix));

  @override
  _$_Matrix get _value => super._value as _$_Matrix;

  @override
  $Res call({
    Object? rewards = freezed,
  }) {
    return _then(_$_Matrix(
      rewards == freezed
          ? _value._rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<List<Reward>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Matrix implements _Matrix {
  const _$_Matrix(final List<List<Reward>> rewards) : _rewards = rewards;

  factory _$_Matrix.fromJson(Map<String, dynamic> json) =>
      _$$_MatrixFromJson(json);

  final List<List<Reward>> _rewards;
  @override
  List<List<Reward>> get rewards {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rewards);
  }

  @override
  String toString() {
    return 'Matrix(rewards: $rewards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Matrix &&
            const DeepCollectionEquality().equals(other._rewards, _rewards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rewards));

  @JsonKey(ignore: true)
  @override
  _$$_MatrixCopyWith<_$_Matrix> get copyWith =>
      __$$_MatrixCopyWithImpl<_$_Matrix>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatrixToJson(
      this,
    );
  }
}

abstract class _Matrix implements Matrix {
  const factory _Matrix(final List<List<Reward>> rewards) = _$_Matrix;

  factory _Matrix.fromJson(Map<String, dynamic> json) = _$_Matrix.fromJson;

  @override
  List<List<Reward>> get rewards;
  @override
  @JsonKey(ignore: true)
  _$$_MatrixCopyWith<_$_Matrix> get copyWith =>
      throw _privateConstructorUsedError;
}

JointAction _$JointActionFromJson(Map<String, dynamic> json) {
  return _JointAction.fromJson(json);
}

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int p1, int p2)? twoPlayer,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_JointAction value)? twoPlayer,
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
abstract class _$$_JointActionCopyWith<$Res>
    implements $JointActionCopyWith<$Res> {
  factory _$$_JointActionCopyWith(
          _$_JointAction value, $Res Function(_$_JointAction) then) =
      __$$_JointActionCopyWithImpl<$Res>;
  @override
  $Res call({int p1, int p2});
}

/// @nodoc
class __$$_JointActionCopyWithImpl<$Res> extends _$JointActionCopyWithImpl<$Res>
    implements _$$_JointActionCopyWith<$Res> {
  __$$_JointActionCopyWithImpl(
      _$_JointAction _value, $Res Function(_$_JointAction) _then)
      : super(_value, (v) => _then(v as _$_JointAction));

  @override
  _$_JointAction get _value => super._value as _$_JointAction;

  @override
  $Res call({
    Object? p1 = freezed,
    Object? p2 = freezed,
  }) {
    return _then(_$_JointAction(
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
@JsonSerializable()
class _$_JointAction implements _JointAction {
  const _$_JointAction({required this.p1, required this.p2});

  factory _$_JointAction.fromJson(Map<String, dynamic> json) =>
      _$$_JointActionFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_JointAction &&
            const DeepCollectionEquality().equals(other.p1, p1) &&
            const DeepCollectionEquality().equals(other.p2, p2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(p1),
      const DeepCollectionEquality().hash(p2));

  @JsonKey(ignore: true)
  @override
  _$$_JointActionCopyWith<_$_JointAction> get copyWith =>
      __$$_JointActionCopyWithImpl<_$_JointAction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int p1, int p2) twoPlayer,
  }) {
    return twoPlayer(p1, p2);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int p1, int p2)? twoPlayer,
  }) {
    return twoPlayer?.call(p1, p2);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_JointAction value)? twoPlayer,
  }) {
    return twoPlayer?.call(this);
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
    return _$$_JointActionToJson(
      this,
    );
  }
}

abstract class _JointAction implements JointAction {
  const factory _JointAction({required final int p1, required final int p2}) =
      _$_JointAction;

  factory _JointAction.fromJson(Map<String, dynamic> json) =
      _$_JointAction.fromJson;

  @override
  int get p1;
  @override
  int get p2;
  @override
  @JsonKey(ignore: true)
  _$$_JointActionCopyWith<_$_JointAction> get copyWith =>
      throw _privateConstructorUsedError;
}

Reward _$RewardFromJson(Map<String, dynamic> json) {
  return _Reward.fromJson(json);
}

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
abstract class _$$_RewardCopyWith<$Res> implements $RewardCopyWith<$Res> {
  factory _$$_RewardCopyWith(_$_Reward value, $Res Function(_$_Reward) then) =
      __$$_RewardCopyWithImpl<$Res>;
  @override
  $Res call({double p1, double p2});
}

/// @nodoc
class __$$_RewardCopyWithImpl<$Res> extends _$RewardCopyWithImpl<$Res>
    implements _$$_RewardCopyWith<$Res> {
  __$$_RewardCopyWithImpl(_$_Reward _value, $Res Function(_$_Reward) _then)
      : super(_value, (v) => _then(v as _$_Reward));

  @override
  _$_Reward get _value => super._value as _$_Reward;

  @override
  $Res call({
    Object? p1 = freezed,
    Object? p2 = freezed,
  }) {
    return _then(_$_Reward(
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
@JsonSerializable()
class _$_Reward implements _Reward {
  const _$_Reward({required this.p1, required this.p2});

  factory _$_Reward.fromJson(Map<String, dynamic> json) =>
      _$$_RewardFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_Reward &&
            const DeepCollectionEquality().equals(other.p1, p1) &&
            const DeepCollectionEquality().equals(other.p2, p2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(p1),
      const DeepCollectionEquality().hash(p2));

  @JsonKey(ignore: true)
  @override
  _$$_RewardCopyWith<_$_Reward> get copyWith =>
      __$$_RewardCopyWithImpl<_$_Reward>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RewardToJson(
      this,
    );
  }
}

abstract class _Reward implements Reward {
  const factory _Reward({required final double p1, required final double p2}) =
      _$_Reward;

  factory _Reward.fromJson(Map<String, dynamic> json) = _$_Reward.fromJson;

  @override
  double get p1;
  @override
  double get p2;
  @override
  @JsonKey(ignore: true)
  _$$_RewardCopyWith<_$_Reward> get copyWith =>
      throw _privateConstructorUsedError;
}
