import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';

// Стан для управління вибраними елементами (фільми та телепередачі)
class FavoriteState extends Equatable {
  const FavoriteState({
     required this.status, // Статус стану (наприклад, загрузка, помилка, тощо)
    required this.errorMessage, // Повідомлення про помилку (якщо є)
    required this.movies, // Список улюблених фільмів
    required this.tvShows, // Список улюблених телепередач
  });

  // Фабричний метод для створення стану під час завантаження
  factory FavoriteState.loading() {
    return const FavoriteState(
      status: MainStatus.loading, // Встановлюємо статус "завантаження"
      errorMessage: '', // Повідомлення про помилку порожнє
      movies: [], // Порожній список фільмів
      tvShows: [], // Порожній список телепередач
    );
  }

  final MainStatus status; // Статус стану
  final String errorMessage; // Повідомлення про помилку
  final List<MovieItem> movies; // Список улюблених фільмів
  final List<TVShowItem> tvShows; // Список улюблених телепередач

  // Перевизначений метод, що повертає список властивостей об'єкта
  @override
  List<Object> get props => [status, errorMessage, movies, tvShows];

  // Метод для створення копії об'єкта з можливістю зміни окремих властивостей
  FavoriteState copyWith({
    MainStatus? status, // Новий статус (необов'язковий параметр)
    String? errorMessage, // Нове повідомлення про помилку (необов'язковий параметр)
    List<MovieItem>? movies, // Новий список фільмів (необов'язковий параметр)
    List<TVShowItem>? tvShows, // Новий список телепередач (необов'язковий параметр)
  }) {
    return FavoriteState(
     status: status ?? this.status, // Якщо новий статус не передано, беремо поточний
      errorMessage: errorMessage ?? this.errorMessage, // Якщо нове повідомлення про помилку не передано, беремо поточне
      movies: movies ?? this.movies, // Якщо новий список фільмів не передано, беремо поточний
      tvShows: tvShows ?? this.tvShows, // Якщо новий список телепередач не передано, беремо поточний
    );
  }
}
