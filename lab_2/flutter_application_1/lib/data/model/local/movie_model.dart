import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:hive/hive.dart';

part '../../../generated/data/model/local/movie_model.g.dart';

@HiveType(typeId: 0)
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

  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String language;
  @HiveField(4)
  final String originalTitle;
  @HiveField(5)
  final String overview;
  @HiveField(6)
  final String posterPath;
  @HiveField(7)
  final double voteAverage;
  @HiveField(8)
  final double voteCount;
  @HiveField(9)
  final String releaseDate;
  @HiveField(10)
  final double popularity;
}
