// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../data/model/remote/search_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) {
  return _SearchResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SearchResponseModel {
  @JsonKey(name: 'results')
  List<SearchModel> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResponseModelCopyWith<SearchResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResponseModelCopyWith<$Res> {
  factory $SearchResponseModelCopyWith(
          SearchResponseModel value, $Res Function(SearchResponseModel) then) =
      _$SearchResponseModelCopyWithImpl<$Res, SearchResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'results') List<SearchModel> items,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class _$SearchResponseModelCopyWithImpl<$Res, $Val extends SearchResponseModel>
    implements $SearchResponseModelCopyWith<$Res> {
  _$SearchResponseModelCopyWithImpl(this._value, this._then);

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
              as List<SearchModel>,
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
abstract class _$$SearchResponseModelImplCopyWith<$Res>
    implements $SearchResponseModelCopyWith<$Res> {
  factory _$$SearchResponseModelImplCopyWith(_$SearchResponseModelImpl value,
          $Res Function(_$SearchResponseModelImpl) then) =
      __$$SearchResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'results') List<SearchModel> items,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class __$$SearchResponseModelImplCopyWithImpl<$Res>
    extends _$SearchResponseModelCopyWithImpl<$Res, _$SearchResponseModelImpl>
    implements _$$SearchResponseModelImplCopyWith<$Res> {
  __$$SearchResponseModelImplCopyWithImpl(_$SearchResponseModelImpl _value,
      $Res Function(_$SearchResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalPages = null,
    Object? page = null,
    Object? totalResults = null,
  }) {
    return _then(_$SearchResponseModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SearchModel>,
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
@JsonSerializable()
class _$SearchResponseModelImpl implements _SearchResponseModel {
  _$SearchResponseModelImpl(
      {@JsonKey(name: 'results') required final List<SearchModel> items,
      @JsonKey(name: 'total_pages') required this.totalPages,
      @JsonKey(name: 'page') required this.page,
      @JsonKey(name: 'total_results') required this.totalResults})
      : _items = items;

  factory _$SearchResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResponseModelImplFromJson(json);

  final List<SearchModel> _items;
  @override
  @JsonKey(name: 'results')
  List<SearchModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;

  @override
  String toString() {
    return 'SearchResponseModel(items: $items, totalPages: $totalPages, page: $page, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResponseModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(ignore: true)
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
  _$$SearchResponseModelImplCopyWith<_$SearchResponseModelImpl> get copyWith =>
      __$$SearchResponseModelImplCopyWithImpl<_$SearchResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SearchResponseModel implements SearchResponseModel {
  factory _SearchResponseModel(
          {@JsonKey(name: 'results') required final List<SearchModel> items,
          @JsonKey(name: 'total_pages') required final int totalPages,
          @JsonKey(name: 'page') required final int page,
          @JsonKey(name: 'total_results') required final int totalResults}) =
      _$SearchResponseModelImpl;

  factory _SearchResponseModel.fromJson(Map<String, dynamic> json) =
      _$SearchResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'results')
  List<SearchModel> get items;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$SearchResponseModelImplCopyWith<_$SearchResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
