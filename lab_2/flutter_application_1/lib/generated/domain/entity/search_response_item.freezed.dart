// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../domain/entity/search_response_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchResponseItem {
  List<SearchItem> get items => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchResponseItemCopyWith<SearchResponseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResponseItemCopyWith<$Res> {
  factory $SearchResponseItemCopyWith(
          SearchResponseItem value, $Res Function(SearchResponseItem) then) =
      _$SearchResponseItemCopyWithImpl<$Res, SearchResponseItem>;
  @useResult
  $Res call(
      {List<SearchItem> items, int totalPages, int page, int totalResults});
}

/// @nodoc
class _$SearchResponseItemCopyWithImpl<$Res, $Val extends SearchResponseItem>
    implements $SearchResponseItemCopyWith<$Res> {
  _$SearchResponseItemCopyWithImpl(this._value, this._then);

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
              as List<SearchItem>,
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
abstract class _$$SearchResponseItemImplCopyWith<$Res>
    implements $SearchResponseItemCopyWith<$Res> {
  factory _$$SearchResponseItemImplCopyWith(_$SearchResponseItemImpl value,
          $Res Function(_$SearchResponseItemImpl) then) =
      __$$SearchResponseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SearchItem> items, int totalPages, int page, int totalResults});
}

/// @nodoc
class __$$SearchResponseItemImplCopyWithImpl<$Res>
    extends _$SearchResponseItemCopyWithImpl<$Res, _$SearchResponseItemImpl>
    implements _$$SearchResponseItemImplCopyWith<$Res> {
  __$$SearchResponseItemImplCopyWithImpl(_$SearchResponseItemImpl _value,
      $Res Function(_$SearchResponseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalPages = null,
    Object? page = null,
    Object? totalResults = null,
  }) {
    return _then(_$SearchResponseItemImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SearchItem>,
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

class _$SearchResponseItemImpl extends _SearchResponseItem {
  _$SearchResponseItemImpl(
      {required final List<SearchItem> items,
      required this.totalPages,
      required this.page,
      required this.totalResults})
      : _items = items,
        super._();

  final List<SearchItem> _items;
  @override
  List<SearchItem> get items {
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
    return 'SearchResponseItem(items: $items, totalPages: $totalPages, page: $page, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResponseItemImpl &&
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
  _$$SearchResponseItemImplCopyWith<_$SearchResponseItemImpl> get copyWith =>
      __$$SearchResponseItemImplCopyWithImpl<_$SearchResponseItemImpl>(
          this, _$identity);
}

abstract class _SearchResponseItem extends SearchResponseItem {
  factory _SearchResponseItem(
      {required final List<SearchItem> items,
      required final int totalPages,
      required final int page,
      required final int totalResults}) = _$SearchResponseItemImpl;
  _SearchResponseItem._() : super._();

  @override
  List<SearchItem> get items;
  @override
  int get totalPages;
  @override
  int get page;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$SearchResponseItemImplCopyWith<_$SearchResponseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
