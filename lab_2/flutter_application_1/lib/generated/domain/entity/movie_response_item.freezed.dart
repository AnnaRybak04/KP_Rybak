// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../domain/entity/movie_response_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieResponseItem {
  List<MovieItem> get items => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieResponseItemCopyWith<MovieResponseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieResponseItemCopyWith<$Res> {
  factory $MovieResponseItemCopyWith(
          MovieResponseItem value, $Res Function(MovieResponseItem) then) =
      _$MovieResponseItemCopyWithImpl<$Res, MovieResponseItem>;
  @useResult
  $Res call(
      {List<MovieItem> items, int totalPages, int page, int totalResults});
}

/// @nodoc
class _$MovieResponseItemCopyWithImpl<$Res, $Val extends MovieResponseItem>
    implements $MovieResponseItemCopyWith<$Res> {
  _$MovieResponseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalPages = null,
    Object? page = null,
    Object? totalResults = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MovieItem>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieResponseItemImplCopyWith<$Res>
    implements $MovieResponseItemCopyWith<$Res> {
  factory _$$MovieResponseItemImplCopyWith(_$MovieResponseItemImpl value,
          $Res Function(_$MovieResponseItemImpl) then) =
      __$$MovieResponseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MovieItem> items, int totalPages, int page, int totalResults});
}

/// @nodoc
class __$$MovieResponseItemImplCopyWithImpl<$Res>
    extends _$MovieResponseItemCopyWithImpl<$Res, _$MovieResponseItemImpl>
    implements _$$MovieResponseItemImplCopyWith<$Res> {
  __$$MovieResponseItemImplCopyWithImpl(_$MovieResponseItemImpl _value,
      $Res Function(_$MovieResponseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalPages = null,
    Object? page = null,
    Object? totalResults = null,
  }) {
    return _then(_$MovieResponseItemImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MovieItem>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MovieResponseItemImpl extends _MovieResponseItem {
  _$MovieResponseItemImpl(
      {required final List<MovieItem> items,
      required this.totalPages,
      required this.page,
      required this.totalResults})
      : _items = items,
        super._();

  final List<MovieItem> _items;
  @override
  List<MovieItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalPages;
  @override
  final int page;
  @override
  final int totalResults;

  @override
  String toString() {
    return 'MovieResponseItem(items: $items, totalPages: $totalPages, page: $page, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieResponseItemImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      totalPages,
      page,
      totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieResponseItemImplCopyWith<_$MovieResponseItemImpl> get copyWith =>
      __$$MovieResponseItemImplCopyWithImpl<_$MovieResponseItemImpl>(
          this, _$identity);
}

abstract class _MovieResponseItem extends MovieResponseItem {
  factory _MovieResponseItem(
      {required final List<MovieItem> items,
      required final int totalPages,
      required final int page,
      required final int totalResults}) = _$MovieResponseItemImpl;
  _MovieResponseItem._() : super._();

  @override
  List<MovieItem> get items;
  @override
  int get totalPages;
  @override
  int get page;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$MovieResponseItemImplCopyWith<_$MovieResponseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
