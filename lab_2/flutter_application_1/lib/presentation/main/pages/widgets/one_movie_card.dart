import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/app_color.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/presentation/main/bloc/main_cubit.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/widgets/one_card.dart';
import 'package:flutter_application_1/shared/widgets/one_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OneMovieCard extends StatelessWidget {
  const OneMovieCard({super.key, required this.movie, required this.isFavourite});
  final MovieItem movie;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return OneCard(
      onTap: () {
        BlocProvider.of<MediaDetailsCubit>(context).setMovie(movie.id);
        context.pushNamed(MainRouteName.movieDetails);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BorderRadiusConstants.normal)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(BorderRadiusConstants.normal),
        ),
        width: 200,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                child: OneImage(
                  imageLink: movie.imageUrl,
                  radius: BorderRadius.circular(BorderRadiusConstants.normal),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      maxLines: 1,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${movie.title} (${movie.releaseDate})',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.visibility_outlined,
                                  color: AppColor.iconsGrey,
                                ),
                                const SizedBox(width: PaddingConstants.small),
                                Expanded(
                                  child: Text(
                                    movie.popularity.toString(),
                                    style: const TextStyle(fontSize: 12, color: AppColor.iconsGrey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star_half_outlined,
                                  color: Color.fromARGB(255, 255, 199, 0),
                                ),
                                Expanded(
                                  child: Text(
                                    movie.voteAverage.toStringAsFixed(1),
                                    style: const TextStyle(fontSize: 12, color: AppColor.iconsGrey),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(
                                      isFavourite ? Icons.favorite : Icons.favorite_border,
                                      color: AppColor.mainPurple,
                                    ),
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
