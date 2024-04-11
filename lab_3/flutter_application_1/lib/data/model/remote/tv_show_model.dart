// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/common/serializable_interface.dart';
import 'package:flutter_application_1/data/model/remote/genres_model.dart';
import 'package:flutter_application_1/data/model/remote/production_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/model/remote/tv_show_model.freezed.dart';
part '../../../generated/data/model/remote/tv_show_model.g.dart';

@freezed
class TVShowModel with _$TVShowModel {
  factory TVShowModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'original_name') required String originalName,
    @JsonKey(name: 'overview') required String overview,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required double voteCount,
    @JsonKey(name: 'first_air_date') required String releaseDate,
    @JsonKey(name: 'popularity') required double popularity,
    @JsonKey(name: 'original_language') required String language,
    @JsonKey(name: 'status') required String? status,
    @JsonKey(name: 'episode_run_time') required List<int>? episodeRunTime,
    @JsonKey(name: 'genres') required List<GenresModel>? genres,
    @JsonKey(name: 'production_countries') required List<ProductionModel>? productionCountries,
    @JsonKey(name: 'production_companies') required List<ProductionModel>? productionCompanies,
  }) = _TVShowModel;

// Конструктор для десеріалізації JSON
  factory TVShowModel.fromJson(Json json) => _$TVShowModelFromJson(json);
}
