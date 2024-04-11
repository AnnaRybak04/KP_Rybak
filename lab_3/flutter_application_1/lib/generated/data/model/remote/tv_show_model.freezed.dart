// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../data/model/remote/tv_show_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TVShowModel _$TVShowModelFromJson(Map<String, dynamic> json) {
  return _TVShowModel.fromJson(json);
}

/// @nodoc
mixin _$TVShowModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview')
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  double get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_air_date')
  String get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity')
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_run_time')
  List<int>? get episodeRunTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'genres')
  List<GenresModel>? get genres => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_countries')
  List<ProductionModel>? get productionCountries =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'production_companies')
  List<ProductionModel>? get productionCompanies =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TVShowModelCopyWith<TVShowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TVShowModelCopyWith<$Res> {
  factory $TVShowModelCopyWith(
          TVShowModel value, $Res Function(TVShowModel) then) =
      _$TVShowModelCopyWithImpl<$Res, TVShowModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') double voteCount,
      @JsonKey(name: 'first_air_date') String releaseDate,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'original_language') String language,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'episode_run_time') List<int>? episodeRunTime,
      @JsonKey(name: 'genres') List<GenresModel>? genres,
      @JsonKey(name: 'production_countries')
      List<ProductionModel>? productionCountries,
      @JsonKey(name: 'production_companies')
      List<ProductionModel>? productionCompanies});
}

/// @nodoc
class _$TVShowModelCopyWithImpl<$Res, $Val extends TVShowModel>
    implements $TVShowModelCopyWith<$Res> {
  _$TVShowModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originalName = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? releaseDate = null,
    Object? popularity = null,
    Object? language = null,
    Object? status = freezed,
    Object? episodeRunTime = freezed,
    Object? genres = freezed,
    Object? productionCountries = freezed,
    Object? productionCompanies = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as double,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeRunTime: freezed == episodeRunTime
          ? _value.episodeRunTime
          : episodeRunTime // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenresModel>?,
      productionCountries: freezed == productionCountries
          ? _value.productionCountries
          : productionCountries // ignore: cast_nullable_to_non_nullable
              as List<ProductionModel>?,
      productionCompanies: freezed == productionCompanies
          ? _value.productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TVShowModelImplCopyWith<$Res>
    implements $TVShowModelCopyWith<$Res> {
  factory _$$TVShowModelImplCopyWith(
          _$TVShowModelImpl value, $Res Function(_$TVShowModelImpl) then) =
      __$$TVShowModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') double voteCount,
      @JsonKey(name: 'first_air_date') String releaseDate,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'original_language') String language,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'episode_run_time') List<int>? episodeRunTime,
      @JsonKey(name: 'genres') List<GenresModel>? genres,
      @JsonKey(name: 'production_countries')
      List<ProductionModel>? productionCountries,
      @JsonKey(name: 'production_companies')
      List<ProductionModel>? productionCompanies});
}

/// @nodoc
class __$$TVShowModelImplCopyWithImpl<$Res>
    extends _$TVShowModelCopyWithImpl<$Res, _$TVShowModelImpl>
    implements _$$TVShowModelImplCopyWith<$Res> {
  __$$TVShowModelImplCopyWithImpl(
      _$TVShowModelImpl _value, $Res Function(_$TVShowModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originalName = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? releaseDate = null,
    Object? popularity = null,
    Object? language = null,
    Object? status = freezed,
    Object? episodeRunTime = freezed,
    Object? genres = freezed,
    Object? productionCountries = freezed,
    Object? productionCompanies = freezed,
  }) {
    return _then(_$TVShowModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as double,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeRunTime: freezed == episodeRunTime
          ? _value._episodeRunTime
          : episodeRunTime // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenresModel>?,
      productionCountries: freezed == productionCountries
          ? _value._productionCountries
          : productionCountries // ignore: cast_nullable_to_non_nullable
              as List<ProductionModel>?,
      productionCompanies: freezed == productionCompanies
          ? _value._productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TVShowModelImpl implements _TVShowModel {
  _$TVShowModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'original_name') required this.originalName,
      @JsonKey(name: 'overview') required this.overview,
      @JsonKey(name: 'poster_path') required this.posterPath,
      @JsonKey(name: 'vote_average') required this.voteAverage,
      @JsonKey(name: 'vote_count') required this.voteCount,
      @JsonKey(name: 'first_air_date') required this.releaseDate,
      @JsonKey(name: 'popularity') required this.popularity,
      @JsonKey(name: 'original_language') required this.language,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'episode_run_time')
      required final List<int>? episodeRunTime,
      @JsonKey(name: 'genres') required final List<GenresModel>? genres,
      @JsonKey(name: 'production_countries')
      required final List<ProductionModel>? productionCountries,
      @JsonKey(name: 'production_companies')
      required final List<ProductionModel>? productionCompanies})
      : _episodeRunTime = episodeRunTime,
        _genres = genres,
        _productionCountries = productionCountries,
        _productionCompanies = productionCompanies;

  factory _$TVShowModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TVShowModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  @JsonKey(name: 'overview')
  final String overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final double voteCount;
  @override
  @JsonKey(name: 'first_air_date')
  final String releaseDate;
  @override
  @JsonKey(name: 'popularity')
  final double popularity;
  @override
  @JsonKey(name: 'original_language')
  final String language;
  @override
  @JsonKey(name: 'status')
  final String? status;
  final List<int>? _episodeRunTime;
  @override
  @JsonKey(name: 'episode_run_time')
  List<int>? get episodeRunTime {
    final value = _episodeRunTime;
    if (value == null) return null;
    if (_episodeRunTime is EqualUnmodifiableListView) return _episodeRunTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<GenresModel>? _genres;
  @override
  @JsonKey(name: 'genres')
  List<GenresModel>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductionModel>? _productionCountries;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionModel>? get productionCountries {
    final value = _productionCountries;
    if (value == null) return null;
    if (_productionCountries is EqualUnmodifiableListView)
      return _productionCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductionModel>? _productionCompanies;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionModel>? get productionCompanies {
    final value = _productionCompanies;
    if (value == null) return null;
    if (_productionCompanies is EqualUnmodifiableListView)
      return _productionCompanies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TVShowModel(id: $id, originalName: $originalName, overview: $overview, posterPath: $posterPath, voteAverage: $voteAverage, voteCount: $voteCount, releaseDate: $releaseDate, popularity: $popularity, language: $language, status: $status, episodeRunTime: $episodeRunTime, genres: $genres, productionCountries: $productionCountries, productionCompanies: $productionCompanies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TVShowModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._episodeRunTime, _episodeRunTime) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality()
                .equals(other._productionCountries, _productionCountries) &&
            const DeepCollectionEquality()
                .equals(other._productionCompanies, _productionCompanies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      originalName,
      overview,
      posterPath,
      voteAverage,
      voteCount,
      releaseDate,
      popularity,
      language,
      status,
      const DeepCollectionEquality().hash(_episodeRunTime),
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_productionCountries),
      const DeepCollectionEquality().hash(_productionCompanies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TVShowModelImplCopyWith<_$TVShowModelImpl> get copyWith =>
      __$$TVShowModelImplCopyWithImpl<_$TVShowModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TVShowModelImplToJson(
      this,
    );
  }
}

abstract class _TVShowModel implements TVShowModel {
  factory _TVShowModel(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'original_name') required final String originalName,
          @JsonKey(name: 'overview') required final String overview,
          @JsonKey(name: 'poster_path') required final String? posterPath,
          @JsonKey(name: 'vote_average') required final double voteAverage,
          @JsonKey(name: 'vote_count') required final double voteCount,
          @JsonKey(name: 'first_air_date') required final String releaseDate,
          @JsonKey(name: 'popularity') required final double popularity,
          @JsonKey(name: 'original_language') required final String language,
          @JsonKey(name: 'status') required final String? status,
          @JsonKey(name: 'episode_run_time')
          required final List<int>? episodeRunTime,
          @JsonKey(name: 'genres') required final List<GenresModel>? genres,
          @JsonKey(name: 'production_countries')
          required final List<ProductionModel>? productionCountries,
          @JsonKey(name: 'production_companies')
          required final List<ProductionModel>? productionCompanies}) =
      _$TVShowModelImpl;

  factory _TVShowModel.fromJson(Map<String, dynamic> json) =
      _$TVShowModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  @JsonKey(name: 'overview')
  String get overview;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  double get voteCount;
  @override
  @JsonKey(name: 'first_air_date')
  String get releaseDate;
  @override
  @JsonKey(name: 'popularity')
  double get popularity;
  @override
  @JsonKey(name: 'original_language')
  String get language;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'episode_run_time')
  List<int>? get episodeRunTime;
  @override
  @JsonKey(name: 'genres')
  List<GenresModel>? get genres;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionModel>? get productionCountries;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionModel>? get productionCompanies;
  @override
  @JsonKey(ignore: true)
  _$$TVShowModelImplCopyWith<_$TVShowModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
