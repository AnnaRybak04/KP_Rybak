import 'package:flutter_application_1/domain/entity/tv_show_item.dart';
import 'package:hive/hive.dart';

part '../../../generated/data/model/local/tv_show_model.g.dart';

@HiveType(typeId: 1)
class TVShowModel extends HiveObject {
  TVShowModel({
    required this.id,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.popularity,
    required this.language,
  });
  factory TVShowModel.fromEntity(TVShowItem entity) {
    return TVShowModel(
      id: entity.id,
      language: entity.language,
      overview: entity.overview,
      posterPath: entity.posterPath,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
      releaseDate: entity.releaseDate,
      popularity: entity.popularity,
      originalName: entity.originalName,
    );
  }

  @HiveField(1)
  final int id;
  @HiveField(2)
  final String originalName;
  @HiveField(3)
  final String overview;
  @HiveField(4)
  final String posterPath;
  @HiveField(5)
  final double voteAverage;
  @HiveField(6)
  final double voteCount;
  @HiveField(7)
  final String releaseDate;
  @HiveField(8)
  final double popularity;
  @HiveField(9)
  final String language;
}
