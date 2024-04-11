// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/resourses/constants.dart';
import 'package:flutter_application_1/data/model/local/tv_show_model.dart' as local;
import 'package:flutter_application_1/data/model/remote/tv_show_model.dart' as remote;
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/domain/entity/tv_show_item.freezed.dart';

@freezed
class TVShowItem with _$TVShowItem {
  factory TVShowItem({
    required int id,
    required String originalName,
    required String language,
    required String overview,
    required String posterPath,
    required double voteAverage,
    required double voteCount,
    required String releaseDate,
    required double popularity,
    required String status,
    required List<int> episodeRunTime,
    required List<String> genres,
    required List<String> productionCountries,
    required List<String> productionCompanies,
  }) = _TVShowItem;
  
//метод для створення порожнього TVShowItem.
  factory TVShowItem.empty() {
    return TVShowItem(
      id: 0,
      originalName: '',
      language: '',
      overview: '',
      posterPath: '',
      voteAverage: 0,
      voteCount: 0,
      releaseDate: '',
      popularity: 0,
      status: '',
      episodeRunTime: [],
      genres: [],
      productionCountries: [],
      productionCompanies: [],
    );
  }

  const TVShowItem._();

  //метод для створення TVShowItem з використанням даних з віддаленого джерела.
  factory TVShowItem.fromRemoteModel(remote.TVShowModel model) {
    return TVShowItem(
      id: model.id,
      originalName: model.originalName,
      overview: model.overview,
      posterPath: model.posterPath ?? '',
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      releaseDate: model.releaseDate,
      popularity: model.popularity,
      language: model.language,
      status: model.status ?? '',
      episodeRunTime: model.episodeRunTime ?? [],
      genres: model.genres?.map((e) => e.name).toList() ?? [],
      productionCountries: model.productionCountries?.map((e) => e.name).toList() ?? [],
      productionCompanies: model.productionCompanies?.map((e) => e.name).toList() ?? [],
    );
  }

  // метод для створення TVShowItem з використанням даних з локального джерела.
  factory TVShowItem.fromLocalModel(local.TVShowModel model) {
    return TVShowItem(
      id: model.id,
      originalName: model.originalName,
      overview: model.overview,
      posterPath: model.posterPath,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      releaseDate: model.releaseDate,
      popularity: model.popularity,
      language: model.language,
      status: '',
      episodeRunTime: [],
      genres: [],
      productionCountries: [],
      productionCompanies: [],
    );
  }

  // Метод для отримання URL зображення TVShowItem.
  String get imageUrl => GlobalConstants.baseImageUrl + posterPath;
}
