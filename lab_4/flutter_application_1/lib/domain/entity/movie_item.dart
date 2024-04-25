// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/resourses/constants.dart';
import 'package:flutter_application_1/data/model/local/movie_model.dart' as local;
import 'package:flutter_application_1/data/model/remote/movie_model.dart' as remote;
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/domain/entity/movie_item.freezed.dart';
//Створення, ініціалізацію та перетворення об'єктів фільмів для подальшої обробки в Flutter додатку
@freezed
class MovieItem with _$MovieItem {
  factory MovieItem({
    required int id,
    required String title,
    required String language,
    required String originalTitle,
    required String overview,
    required String posterPath,
    required double voteAverage,
    required double voteCount,
    required String releaseDate,
    required double popularity,
    required String status,
    required String tagline,
    required List<String> productionCountries,
    required List<String> productionCompanies,
    required List<String> genres,
    required int budget,
    required double rating,
  }) = _MovieItem;

  factory MovieItem.empty() {
    return MovieItem(
      id: 0,
      title: '',
      language: '',
      originalTitle: '',
      overview: '',
      posterPath: '',
      voteAverage: 0,
      voteCount: 0,
      releaseDate: '',
      popularity: 0,
      status: '',
      tagline: '',
      productionCountries: [],
      productionCompanies: [],
      genres: [],
      budget: 0,
      rating: 0,
    );
  }

  const MovieItem._();

  factory MovieItem.fromRemoteModel(remote.MovieModel model) {
    return MovieItem(
      id: model.id,
      title: model.title,
      language: model.language,
      originalTitle: model.originalTitle,
      overview: model.overview,
      posterPath: model.posterPath ?? '',
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      releaseDate: model.releaseDate,
      popularity: model.popularity,
      status: model.status ?? '',
      tagline: model.tagline ?? '',
      productionCountries: model.productionCountries?.map((e) => e.name).toList() ?? [],
      productionCompanies: model.productionCompanies?.map((e) => e.name).toList() ?? [],
      genres: model.genres?.map((e) => e.name).toList() ?? [],
      budget: model.budget ?? 0,
      rating: 0,
    );
  }

  factory MovieItem.fromLocalModel(local.MovieModel model) {
    return MovieItem(
      id: model.id,
      title: model.title,
      language: model.language,
      originalTitle: model.originalTitle,
      overview: model.overview,
      posterPath: model.posterPath,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      releaseDate: model.releaseDate,
      popularity: model.popularity,
      status: '',
      tagline: '',
      productionCountries: [],
      productionCompanies: [],
      genres: [],
      budget: 0,
      rating: model.rating,
    );
  }

  String get imageUrl => GlobalConstants.baseImageUrl + posterPath;
}
