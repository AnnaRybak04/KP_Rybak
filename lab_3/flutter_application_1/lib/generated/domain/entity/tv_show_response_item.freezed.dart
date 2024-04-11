// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../domain/entity/tv_show_response_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TVShowResponseItem {
  List<TVShowItem> get items => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TVShowResponseItemCopyWith<TVShowResponseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TVShowResponseItemCopyWith<$Res> {
  factory $TVShowResponseItemCopyWith(
          TVShowResponseItem value, $Res Function(TVShowResponseItem) then) =
      _$TVShowResponseItemCopyWithImpl<$Res, TVShowResponseItem>;
  @useResult
  $Res call(
      {List<TVShowItem> items, int totalPages, int page, int totalResults});
}

/// @nodoc
class _$TVShowResponseItemCopyWithImpl<$Res, $Val extends TVShowResponseItem>
    implements $TVShowResponseItemCopyWith<$Res> {
  _$TVShowResponseItemCopyWithImpl(this._value, this._then);

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
              as List<TVShowItem>,
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
abstract class _$$TVShowResponseItemImplCopyWith<$Res>
    implements $TVShowResponseItemCopyWith<$Res> {
  factory _$$TVShowResponseItemImplCopyWith(_$TVShowResponseItemImpl value,
          $Res Function(_$TVShowResponseItemImpl) then) =
      __$$TVShowResponseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TVShowItem> items, int totalPages, int page, int totalResults});
}

/// @nodoc
class __$$TVShowResponseItemImplCopyWithImpl<$Res>
    extends _$TVShowResponseItemCopyWithImpl<$Res, _$TVShowResponseItemImpl>
    implements _$$TVShowResponseItemImplCopyWith<$Res> {
  __$$TVShowResponseItemImplCopyWithImpl(_$TVShowResponseItemImpl _value,
      $Res Function(_$TVShowResponseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalPages = null,
    Object? page = null,
    Object? totalResults = null,
  }) {
    return _then(_$TVShowResponseItemImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TVShowItem>,
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

class _$TVShowResponseItemImpl extends _TVShowResponseItem {
  _$TVShowResponseItemImpl(
      {required final List<TVShowItem> items,
      required this.totalPages,
      required this.page,
      required this.totalResults})
      : _items = items,
        super._();

  final List<TVShowItem> _items;
  @override
  List<TVShowItem> get items {
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
    return 'TVShowResponseItem(items: $items, totalPages: $totalPages, page: $page, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TVShowResponseItemImpl &&
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
  _$$TVShowResponseItemImplCopyWith<_$TVShowResponseItemImpl> get copyWith =>
      __$$TVShowResponseItemImplCopyWithImpl<_$TVShowResponseItemImpl>(
          this, _$identity);
}

abstract class _TVShowResponseItem extends TVShowResponseItem {
  factory _TVShowResponseItem(
      {required final List<TVShowItem> items,
      required final int totalPages,
      required final int page,
      required final int totalResults}) = _$TVShowResponseItemImpl;
  _TVShowResponseItem._() : super._();

  @override
  List<TVShowItem> get items;
  @override
  int get totalPages;
  @override
  int get page;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$TVShowResponseItemImplCopyWith<_$TVShowResponseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
