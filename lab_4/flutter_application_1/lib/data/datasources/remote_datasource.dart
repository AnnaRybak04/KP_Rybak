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
@RestApi(baseUrl: GlobalConstants.baseUrl)
abstract class RemoteDatasource {
  factory RemoteDatasource(Dio dio, {String baseUrl}) = _RemoteDatasource;
  // HTTP GET запити для отримання популярних фільмів, телесеріалів 
  // та детальної інформації про них
  @GET('/trending/movie/week?api_key={apiKey}&language=uk-UA&page=1')
  Future<MovieResponseModel> getTrendingMovies(@Path() String apiKey);

  @GET('/movie/top_rated?api_key={apiKey}&language=uk-UA')
  Future<MovieResponseModel> getTopRatedMovies(@Path() String apiKey);

  @GET('/movie/popular?api_key={apiKey}&language=uk-UA&page={page}')
  Future<MovieResponseModel> getAllMovies(@Path() String apiKey, @Path() int page);

  @GET('/tv/popular?api_key={apiKey}&language=uk-UA&page={page}')
  Future<TVShowResponseModel> getAllTVShows(@Path() String apiKey, @Path() int page);

  @GET('/search/multi?query={query}&include_adult=false&language=uk-UA&page={page}')
  Future<SearchResponseModel> search(@Path() String query, @Path() int page);

  @GET('/movie/{id}?language=uk-UA')
  Future<MovieModel> getMovieDetail(@Path() int id);

  @GET('/tv/{id}?language=uk-UA')
  Future<TVShowModel> getTVShowDetail(@Path() int id);
}
