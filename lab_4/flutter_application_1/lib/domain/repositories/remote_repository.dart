import 'package:flutter_application_1/data/datasources/remote_datasource.dart';
import 'package:flutter_application_1/data/model/remote/movie_model.dart';
import 'package:flutter_application_1/data/model/remote/movie_response_model.dart';
import 'package:flutter_application_1/data/model/remote/search_response_model.dart';
import 'package:flutter_application_1/data/model/remote/tv_show_model.dart';
import 'package:flutter_application_1/data/model/remote/tv_show_response_model.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/movie_response_item.dart';
import 'package:flutter_application_1/domain/entity/search_response_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_response_item.dart';

// Клас, що представляє репозиторій для взаємодії з віддаленими даними
class RemoteRepository {
  RemoteRepository(this.datasource, this.apiKey);
  final RemoteDatasource datasource; // Джерело даних для віддалених даних
  final String apiKey; // API ключ

  // Отримання списку трендових фільмів
  Future<MovieResponseItem> getTrendingMovies() async {
    final MovieResponseModel result = await datasource.getTrendingMovies(apiKey);
    return MovieResponseItem.fromModel(result);
  }

  // Отримання списку фільмів з найвищим рейтингом
  Future<MovieResponseItem> getTopRatedMovies() async {
    final MovieResponseModel result = await datasource.getTopRatedMovies(apiKey);
    return MovieResponseItem.fromModel(result);
  }

// Отримання всіх фільмів
  Future<MovieResponseItem> getAllMovies({required int page}) async {
    final MovieResponseModel result = await datasource.getAllMovies(apiKey, page);
    return MovieResponseItem.fromModel(result);
  }

 // Отримання всіх телешоу
  Future<TVShowResponseItem> getAllTVShows({required int page}) async {
    final TVShowResponseModel result = await datasource.getAllTVShows(apiKey, page);
    return TVShowResponseItem.fromModel(result);
  }

  // Пошук за запитом
  Future<SearchResponseItem> search({required String query, required int page}) async {
    final SearchResponseModel result = await datasource.search(query, page);
    return SearchResponseItem.fromModel(result);
  }
  
  // Отримання деталей фільму за ID
  Future<MovieItem> getMovieDetail(int id) async {
    final MovieModel result = await datasource.getMovieDetail(id);
    return MovieItem.fromRemoteModel(result);
  }

  // Отримання деталей телешоу за ID
  Future<TVShowItem> getTVShowDetail(int id) async {
    final TVShowModel result = await datasource.getTVShowDetail(id);
    return TVShowItem.fromRemoteModel(result);
  }
}
