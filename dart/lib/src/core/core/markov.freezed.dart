// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'markov.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Matrix _$MatrixFromJson(Map<String, dynamic> json) {
return _Matrix.fromJson(json);
}

/// @nodoc
mixin _$Matrix {

 List<List<(double, double)>> get rewards => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$MatrixCopyWith<Matrix> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $MatrixCopyWith<$Res>  {
  factory $MatrixCopyWith(Matrix value, $Res Function(Matrix) then) = _$MatrixCopyWithImpl<$Res>;
$Res call({
 List<List<(double, double)>> rewards
});



}

/// @nodoc
class _$MatrixCopyWithImpl<$Res> implements $MatrixCopyWith<$Res> {
  _$MatrixCopyWithImpl(this._value, this._then);

  final Matrix _value;
  // ignore: unused_field
  final $Res Function(Matrix) _then;

@override $Res call({Object? rewards = freezed,}) {
  return _then(_value.copyWith(
rewards: rewards == freezed ? _value.rewards : rewards // ignore: cast_nullable_to_non_nullable
as List<List<(double, double)>>,
  ));
}

}


/// @nodoc
abstract class _$$_MatrixCopyWith<$Res> implements $MatrixCopyWith<$Res> {
  factory _$$_MatrixCopyWith(_$_Matrix value, $Res Function(_$_Matrix) then) = __$$_MatrixCopyWithImpl<$Res>;
@override $Res call({
 List<List<(double, double)>> rewards
});



}

/// @nodoc
class __$$_MatrixCopyWithImpl<$Res> extends _$MatrixCopyWithImpl<$Res> implements _$$_MatrixCopyWith<$Res> {
  __$$_MatrixCopyWithImpl(_$_Matrix _value, $Res Function(_$_Matrix) _then)
      : super(_value, (v) => _then(v as _$_Matrix));

@override
_$_Matrix get _value => super._value as _$_Matrix;

@override $Res call({Object? rewards = freezed,}) {
  return _then(_$_Matrix(
rewards == freezed ? _value._rewards : rewards // ignore: cast_nullable_to_non_nullable
as List<List<(double, double)>>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$_Matrix extends _Matrix  {
  const _$_Matrix(final  List<List<(double, double)>> rewards): _rewards = rewards,super._();

  factory _$_Matrix.fromJson(Map<String, dynamic> json) => _$$_MatrixFromJson(json);

 final  List<List<(double, double)>> _rewards;
@override List<List<(double, double)>> get rewards {
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rewards);
}


@override
String toString() {
  return 'Matrix(rewards: $rewards)';
}


@override
bool operator ==(dynamic other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$_Matrix&&const DeepCollectionEquality().equals(other._rewards, _rewards));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rewards));

@JsonKey(ignore: true)
@override
_$$_MatrixCopyWith<_$_Matrix> get copyWith => __$$_MatrixCopyWithImpl<_$_Matrix>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$_MatrixToJson(this, );
}
}


abstract class _Matrix extends Matrix {
  const factory _Matrix(final  List<List<(double, double)>> rewards) = _$_Matrix;
  const _Matrix._(): super._();

  factory _Matrix.fromJson(Map<String, dynamic> json) = _$_Matrix.fromJson;

@override  List<List<(double, double)>> get rewards;
@override @JsonKey(ignore: true)
_$$_MatrixCopyWith<_$_Matrix> get copyWith => throw _privateConstructorUsedError;

}
