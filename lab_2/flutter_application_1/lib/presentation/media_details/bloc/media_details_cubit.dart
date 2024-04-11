import 'package:flutter_application_1/core/common/list_extension.dart';
import 'package:flutter_application_1/core/enum/content_type_enum.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';
import 'package:flutter_application_1/domain/repositories/local_repository.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaDetailsCubit extends Cubit<MediaDetailsState> {
  MediaDetailsCubit(this.localRepository, this.remoteRepository) : super(MediaDetailsState.loading());
  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;

  void setMovie(int id) async {
    emit(state.copyWith(status: MainStatus.loading, movie: MovieItem.empty(), tvShow: TVShowItem.empty()));
    final List<MovieItem> favouriteMovies = await localRepository.getFavouriteMovies();
    final bool isFavourite = favouriteMovies.firstWhereOrNull((element) => element.id == id) != null;
    final double rating = await localRepository.getRatingMovie(id);
    final MovieItem movie = await remoteRepository.getMovieDetail(id);
    emit(
      state.copyWith(
        status: MainStatus.initial,
        movie: movie,
        contentType: ContentTypeEnum.movies,
        isFavourite: isFavourite,
        rating: rating,
      ),
    );
  }

  void setTVShow(int id) async {
    emit(state.copyWith(status: MainStatus.loading, movie: MovieItem.empty(), tvShow: TVShowItem.empty()));
    final List<TVShowItem> favouriteTVShows = await localRepository.getFavouriteTVShows();
    final bool isFavourite = favouriteTVShows.firstWhereOrNull((element) => element.id == id) != null;
    final double rating = await localRepository.getRatingTVShow(id);
    final TVShowItem tvShow = await remoteRepository.getTVShowDetail(id);
    emit(
      state.copyWith(
        status: MainStatus.initial,
        tvShow: tvShow,
        contentType: ContentTypeEnum.tvShows,
        isFavourite: isFavourite,
        rating: rating,
      ),
    );
  }

  void onFavouriteMovie(MovieItem movie) async {
    if (state.isFavourite) {
      await localRepository.removeFromFavouriteMovie(movie);
    } else {
      await localRepository.saveAsFavouriteMovie(movie);
    }
    emit(state.copyWith(isFavourite: !state.isFavourite));
  }

  void onFavouriteTVShow(TVShowItem tvShow) async {
    if (state.isFavourite) {
      await localRepository.removeFromFavouriteTVShow(tvShow);
    } else {
      await localRepository.saveAsFavouriteTVShow(tvShow);
    }
    emit(state.copyWith(isFavourite: !state.isFavourite));
  }

  void onRatingMovie(MovieItem movie, double rating) async {
    await localRepository.saveRatingMovie(movie, rating);
    emit(state.copyWith(rating: rating));
  }

  void onRatingTVShow(TVShowItem tvShow, double rating) async {
    await localRepository.saveRatingTVShow(tvShow, rating);
    emit(state.copyWith(rating: rating));
  }
}
