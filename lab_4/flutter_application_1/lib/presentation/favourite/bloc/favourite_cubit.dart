import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';
import 'package:flutter_application_1/domain/repositories/local_repository.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.repository) : super(FavoriteState.loading());
  final LocalRepository repository;

  // Ініціалізує стан кубіту, завантажуючи улюблені фільми та телешоу з репозиторію
  void init() async {
    emit(state.copyWith(status: MainStatus.loading));
    try {
      final Future<List<MovieItem>> moviesResult = repository.getFavouriteMovies();
      final Future<List<TVShowItem>> tvShowsResult = repository.getFavouriteTVShows();
      await Future.wait([moviesResult, tvShowsResult]).then((value) {
        final List<MovieItem> movies = value[0] as List<MovieItem>; // Отримання списку улюблених фільмів
        final List<TVShowItem> tvShows = value[1] as List<TVShowItem>; // Отримання списку улюблених телешоу
        emit(
          state.copyWith(
        // Стан змінюється на "завантаження"
            status: MainStatus.initial,
            movies: movies, // Оновлення списку улюблених фільмів
            tvShows: tvShows, // Оновлення списку улюблених телешоу
          ),
        );
      });
    } catch (e) {
      emit(state.copyWith(status: MainStatus.error, errorMessage: e.toString())); // Стан змінюється на "помилка" з повідомленням про помилку
    }
  }
}
