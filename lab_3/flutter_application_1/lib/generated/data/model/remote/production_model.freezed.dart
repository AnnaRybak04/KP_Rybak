// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../data/model/remote/production_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductionModel _$ProductionModelFromJson(Map<String, dynamic> json) {
  return _ProductionModel.fromJson(json);
}

/// @nodoc
mixin _$ProductionModel {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionModelCopyWith<ProductionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionModelCopyWith<$Res> {
  factory $ProductionModelCopyWith(
          ProductionModel value, $Res Function(ProductionModel) then) =
      _$ProductionModelCopyWithImpl<$Res, ProductionModel>;
  @useResult
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class _$ProductionModelCopyWithImpl<$Res, $Val extends ProductionModel>
    implements $ProductionModelCopyWith<$Res> {
  _$ProductionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionModelImplCopyWith<$Res>
    implements $ProductionModelCopyWith<$Res> {
  factory _$$ProductionModelImplCopyWith(_$ProductionModelImpl value,
          $Res Function(_$ProductionModelImpl) then) =
      __$$ProductionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$ProductionModelImplCopyWithImpl<$Res>
    extends _$ProductionModelCopyWithImpl<$Res, _$ProductionModelImpl>
    implements _$$ProductionModelImplCopyWith<$Res> {
  __$$ProductionModelImplCopyWithImpl(
      _$ProductionModelImpl _value, $Res Function(_$ProductionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ProductionModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionModelImpl implements _ProductionModel {
  _$ProductionModelImpl({@JsonKey(name: 'name') required this.name});

  factory _$ProductionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'ProductionModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionModelImplCopyWith<_$ProductionModelImpl> get copyWith =>
      __$$ProductionModelImplCopyWithImpl<_$ProductionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionModelImplToJson(
      this,
    );
  }
}

abstract class _ProductionModel implements ProductionModel {
  factory _ProductionModel(
          {@JsonKey(name: 'name') required final String name}) =
      _$ProductionModelImpl;

  factory _ProductionModel.fromJson(Map<String, dynamic> json) =
      _$ProductionModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ProductionModelImplCopyWith<_$ProductionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
