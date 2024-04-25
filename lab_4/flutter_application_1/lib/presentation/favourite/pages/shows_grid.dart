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
class ShowsGrid extends StatefulWidget {
  const ShowsGrid({super.key, required this.tvShows, required this.movies});
  final List<TVShowItem> tvShows; // Список улюблених серіалів
  final List<MovieItem> movies; // Список улюблених фільмів

  @override
  State<ShowsGrid> createState() => _ShowsGridState();
}

class _ShowsGridState extends State<ShowsGrid> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose(); // Звільнення ресурсів контролера при закритті віджета
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Об'єднання списків серіалів і фільмів, та перевертання порядку для відображення від нових до старих
    final List<dynamic> items = [...widget.tvShows, ...widget.movies].reversed.toList();
    return FadingEdgeScrollView.fromScrollView(
      gradientFractionOnStart: 0,
      gradientFractionOnEnd: 0.2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: LayoutHelper.getGridCount(context),
          crossAxisSpacing: LayoutHelper.getGridCount(context).toDouble(),
          mainAxisSpacing: 8,
          childAspectRatio: 2 / 3, // Adjust this ratio as per your preference
        ),
        padding: const EdgeInsets.symmetric(horizontal: PaddingConstants.medium),
        controller: controller,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          if (item is TVShowItem) {
            // Якщо елемент - серіал
            return Padding(
              padding: const EdgeInsets.all(2),
              child: OneMediaCard(
                onTap: () {
                  // Обробник події натискання на картку серіалу
                  BlocProvider.of<MediaDetailsCubit>(context).setTVShow(item.id);
                },
                imageUrl: item.imageUrl,
                title: item.originalName,
                popularity: item.popularity,
                voteAverage: item.voteAverage,
              ),
            );
          } else if (item is MovieItem) {
            // Якщо елемент - фільм
            return Padding(
              padding: const EdgeInsets.all(2),
              child: OneMediaCard(
                onTap: () {
                  // Обробник події натискання на картку 
                  BlocProvider.of<MediaDetailsCubit>(context).setMovie(item.id);
                },
                imageUrl: item.imageUrl,
                title: item.title,
                popularity: item.popularity,
                voteAverage: item.voteAverage,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
