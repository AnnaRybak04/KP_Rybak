import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/app_color.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/presentation/films/bloc/movies_cubit.dart';
import 'package:flutter_application_1/presentation/films/bloc/movies_state.dart';
import 'package:flutter_application_1/presentation/films/widgets/one_media_card.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';
import 'package:flutter_application_1/shared/widgets/one_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late final MoviesCubit bloc = BlocProvider.of<MoviesCubit>(context);
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.state.moviesPagingController.addPageRequestListener((page) {
      bloc.search(page: page);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OneScaffold(
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: PaddingConstants.extraLarge),
              const Padding(
                padding: EdgeInsets.only(left: PaddingConstants.large),
                child: Text(
                  'Фільми:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: PaddingConstants.extraLarge),
              Expanded(
                child: FadingEdgeScrollView.fromScrollView(
                  gradientFractionOnStart: 0,
                  gradientFractionOnEnd: 0.2,
                  child: PagedGridView(
                    scrollController: controller,
                    padding: const EdgeInsets.symmetric(horizontal: PaddingConstants.medium),
                    pagingController: state.moviesPagingController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: LayoutHelper.getGridCount(context),
                      crossAxisSpacing: LayoutHelper.getGridCount(context).toDouble(),
                      mainAxisSpacing: 8,
                      childAspectRatio: 2 / 3, // Adjust this ratio as per your preference
                    ),
                    builderDelegate: PagedChildBuilderDelegate<MovieItem>(
                      firstPageProgressIndicatorBuilder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      },
                      newPageProgressIndicatorBuilder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      },
                      itemBuilder: (context, item, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: OneMediaCard(
                            onTap: () {
                              BlocProvider.of<MediaDetailsCubit>(context).setMovie(item.id);
                            },
                            imageUrl: item.imageUrl,
                            title: item.title,
                            releaseDate: item.releaseDate,
                            popularity: item.popularity,
                            voteAverage: item.voteAverage,
                          ),
                        );
                      },
                      noMoreItemsIndicatorBuilder: (context) {
                        return const SizedBox();
                      },
                      noItemsFoundIndicatorBuilder: (context) {
                        return const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 100,
                              color: AppColor.iconsGrey,
                            ),
                            SizedBox(height: PaddingConstants.medium),
                            Text(
                              'Нічого не знайдено',
                              style: TextStyle(
                                color: AppColor.iconsGrey,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
