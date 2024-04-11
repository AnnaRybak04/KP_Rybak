import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/common/list_extension.dart'; // Імпорт розширення списку
import 'package:flutter_application_1/domain/entity/movie_item.dart'; // Імпорт моделі елементу фільму
import 'package:flutter_application_1/presentation/main/pages/widgets/one_movie_card.dart'; // Імпорт віджету одного картки фільму

class MovieCards extends StatefulWidget {
  const MovieCards(
      {super.key, required this.movies, required this.favouriteMovies});
  final List<MovieItem> movies; // Список фільмів
  final List<MovieItem> favouriteMovies; // Список улюблених фільмів

  @override
  State<MovieCards> createState() => _MovieCardsState();
}

class _MovieCardsState extends State<MovieCards> {
  final ScrollController controller = ScrollController(); // Контролер прокрутки

  @override
  void dispose() {
    controller.dispose(); // Видалення контролера прокрутки
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Висота списку
      child: FadingEdgeScrollView.fromScrollView(
        gradientFractionOnEnd: 0.1, // Доля градієнту в кінці
        gradientFractionOnStart: 0.1, // Доля градієнту на початку
        child: ListView.builder(
          controller: controller, // Використання контролера прокрутки
          scrollDirection: Axis.horizontal, // Горизонтальна прокрутка
          physics:
              const BouncingScrollPhysics(), // Фізика прокрутки з відскоком
          itemCount:
              widget.movies.length, // Кількість елементів у списку фільмів
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final movie = widget.movies[index]; // Поточний фільм
            return Padding(
              padding: const EdgeInsets.all(10),
              child: OneMovieCard(
                movie: movie, // Передача поточного фільму в картку фільму
                isFavourite: widget.favouriteMovies.firstWhereOrNull(
                        (element) => element.id == movie.id) !=
                    null, // Перевірка, чи фільм у списку улюблених
              ),
            );
          },
        ),
      ),
    );
  }
}
