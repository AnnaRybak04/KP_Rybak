import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:hive/hive.dart';

part '../../../generated/data/model/local/movie_model.g.dart'; 

@HiveType(typeId: 0) // Позначає клас як Hive-тип з ідентифікатором 0
class MovieModel extends HiveObject {
  MovieModel({
    required this.id,
    required this.title,
    required this.language,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.popularity,
  });

  //  конструктор для створення екземпляра класу MovieModel з об'єкту MovieItem
  factory MovieModel.fromEntity(MovieItem entity) {
    return MovieModel(
      id: entity.id,
      title: entity.title,
      language: entity.language,
      originalTitle: entity.originalTitle,
      overview: entity.overview,
      posterPath: entity.posterPath,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
      releaseDate: entity.releaseDate,
      popularity: entity.popularity,
    );
  }

  @HiveField(1) // Вказує ідентифікатор поля id в Hive
  final int id;
  @HiveField(2) // Вказує ідентифікатор поля title в Hive
  final String title;
  @HiveField(3) // Вказує ідентифікатор поля language в Hive
  final String language;
  @HiveField(4) // Вказує ідентифікатор поля originalTitle в Hive
  final String originalTitle;
  @HiveField(5) // Вказує ідентифікатор поля overview в Hive
  final String overview;
  @HiveField(6) // Вказує ідентифікатор поля posterPath в Hive
  final String posterPath;
  @HiveField(7) // Вказує ідентифікатор поля voteAverage в Hive
  final double voteAverage;
  @HiveField(8) // Вказує ідентифікатор поля voteCount в Hive
  final double voteCount;
  @HiveField(9) // Вказує ідентифікатор поля releaseDate в Hive
  final String releaseDate;
  @HiveField(10) // Вказує ідентифікатор поля popularity в Hive
  final double popularity;
}
