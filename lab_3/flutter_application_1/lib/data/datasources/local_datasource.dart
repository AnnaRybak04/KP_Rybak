// ignore_for_file: parameter_assignments, avoid_positional_boolean_parameters
import 'package:flutter_application_1/data/model/local/movie_model.dart';
import 'package:flutter_application_1/data/model/local/tv_show_model.dart';
import 'package:hive/hive.dart';

//Клаc для зберігання та отримання інформації про фільми та телесеріали
class LocalDatasource {
  LocalDatasource(this.moviesBox, this.tvShowsBox, this.ratingBox);
  final Box<dynamic> moviesBox; 
  final Box<dynamic> tvShowsBox; 
  final Box<dynamic> ratingBox;

  // Збереження фільму у вибрані
  Future<void> saveAsFavouriteMovie(String key, MovieModel movie) async {
    await moviesBox.put(key, movie); 
  }

  // Видалення фільму з вибраних
  Future<void> removeFromFavouriteMovie(String key) async {
    await moviesBox.delete(key); 
  }

  // Отримання списоку вибраних фільмів
  Future<List<MovieModel>> getFavouriteMovies() async {
    final List<MovieModel> movies = moviesBox.values
        .toList()
        .cast<MovieModel>(); 
    return movies;
  }

// Збереження телесеріал у вибрані
  Future<void> saveAsFavouriteTVShow(String key, TVShowModel tvShow) async {
    await tvShowsBox.put(key, tvShow); 
  }

// Видалення телесеріалу з вибраних
  Future<void> removeFromFavouriteTVShow(String key) async {
    await tvShowsBox.delete(key); 
  }

// Отримання списоку вибраних телесеріалів
  Future<List<TVShowModel>> getFavouriteTVShows() async {
    final List<TVShowModel> tvShows = tvShowsBox.values
        .toList()
        .cast<TVShowModel>(); 
    return tvShows;
  }

// Збереження рейтингу для фільму
  Future<void> saveRatingMovie(String key, double rating) async {
    await ratingBox.put(key, rating); 
  }

// Збереження рейтингу для телесеріалу
  Future<void> saveRatingTVShow(String key, double rating) async {
    await ratingBox.put(key, rating); 
  }
// Отримання рейтингу для фільму
  Future<double> getRatingMovie(String key) async {
    final double rating = ratingBox.get(key, defaultValue: 0.0)
        as double; 
    return rating;
  }
// Отримання рейтингу для телесеріалу
  Future<double> getRatingTVShow(String key) async {
    final double rating = ratingBox.get(key, defaultValue: 0.0)
        as double; 
    return rating;
  }
}
