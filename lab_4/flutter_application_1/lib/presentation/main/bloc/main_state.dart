import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';

// Клас, що визначає стан головного екрану
class MainState extends Equatable {
  const MainState({
    required this.status,
    required this.errorMessage,
    required this.trandingMovies,
    required this.popularMovies,
    required this.allMovies,
    required this.favouriteMovies,
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

  final MainStatus status;
  final String errorMessage;
  final List<MovieItem> trandingMovies;
  final List<MovieItem> popularMovies;
  final List<MovieItem> allMovies;
  final List<MovieItem> favouriteMovies;

  @override
  List<Object> get props => [status, errorMessage, trandingMovies, popularMovies, allMovies, favouriteMovies];

  // Метод для копіювання стану зі зміненими значеннями
  MainState copyWith({
    MainStatus? status,
    String? errorMessage,
    List<MovieItem>? trandingMovies,
    List<MovieItem>? popularMovies,
    List<MovieItem>? allMovies,
    List<MovieItem>? favouriteMovies,
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
