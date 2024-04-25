import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/content_type_enum.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_state.dart';
import 'package:flutter_application_1/presentation/media_details/pages/movie_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key}); // Конструктор класу MovieDetailsPage

  @override
  Widget build(BuildContext context) {
    final MediaDetailsCubit bloc = BlocProvider.of<MediaDetailsCubit>(context);
    return BlocBuilder<MediaDetailsCubit, MediaDetailsState>(
      // Віджет для слухання стану блоу кубіту
      builder: (context, state) {
        if (state.contentType == ContentTypeEnum.movies) {
          // Перевірка типу контенту
          final movie = state.movie;
          return MovieDetailsWidget(
             // Повернення віджету MovieDetailsWidget з даними про фільм
            isLoading: state.status ==
                MainStatus.loading, // Перевірка на статус завантаження
            imageUrl: movie.imageUrl, // URL зображення фільму
            title: movie.title, // Назва фільму
            releaseDate: movie.releaseDate, // Дата виходу фільму
            popularity: movie.popularity, // Популярність фільму
            voteAverage: movie.voteAverage, // Рейтинг фільму
            overview: movie.overview, // Опис фільму
            onFavouriteTap: () {
              // Обробник події натискання на значок "В обране"
              bloc.onFavouriteMovie(
                  movie,); // Виклик методу для додавання фільму в обране
            },
            isFavourite: state.isFavourite,
            onRatingChanged: (double rating) {
              // Обробник події зміни рейтингу
              bloc.onRatingMovie(movie, rating);
            },
            rating: state.rating,
            companies: movie.productionCompanies,
            genres: movie.genres,
            countries: movie.productionCountries,
          );
        } else if (state.contentType == ContentTypeEnum.tvShows) {
          // Перевірка типу контенту
          final tvShow = state.tvShow;
          return MovieDetailsWidget(
            // Повернення віджету MovieDetailsWidget з даними про телешоу
            isLoading: state.status == MainStatus.loading,
            imageUrl: tvShow.imageUrl,
            title: tvShow.originalName,
            releaseDate: tvShow.releaseDate,
            popularity: tvShow.popularity,
            voteAverage: tvShow.voteAverage,
            overview: tvShow.overview,
            onFavouriteTap: () {
              // Обробник події натискання на значок "В обране"
              bloc.onFavouriteTVShow(tvShow);
            },
            isFavourite: state.isFavourite,
            onRatingChanged: (double rating) {
              // Обробник події зміни рейтингу
              bloc.onRatingTVShow(tvShow, rating);
            },
            rating: state.rating,
            companies: tvShow.productionCompanies,
            genres: tvShow.genres,
            countries: tvShow.productionCountries,
          );
        } else {
          // Якщо тип контенту не фільм і не телешоу
          return const SizedBox();
        }
      },
    );
  }
}
