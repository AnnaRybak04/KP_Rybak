import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/app_color.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';
import 'package:flutter_application_1/presentation/films/widgets/one_media_card.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/presentation/tv/bloc/tv_cubit.dart';
import 'package:flutter_application_1/presentation/tv/bloc/tv_state.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';
import 'package:flutter_application_1/shared/widgets/one_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TVShowPage extends StatefulWidget {
  const TVShowPage({Key? key}) : super(key: key);

  @override
  State<TVShowPage> createState() => _TVShowPageState();
}

class _TVShowPageState extends State<TVShowPage> {
  late final TVCubit bloc = BlocProvider.of<TVCubit>(context);
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // Додаємо прослуховувач запитів на нові сторінки при пагінації
    bloc.state.tvShowsPagingController.addPageRequestListener((page) {
      bloc.search(page: page);
    });
  }

  @override
  void dispose() {
    // Звільняємо ресурси при завершенні віджету
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OneScaffold(
      child: BlocBuilder<TVCubit, TVState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: PaddingConstants.extraLarge),
              const Padding(
                padding: EdgeInsets.only(left: PaddingConstants.large),
                child: Text(
                  'ТВ Шоу:', // Назва сторінки
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: PaddingConstants.medium),
                    pagingController: state.tvShowsPagingController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: LayoutHelper.getGridCount(context),
                      crossAxisSpacing:
                          LayoutHelper.getGridCount(context).toDouble(),
                      mainAxisSpacing: 8,
                      childAspectRatio:
                          2 / 3, // Пропорція розміру елементів сітки
                    ),
                    builderDelegate: PagedChildBuilderDelegate<TVShowItem>(
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
                              // Переходимо до деталей вибраного ТВ Шоу
                              BlocProvider.of<MediaDetailsCubit>(context)
                                  .setTVShow(item.id);
                            },
                            imageUrl: item.imageUrl,
                            title: item.originalName,
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
                        // Відображення, коли не знайдено жодного елемента
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
                              'Нічого не знайдено', // Повідомлення про відсутність результатів пошуку
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
