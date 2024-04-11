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
    final MediaDetailsCubit bloc = BlocProvider.of<MediaDetailsCubit>(
        context); // Отримання доступу до блоу кубіту через BlocProvider
    return BlocBuilder<MediaDetailsCubit, MediaDetailsState>(
      // Віджет для слухання стану блоу кубіту
      builder: (context, state) {
        // Функція-білдер, що повертає віджети залежно від стану
        if (state.contentType == ContentTypeEnum.movies) {
          // Перевірка типу контенту
          final movie = state.movie; // Отримання даних про фільм зі стану
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
                  movie); // Виклик методу для додавання фільму в обране
            },
            isFavourite: state.isFavourite, // Чи є фільм в обраному
            onRatingChanged: (double rating) {
              // Обробник події зміни рейтингу
              bloc.onRatingMovie(
                  movie, rating); // Виклик методу для зміни рейтингу фільму
            },
            rating: state.rating, // Поточний рейтинг фільму
            companies:
                movie.productionCompanies, // Компанії, що виробляли фільм
            genres: movie.genres, // Жанри фільму
            countries: movie.productionCountries, // Країни виробники фільму
          );
        } else if (state.contentType == ContentTypeEnum.tvShows) {
          // Перевірка типу контенту
          final tvShow = state.tvShow; // Отримання даних про телешоу зі стану
          return MovieDetailsWidget(
            // Повернення віджету MovieDetailsWidget з даними про телешоу
            isLoading: state.status ==
                MainStatus.loading, // Перевірка на статус завантаження
            imageUrl: tvShow.imageUrl, // URL зображення телешоу
            title: tvShow.originalName, // Оригінальна назва телешоу
            releaseDate: tvShow.releaseDate, // Дата виходу телешоу
            popularity: tvShow.popularity, // Популярність телешоу
            voteAverage: tvShow.voteAverage, // Рейтинг телешоу
            overview: tvShow.overview, // Опис телешоу
            onFavouriteTap: () {
              // Обробник події натискання на значок "В обране"
              bloc.onFavouriteTVShow(
                  tvShow); // Виклик методу для додавання телешоу в обране
            },
            isFavourite: state.isFavourite, // Чи є телешоу в обраному
            onRatingChanged: (double rating) {
              // Обробник події зміни рейтингу
              bloc.onRatingTVShow(
                  tvShow, rating); // Виклик методу для зміни рейтингу телешоу
            },
            rating: state.rating, // Поточний рейтинг телешоу
            companies:
                tvShow.productionCompanies, // Компанії, що виробляли телешоу
            genres: tvShow.genres, // Жанри телешоу
            countries: tvShow.productionCountries, // Країни виробники телешоу
          );
        } else {
          // Якщо тип контенту не фільм і не телешоу
          return const SizedBox(); // Повернення порожнього віджету
        }
      },
    );
  }
}
