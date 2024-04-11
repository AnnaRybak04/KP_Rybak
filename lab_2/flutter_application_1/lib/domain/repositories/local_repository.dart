import 'package:flutter_application_1/data/datasources/local_datasource.dart';
import 'package:flutter_application_1/data/model/local/movie_model.dart';
import 'package:flutter_application_1/data/model/local/tv_show_model.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';

class LocalRepository {
  LocalRepository(this._datasource);
  final LocalDatasource _datasource;

  Future<void> saveAsFavouriteMovie(MovieItem movie) async {
    final MovieModel model = MovieModel.fromEntity(movie);
    await _datasource.saveAsFavouriteMovie(movie.id.toString(), model);
  }

  Future<void> removeFromFavouriteMovie(MovieItem movie) async {
    await _datasource.removeFromFavouriteMovie(movie.id.toString());
  }

  Future<List<MovieItem>> getFavouriteMovies() async {
    final List<MovieModel> models = await _datasource.getFavouriteMovies();
    return models.map(MovieItem.fromLocalModel).toList();
  }

  Future<void> saveAsFavouriteTVShow(TVShowItem tvShow) async {
    final TVShowModel model = TVShowModel.fromEntity(tvShow);
    await _datasource.saveAsFavouriteTVShow(tvShow.id.toString(), model);
  }

  Future<void> removeFromFavouriteTVShow(TVShowItem tvShow) async {
    await _datasource.removeFromFavouriteTVShow(tvShow.id.toString());
  }

  Future<List<TVShowItem>> getFavouriteTVShows() async {
    final List<TVShowModel> models = await _datasource.getFavouriteTVShows();
    return models.map(TVShowItem.fromLocalModel).toList();
  }

  Future<void> saveRatingMovie(MovieItem movie, double rating) async {
    await _datasource.saveRatingMovie(movie.id.toString(), rating);
  }

  Future<void> saveRatingTVShow(TVShowItem tvShow, double rating) async {
    await _datasource.saveRatingTVShow(tvShow.id.toString(), rating);
  }

  Future<double> getRatingMovie(int id) async {
    final double rating = await _datasource.getRatingMovie(id.toString());
    return rating;
  }

  Future<double> getRatingTVShow(int id) async {
    final double rating = await _datasource.getRatingTVShow(id.toString());
    return rating;
  }
}
