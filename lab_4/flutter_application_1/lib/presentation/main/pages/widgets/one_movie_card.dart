import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/presentation/main/bloc/main_cubit.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/widgets/one_card.dart';
import 'package:flutter_application_1/shared/widgets/one_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Клас, що представляє карточку одного фільму
class OneMovieCard extends StatelessWidget {
  const OneMovieCard({super.key, required this.movie, required this.isFavourite});
  final MovieItem movie; // Представлення фільму
  final bool isFavourite; // Чи є фільм у списку обраних

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OneCard(
      // Віджет карточки
      onTap: () {
        BlocProvider.of<MediaDetailsCubit>(context).setMovie(movie.id);
        context.pushNamed(MainRouteName.movieDetails);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BorderRadiusConstants.normal)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusConstants.normal),
        ),
        width: SizeConstants.homeCardWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                child: OneImage(
                  imageLink: movie.imageUrl,
                  radius: const BorderRadius.only(
                    topLeft: Radius.circular(BorderRadiusConstants.normal),
                    topRight: Radius.circular(BorderRadiusConstants.normal),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(PaddingConstants.normal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(movie.title, maxLines: 2),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.visibility_outlined,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: PaddingConstants.extraSmall),
                              Expanded(
                                child: Text(
                                  movie.popularity.toString(),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: PaddingConstants.extraSmall),
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              Expanded(
                                child: Text(
                                  movie.voteAverage.toStringAsFixed(1),
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(width: PaddingConstants.extraSmall),
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: Icon(
                                    isFavourite ? Icons.favorite : Icons.favorite_border,
                                  ),
                                  color: theme.colorScheme.primary,
                                  onPressed: () {
                                    BlocProvider.of<MainCubit>(context).onFavouriteMovie(movie);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
