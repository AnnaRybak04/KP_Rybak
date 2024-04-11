import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';

// Клас, що визначає стан головного екрану
class MainState extends Equatable {
  const MainState({
    required this.status, // Статус загального стану екрану
    required this.errorMessage, // Повідомлення про помилку
    required this.trandingMovies, // Список трендових фільмів
    required this.popularMovies, // Список популярних фільмів
    required this.allMovies, // Список усіх фільмів
    required this.favouriteMovies, // Список улюблених фільмів
  });

  // Конструктор для створення стану зі статусом "завантаження"
  factory MainState.loading() {
    return const MainState(
      status: MainStatus.loading, // Встановлюємо статус "завантаження"
      errorMessage: '', // Помилка не визначена
      trandingMovies: [], // Початково список трендових фільмів порожній
      popularMovies: [], // Початково список популярних фільмів порожній
      allMovies: [], // Початково список усіх фільмів порожній
      favouriteMovies: [], // Початково список улюблених фільмів порожній
    );
  }

  final MainStatus status; // Статус стану
  final String errorMessage; // Повідомлення про помилку
  final List<MovieItem> trandingMovies; // Список трендових фільмів
  final List<MovieItem> popularMovies; // Список популярних фільмів
  final List<MovieItem> allMovies; // Список усіх фільмів
  final List<MovieItem> favouriteMovies; // Список улюблених фільмів

  @override
  List<Object> get props => [
        status,
        errorMessage,
        trandingMovies,
        popularMovies,
        allMovies,
        favouriteMovies
      ];

  // Метод для копіювання стану зі зміненими значеннями
  MainState copyWith({
    MainStatus? status, // Новий статус
    String? errorMessage, // Нове повідомлення про помилку
    List<MovieItem>? trandingMovies, // Новий список трендових фільмів
    List<MovieItem>? popularMovies, // Новий список популярних фільмів
    List<MovieItem>? allMovies, // Новий список усіх фільмів
    List<MovieItem>? favouriteMovies, // Новий список улюблених фільмів
  }) {
    return MainState(
      status: status ??
          this.status, // Якщо новий статус не передано, використовуємо поточний
      trandingMovies: trandingMovies ??
          this.trandingMovies, // Якщо новий список трендових фільмів не передано, використовуємо поточний
      popularMovies: popularMovies ??
          this.popularMovies, // Якщо новий список популярних фільмів не передано, використовуємо поточний
      allMovies: allMovies ??
          this.allMovies, // Якщо новий список усіх фільмів не передано, використовуємо поточний
      favouriteMovies: favouriteMovies ??
          this.favouriteMovies, // Якщо новий список улюблених фільмів не передано, використовуємо поточний
      errorMessage: errorMessage ??
          '', // Якщо нове повідомлення про помилку не передано, використовуємо порожнє значення
    );
  }
}
