// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../domain/entity/search_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ContentTypeEnum? get mediaType => throw _privateConstructorUsedError;
  String get posterPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchItemCopyWith<SearchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemCopyWith<$Res> {
  factory $SearchItemCopyWith(
          SearchItem value, $Res Function(SearchItem) then) =
      _$SearchItemCopyWithImpl<$Res, SearchItem>;
  @useResult
  $Res call(
      {int id, String name, ContentTypeEnum? mediaType, String posterPath});
}

/// @nodoc
class _$SearchItemCopyWithImpl<$Res, $Val extends SearchItem>
    implements $SearchItemCopyWith<$Res> {
  _$SearchItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mediaType = freezed,
    Object? posterPath = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as ContentTypeEnum?,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchItemImplCopyWith<$Res>
    implements $SearchItemCopyWith<$Res> {
  factory _$$SearchItemImplCopyWith(
          _$SearchItemImpl value, $Res Function(_$SearchItemImpl) then) =
      __$$SearchItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, ContentTypeEnum? mediaType, String posterPath});
}

/// @nodoc
class __$$SearchItemImplCopyWithImpl<$Res>
    extends _$SearchItemCopyWithImpl<$Res, _$SearchItemImpl>
    implements _$$SearchItemImplCopyWith<$Res> {
  __$$SearchItemImplCopyWithImpl(
      _$SearchItemImpl _value, $Res Function(_$SearchItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mediaType = freezed,
    Object? posterPath = null,
  }) {
    return _then(_$SearchItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as ContentTypeEnum?,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchItemImpl extends _SearchItem {
  _$SearchItemImpl(
      {required this.id,
      required this.name,
      required this.mediaType,
      required this.posterPath})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final ContentTypeEnum? mediaType;
  @override
  final String posterPath;

  @override
  String toString() {
    return 'SearchItem(id: $id, name: $name, mediaType: $mediaType, posterPath: $posterPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, mediaType, posterPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchItemImplCopyWith<_$SearchItemImpl> get copyWith =>
      __$$SearchItemImplCopyWithImpl<_$SearchItemImpl>(this, _$identity);
}

abstract class _SearchItem extends SearchItem {
  factory _SearchItem(
      {required final int id,
      required final String name,
      required final ContentTypeEnum? mediaType,
      required final String posterPath}) = _$SearchItemImpl;
  _SearchItem._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  ContentTypeEnum? get mediaType;
  @override
  String get posterPath;
  @override
  @JsonKey(ignore: true)
  _$$SearchItemImplCopyWith<_$SearchItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
