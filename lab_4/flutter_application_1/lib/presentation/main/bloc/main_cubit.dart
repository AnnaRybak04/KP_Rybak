import 'package:flutter_application_1/core/common/list_extension.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/movie_response_item.dart';
import 'package:flutter_application_1/domain/repositories/local_repository.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';
import 'package:flutter_application_1/presentation/main/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this.localRepository, this.remoteRepository) : super(MainState.loading());
  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;

  // Ініціалізує стан за замовчуванням і викликає функцію ініціалізації
  void init() async {
    emit(state.copyWith(status: MainStatus.loading));
    try {
      // Отримання даних про трендові, популярні та улюблені фільми
      final Future<MovieResponseItem> trendingResult = remoteRepository.getTrendingMovies();
      final Future<MovieResponseItem> popularResult = remoteRepository.getTopRatedMovies();
      final Future<List<MovieItem>> favouriteMoviesResult = localRepository.getFavouriteMovies();
      await Future.wait([trendingResult, popularResult, favouriteMoviesResult]).then((result) {
        // Емітує оновлений стан з отриманими даними
        emit(
          state.copyWith(
            status: MainStatus.initial,
            trandingMovies: (result[0] as MovieResponseItem).items,
            popularMovies: (result[1] as MovieResponseItem).items,
            favouriteMovies: result[2] as List<MovieItem>,
          ),
        );
      });
    } catch (e) {
      // У випадку помилки емітує стан з помилкою
      emit(state.copyWith(status: MainStatus.error, errorMessage: e.toString()));
    }
  }

  // Додає або видаляє фільм зі списку улюблених та оновлює стан
  void onFavouriteMovie(MovieItem movie) async {
    final List<MovieItem> favouriteMovies = await localRepository.getFavouriteMovies();
    final bool isFavourite = favouriteMovies.firstWhereOrNull((element) => element.id == movie.id) != null;
    if (isFavourite) {
      // Видаляє фільм з улюблених
      await localRepository.removeFromFavouriteMovie(movie);
    } else {
      // Додає фільм до улюблених
      await localRepository.saveAsFavouriteMovie(movie);
    }

    final List<MovieItem> newFavouriteMovies = await localRepository.getFavouriteMovies(); // Оновлює список улюблених фільмів
    emit(state.copyWith(favouriteMovies: newFavouriteMovies));
  }
}