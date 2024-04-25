// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/common/serializable_interface.dart';
import 'package:flutter_application_1/data/model/remote/genres_model.dart';
import 'package:flutter_application_1/data/model/remote/production_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/model/remote/movie_model.freezed.dart';
part '../../../generated/data/model/remote/movie_model.g.dart';

@freezed
// Клас GenresModel, який описує модель фільмів
class MovieModel with _$MovieModel {
  factory MovieModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'original_language') required String language,
    @JsonKey(name: 'original_title') required String originalTitle,
    @JsonKey(name: 'overview') required String overview,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required double voteCount,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'popularity') required double popularity,
    @JsonKey(name: 'status') required String? status,
    @JsonKey(name: 'tagline') required String? tagline,
    @JsonKey(name: 'production_countries') required List<ProductionModel>? productionCountries,
    @JsonKey(name: 'production_companies') required List<ProductionModel>? productionCompanies,
    @JsonKey(name: 'genres') required List<GenresModel>? genres,
    @JsonKey(name: 'budget') required int? budget,
  }) = _MovieModel;

// метод для створення об'єкту MovieModel з JSON
  factory MovieModel.fromJson(Json json) => _$MovieModelFromJson(json);
}
