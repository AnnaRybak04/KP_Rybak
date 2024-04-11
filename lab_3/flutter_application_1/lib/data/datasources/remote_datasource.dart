import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/resourses/constants.dart';
import 'package:flutter_application_1/data/model/remote/movie_model.dart';
import 'package:flutter_application_1/data/model/remote/movie_response_model.dart';
import 'package:flutter_application_1/data/model/remote/search_response_model.dart';
import 'package:flutter_application_1/data/model/remote/tv_show_model.dart';
import 'package:flutter_application_1/data/model/remote/tv_show_response_model.dart';
import 'package:retrofit/retrofit.dart';

part '../../generated/data/datasources/remote_datasource.g.dart';

// Цей абстрактний клас визначає контракт для взаємодії з віддаленими даними
// через HTTP запити до API. Використовується Retrofit для простого визначення
// екземплярів цього класу на основі інтерфейсу та автоматичної генерації коду.


// Анотація @RestApi вказує, що цей клас є частиною Retrofit API і базовий URL
// для всіх HTTP запитів буде встановлено як GlobalConstants.baseUrl.

@RestApi(baseUrl: GlobalConstants.baseUrl)
abstract class RemoteDatasource {
  // Фабричний метод для створення екземплярів цього класу.
  factory RemoteDatasource(Dio dio, {String baseUrl}) = _RemoteDatasource;

  // HTTP GET запит для отримання списку популярних фільмів за останній тиждень.
  @GET('/trending/movie/week?api_key={apiKey}&language=uk-UA&page=1')
  Future<MovieResponseModel> getTrendingMovies(@Path() String apiKey);

  // HTTP GET запит для отримання списку найвище оцінених фільмів.
  @GET('/movie/top_rated?api_key={apiKey}&language=uk-UA')
  Future<MovieResponseModel> getTopRatedMovies(@Path() String apiKey);

  // HTTP GET запит для отримання всіх фільмів з можливістю пагінації.
  @GET('/movie/popular?api_key={apiKey}&language=uk-UA&page={page}')
  Future<MovieResponseModel> getAllMovies(
      @Path() String apiKey, @Path() int page);

  // HTTP GET запит для отримання всіх популярних телешоу з можливістю пагінації.
  @GET('/tv/popular?api_key={apiKey}&language=uk-UA&page={page}')
  Future<TVShowResponseModel> getAllTVShows(
      @Path() String apiKey, @Path() int page);

  // HTTP GET запит для пошуку фільмів або телешоу за запитом користувача.
  @GET(
      '/search/multi?query={query}&include_adult=false&language=uk-UA&page={page}')
  Future<SearchResponseModel> search(@Path() String query, @Path() int page);

  // HTTP GET запит для отримання детальної інформації про конкретний фільм за його id.
  @GET('/movie/{id}?language=uk-UA')
  Future<MovieModel> getMovieDetail(@Path() int id);

  // HTTP GET запит для отримання детальної інформації про конкретне телешоу за його id.
  @GET('/tv/{id}?language=uk-UA')
  Future<TVShowModel> getTVShowDetail(@Path() int id);
}
