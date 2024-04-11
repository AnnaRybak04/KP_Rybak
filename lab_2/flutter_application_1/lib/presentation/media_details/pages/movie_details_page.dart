import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/content_type_enum.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_state.dart';
import 'package:flutter_application_1/presentation/media_details/pages/movie_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaDetailsCubit bloc = BlocProvider.of<MediaDetailsCubit>(context);
    return BlocBuilder<MediaDetailsCubit, MediaDetailsState>(
      builder: (context, state) {
        if (state.contentType == ContentTypeEnum.movies) {
          final movie = state.movie;
          return MovieDetailsWidget(
            isLoading: state.status == MainStatus.loading,
            imageUrl: movie.imageUrl,
            title: movie.title,
            releaseDate: movie.releaseDate,
            popularity: movie.popularity,
            voteAverage: movie.voteAverage,
            overview: movie.overview,
            onFavouriteTap: () {
              bloc.onFavouriteMovie(movie);
            },
            isFavourite: state.isFavourite,
            onRatingChanged: (double rating) {
              bloc.onRatingMovie(movie, rating);
            },
            rating: state.rating,
            companies: movie.productionCompanies,
            genres: movie.genres,
            countries: movie.productionCountries,
          );
        } else if (state.contentType == ContentTypeEnum.tvShows) {
          final tvShow = state.tvShow;
          return MovieDetailsWidget(
            isLoading: state.status == MainStatus.loading,
            imageUrl: tvShow.imageUrl,
            title: tvShow.originalName,
            releaseDate: tvShow.releaseDate,
            popularity: tvShow.popularity,
            voteAverage: tvShow.voteAverage,
            overview: tvShow.overview,
            onFavouriteTap: () {
              bloc.onFavouriteTVShow(tvShow);
            },
            isFavourite: state.isFavourite,
            onRatingChanged: (double rating) {
              bloc.onRatingTVShow(tvShow, rating);
            },
            rating: state.rating,
            companies: tvShow.productionCompanies,
            genres: tvShow.genres,
            countries: tvShow.productionCountries,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
