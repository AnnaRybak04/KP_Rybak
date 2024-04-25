// ignore_for_file: parameter_assignments, avoid_positional_boolean_parameters

import 'package:flutter_application_1/data/model/local/movie_model.dart';
import 'package:flutter_application_1/data/model/local/tv_show_model.dart';
import 'package:hive/hive.dart';

//Клаc для зберігання та отримання інформації про фільми та телесеріали
class LocalDatasource {
  LocalDatasource(this.favouriteMoviesBox, this.favouriteTvShowsBox, this.ratedMoviesBox, this.ratedTvShowsBox);
  final Box<dynamic> favouriteMoviesBox;
  final Box<dynamic> favouriteTvShowsBox;
  final Box<dynamic> ratedMoviesBox;
  final Box<dynamic> ratedTvShowsBox;

  // Збереження фільму у вибрані
  Future<void> saveAsFavouriteMovie(String key, MovieModel movie) async {
    await favouriteMoviesBox.put(key, movie);
  }

  // Видалення фільму з вибраних
  Future<void> removeFromFavouriteMovie(String key) async {
    await favouriteMoviesBox.delete(key);
  }

  // Отримання списоку вибраних фільмів
  Future<List<MovieModel>> getFavouriteMovies() async {
    final List<MovieModel> movies = favouriteMoviesBox.values.toList().cast<MovieModel>();
    return movies;
  }

// Збереження телесеріал у вибрані
  Future<void> saveAsFavouriteTVShow(String key, TVShowModel tvShow) async {
    await favouriteTvShowsBox.put(key, tvShow);
  }


  Future<void> removeFromFavouriteTVShow(String key) async {
    await favouriteTvShowsBox.delete(key);
  }
// Отримання списоку вибраних телесеріалів
  Future<List<TVShowModel>> getFavouriteTVShows() async {
    final List<TVShowModel> tvShows = favouriteTvShowsBox.values.toList().cast<TVShowModel>();
    return tvShows;
  }

// Збереження рейтингу для фільму
  Future<void> saveRatingMovie(String key, MovieModel movie) async {
    await ratedMoviesBox.put(key, movie);
  }

  // Збереження рейтингу для телесеріалу
  Future<void> saveRatingTVShow(String key, TVShowModel tvShow) async {
    await ratedTvShowsBox.put(key, tvShow);
  }
// Отримання рейтингу для фільму
  Future<MovieModel> getRatingMovie(String key) async {
    final MovieModel rating = ratedMoviesBox.get(key, defaultValue: MovieModel.empty()) as MovieModel;
    return rating;
  }

// Отримання рейтингу для  телесеріалу
  Future<TVShowModel> getRatingTVShow(String key) async {
    final TVShowModel rating = ratedTvShowsBox.get(key, defaultValue: TVShowModel.empty()) as TVShowModel;
    return rating;
  }


  Future<List<MovieModel>> getRatedMovies() async {
    final List<MovieModel> movies = ratedMoviesBox.values.toList().cast<MovieModel>();
    return movies;
  }

  Future<List<TVShowModel>> getRatedTVShows() async {
    final List<TVShowModel> tvShows = ratedTvShowsBox.values.toList().cast<TVShowModel>();
    return tvShows;
  }
}
