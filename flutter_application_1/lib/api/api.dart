import 'dart:convert';

import 'package:flutter_application_1/models/movie_model.dart';
import 'package:flutter_application_1/models/tv_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const apiKey = '3e51c79fbec0ce08c3809b4bfb0ee2fb';

  static const _trendingURL =
      'https://api.themoviedb.org/3/trending/movie/week?api_key=${apiKey}&language=uk-UA&page=1';
  static const _topRatedMovies =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${apiKey}&language=uk-UA';
  static const _allMovies =
      'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&language=uk-UA';
  static const _allTVShows =
      'https://api.themoviedb.org/3/tv/popular?api_key=${apiKey}&language=uk-UA';
      

  static const imagePath = 'https://image.tmdb.org/t/p/w500';

  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingURL));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Something went wrong");
    }
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedMovies));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Something went wrong");
    }
  }

  // Future<List<MovieModel>> getAllMovies() async {
  //   final response = await http.get(Uri.parse(_allMovies));
  //   if (response.statusCode == 200) {
  //     final decodeData = json.decode(response.body)['results'] as List;
  //     return decodeData.map((movie) => MovieModel.fromJson(movie)).toList();
  //   } else {
  //     throw Exception("Something went wrong");
  //   }
  // }
  Future<List<MovieModel>> getAllMovies() async {
    List<MovieModel> allMovies = [];

    // Починаємо з першої сторінки
    for (int page = 1; page < 5; page++) {
      final response = await http.get(Uri.parse('$_allMovies&page=$page'));
      if (response.statusCode == 200) {
        final decodeData = json.decode(response.body)['results'] as List;
        allMovies.addAll(decodeData.map((movie) => MovieModel.fromJson(movie)));
        // Переходимо на наступну сторінку
      } else {
        throw Exception("Something went wrong");
      }
    }

    return allMovies;
  }

  Future<List<TVModel>> getAllTVShows() async {
    final response = await http.get(Uri.parse(_allTVShows));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;

      final r = decodeData.map((tv) => TVModel.fromJson(tv)).toList();
      print("====");
      print(r);
      return r;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
