import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';
import 'package:flutter_application_1/domain/repositories/local_repository.dart';
import 'package:flutter_application_1/presentation/rated/bloc/rated_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatedCubit extends Cubit<RatedState> {
  RatedCubit(this.repository) : super(RatedState.loading());
  final LocalRepository repository;

  void init() async {
    emit(state.copyWith(status: MainStatus.loading));
    try {
      final Future<List<MovieItem>> moviesResult = repository.getRatedMovies();
      final Future<List<TVShowItem>> tvShowsResult = repository.getRatedTVShows();
      await Future.wait([moviesResult, tvShowsResult]).then((value) {
        final List<MovieItem> movies = value[0] as List<MovieItem>;
        final List<TVShowItem> tvShows = value[1] as List<TVShowItem>;
        emit(
          state.copyWith(
            status: MainStatus.initial,
            movies: movies,
            tvShows: tvShows,
          ),
        );
      });
    } catch (e) {
      emit(state.copyWith(status: MainStatus.error, errorMessage: e.toString()));
    }
  }
}
