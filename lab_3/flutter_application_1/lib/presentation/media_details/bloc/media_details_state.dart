import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/content_type_enum.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';

class MediaDetailsState extends Equatable {
  const MediaDetailsState({
    required this.status, // Статус основного вмісту (наприклад, завантаження, успішно завантажено, помилка тощо)
    required this.movie, // Інформація про фільм
    required this.tvShow, // Інформація про телешоу
    required this.contentType, // Тип контенту (фільми або телешоу)
    required this.isFavourite, // Позначка, чи є цей елемент у списку обраного
    required this.rating, // Рейтинг елементу
  });

  factory MediaDetailsState.loading() {
    return MediaDetailsState(
      status: MainStatus.loading, // Завантаження основного вмісту
      movie: MovieItem.empty(), // Порожній об'єкт фільму
      tvShow: TVShowItem.empty(), // Порожній об'єкт телешоу
      contentType:
          ContentTypeEnum.movies, // Тип контенту за замовчуванням - фільми
      isFavourite: false, // За замовчуванням елемент не є обраним
      rating: 0, // Рейтинг за замовчуванням - 0
    );
  }

  final MainStatus status; // Статус основного вмісту
  final MovieItem movie; // Інформація про фільм
  final TVShowItem tvShow; // Інформація про телешоу
  final ContentTypeEnum contentType; // Тип контенту
  final bool isFavourite; // Позначка "обране"
  final double rating; // Рейтинг

  @override
  List<Object> get props =>
      [status, movie, tvShow, movie, contentType, isFavourite, rating];

  MediaDetailsState copyWith({
    MainStatus? status, // Новий статус
    MovieItem? movie, // Нова інформація про фільм
    TVShowItem? tvShow, // Нова інформація про телешоу
    ContentTypeEnum? contentType, // Новий тип контенту
    bool? isFavourite, // Нова позначка "обране"
    double? rating, // Новий рейтинг
  }) {
    return MediaDetailsState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      tvShow: tvShow ?? this.tvShow,
      contentType: contentType ?? this.contentType,
      isFavourite: isFavourite ?? this.isFavourite,
      rating: rating ?? this.rating,
    );
  }
}
