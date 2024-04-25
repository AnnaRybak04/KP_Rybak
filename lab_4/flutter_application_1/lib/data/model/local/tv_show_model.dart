import 'package:flutter_application_1/domain/entity/tv_show_item.dart';
import 'package:hive/hive.dart';

part '../../../generated/data/model/local/tv_show_model.g.dart';
// Клас моделі для телесеріалу, який зберігає дані в Hive

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
    required this.rating,
  });
  //  метод для створення моделі з об'єкту сутності
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
      rating: entity.rating,
    );
  }

  factory TVShowModel.empty() {
    return TVShowModel(
      id: 0,
      language: '',
      overview: '',
      posterPath: '',
      voteAverage: 0,
      voteCount: 0,
      releaseDate: '',
      popularity: 0,
      originalName: '',
      rating: 0,
    );
  }

  @HiveField(1)
  final int id; // Ідентифікатор телесеріалу
  @HiveField(2)
  final String originalName; // Оригінальна назва телесеріалу
  @HiveField(3)
  final String overview; // Опис телесеріалу
  @HiveField(4)
  final String posterPath; // Шлях до постера телесеріалу
  @HiveField(5)
  final double voteAverage; // Рейтинг телесеріалу
  @HiveField(6)
  final double voteCount; // Кількість голосів за телесеріал
  @HiveField(7)
  final String releaseDate; // Дата виходу телесеріалу
  @HiveField(8)
  final double popularity; // Популярність телесеріалу
  @HiveField(9)
  final String language; // Мова телесеріалу
  @HiveField(10)
  final double rating;
}
