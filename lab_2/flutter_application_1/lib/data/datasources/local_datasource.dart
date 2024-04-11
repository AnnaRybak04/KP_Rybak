// ignore_for_file: parameter_assignments, avoid_positional_boolean_parameters

import 'package:flutter_application_1/data/model/local/movie_model.dart';
import 'package:flutter_application_1/data/model/local/tv_show_model.dart';
import 'package:hive/hive.dart';

class LocalDatasource {
  LocalDatasource(this.moviesBox, this.tvShowsBox, this.ratingBox);
  final Box<dynamic> moviesBox;
  final Box<dynamic> tvShowsBox;
  final Box<dynamic> ratingBox;

  Future<void> saveAsFavouriteMovie(String key, MovieModel movie) async {
    await moviesBox.put(key, movie);
  }

  Future<void> removeFromFavouriteMovie(String key) async {
    await moviesBox.delete(key);
  }

  Future<List<MovieModel>> getFavouriteMovies() async {
    final List<MovieModel> movies = moviesBox.values.toList().cast<MovieModel>();
    return movies;
  }

  Future<void> saveAsFavouriteTVShow(String key, TVShowModel tvShow) async {
    await tvShowsBox.put(key, tvShow);
  }

  Future<void> removeFromFavouriteTVShow(String key) async {
    await tvShowsBox.delete(key);
  }

  Future<List<TVShowModel>> getFavouriteTVShows() async {
    final List<TVShowModel> tvShows = tvShowsBox.values.toList().cast<TVShowModel>();
    return tvShows;
  }

  Future<void> saveRatingMovie(String key, double rating) async {
    await ratingBox.put(key, rating);
  }

  Future<void> saveRatingTVShow(String key, double rating) async {
    await ratingBox.put(key, rating);
  }

  Future<double> getRatingMovie(String key) async {
    final double rating = ratingBox.get(key, defaultValue: 0) as double;
    return rating;
  }

  Future<double> getRatingTVShow(String key) async {
    final double rating = ratingBox.get(key, defaultValue: 0) as double;
    return rating;
  }
}
