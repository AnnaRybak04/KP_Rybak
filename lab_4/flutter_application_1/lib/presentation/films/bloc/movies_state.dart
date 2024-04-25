import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MoviesState extends Equatable {
  const MoviesState({
   required this.status, // Статус стану фільмів
    required this.errorMessage, // Повідомлення про помилку
    required this.moviesPagingController, // Контролер для сторінкованого завантаження фільмів
  });

  factory MoviesState.loading() {
    return MoviesState(
      status: MainStatus.loading, // Встановлення статусу "Завантаження"
      errorMessage: '', // Порожнє повідомлення про помилку
      moviesPagingController: PagingController(
          firstPageKey: 1,), // Створення контролера з першим ключем сторінки 1
    );
  }

  final MainStatus status; // Статус стану фільмів
  final String errorMessage; // Повідомлення про помилку
  final PagingController<int, MovieItem> moviesPagingController; // Контролер для сторінкованого завантаження фільмів

  @override
  List<Object> get props => [
        status,
        errorMessage,
        moviesPagingController,
      ];

  MoviesState copyWith({
    MainStatus? status, // Новий статус
    String? errorMessage, // Нове повідомлення про помилку
    PagingController<int, MovieItem>? moviesPagingController, // Новий контролер для сторінкованого завантаження фільмів
  }) {
    return MoviesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      moviesPagingController: moviesPagingController ?? this.moviesPagingController,
    );
  }
}
