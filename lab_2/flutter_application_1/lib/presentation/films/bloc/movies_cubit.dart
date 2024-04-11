import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_response_item.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';
import 'package:flutter_application_1/presentation/films/bloc/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.repository) : super(MoviesState.loading());
  final RemoteRepository repository;

  void search({required int page}) async {
    emit(state.copyWith(status: MainStatus.loading));
    try {
      final MovieResponseItem result = await repository.getAllMovies(page: page);
      state.moviesPagingController.appendPage(
        result.items,
        result.nextPage,
      );
      emit(state.copyWith(status: MainStatus.initial));
    } catch (e) {
      emit(state.copyWith(status: MainStatus.error, errorMessage: e.toString()));
    }
  }
}
