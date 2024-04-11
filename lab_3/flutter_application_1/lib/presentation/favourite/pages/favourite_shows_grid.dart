import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';
import 'package:flutter_application_1/presentation/films/widgets/one_media_card.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Клас, який відображає сітку з улюбленими шоу (фільми та серіали)
class FavouriteShowGrid extends StatefulWidget {
  const FavouriteShowGrid(
      {super.key, required this.tvShows, required this.movies});
  final List<TVShowItem> tvShows; // Список улюблених серіалів
  final List<MovieItem> movies; // Список улюблених фільмів

  @override
  State<FavouriteShowGrid> createState() => _FavouriteShowGridState();
}

class _FavouriteShowGridState extends State<FavouriteShowGrid> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose(); // Звільнення ресурсів контролера при закритті віджета
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> items =
        [...widget.tvShows, ...widget.movies].reversed.toList();
    // Об'єднання списків серіалів і фільмів, та перевертання порядку для відображення від нових до старих

    return FadingEdgeScrollView.fromScrollView(
      gradientFractionOnStart: 0,
      gradientFractionOnEnd: 0.2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: LayoutHelper.getGridCount(
              context), // Кількість елементів у рядку віджету
          crossAxisSpacing: LayoutHelper.getGridCount(context)
              .toDouble(), // Відступи між елементами у рядку
          mainAxisSpacing: 8, // Основні відступи між рядами
          childAspectRatio: 2 /
              3, // Співвідношення ширини до висоти елемента сітки (налаштовується за власним смаком)
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingConstants.medium), // Відступи від країв сітки
        controller: controller, // Контролер прокрутки сітки
        shrinkWrap: true, // Зменшення розміру сітки до необхідного обсягу
        physics: const BouncingScrollPhysics(), // Фізика прокрутки сітки
        itemCount: items.length, // Кількість елементів у сітці
        itemBuilder: (context, index) {
          final item = items[index];
          // Отримання елемента сітки за індексом

          if (item is TVShowItem) {
            // Якщо елемент - серіал
            return Padding(
              padding: const EdgeInsets.all(2),
              child: OneMediaCard(
                onTap: () {
                  // Обробник події натискання на картку серіалу
                  BlocProvider.of<MediaDetailsCubit>(context)
                      .setTVShow(item.id);
                  // Встановлення ідентифікатора вибраного серіалу через блок MediaDetailsCubit
                },
                imageUrl: item.imageUrl, // URL зображення серіалу
                title: item.originalName, // Оригінальна назва серіалу
                releaseDate: item.releaseDate, // Дата виходу серіалу
                popularity: item.popularity, // Рейтинг популярності серіалу
                voteAverage: item.voteAverage, // Рейтинг серіалу
              ),
            );
          } else if (item is MovieItem) {
            // Якщо елемент - фільм
            return Padding(
              padding: const EdgeInsets.all(2),
              child: OneMediaCard(
                onTap: () {
                  // Обробник події натискання на картку фільму
                  BlocProvider.of<MediaDetailsCubit>(context).setMovie(item.id);
                  // Встановлення ідентифікатора вибраного фільму через блок MediaDetailsCubit
                },
                imageUrl: item.imageUrl, // URL зображення фільму
                title: item.title, // Назва фільму
                releaseDate: item.releaseDate, // Дата виходу фільму
                popularity: item.popularity, // Рейтинг популярності фільму
                voteAverage: item.voteAverage, // Рейтинг фільму
              ),
            );
          } else {
            return Container(); // Повернення порожнього контейнера у випадку невідомого типу елемента
          }
        },
      ),
    );
  }
}
