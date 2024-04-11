import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/common/list_extension.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/presentation/main/pages/widgets/one_movie_card.dart';

class MovieCards extends StatefulWidget {
  const MovieCards({super.key, required this.movies, required this.favouriteMovies});
  final List<MovieItem> movies;
  final List<MovieItem> favouriteMovies;

  @override
  State<MovieCards> createState() => _MovieCardsState();
}

class _MovieCardsState extends State<MovieCards> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: FadingEdgeScrollView.fromScrollView(
        gradientFractionOnEnd: 0.1,
        gradientFractionOnStart: 0.1,
        child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.movies.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final movie = widget.movies[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: OneMovieCard(
                movie: movie,
                isFavourite: widget.favouriteMovies.firstWhereOrNull((element) => element.id == movie.id) != null,
              ),
            );
          },
        ),
      ),
    );
  }
}
