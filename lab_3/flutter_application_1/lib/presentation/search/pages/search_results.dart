import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/app_color.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/search_item.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_cubit.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_state.dart';
import 'package:flutter_application_1/presentation/search/pages/one_result_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final ScrollController controller =
      ScrollController(); // Контролер прокрутки для списку
  late final SearchCubit bloc =
      BlocProvider.of<SearchCubit>(context); // Кубит для пошуку

  @override
  void initState() {
    super.initState();
    // Додавання слухача подій для сторінок у кубіті
    bloc.state.pagingController.addPageRequestListener((pageKey) {
      bloc.search(widget.controller.text,
          page:
              pageKey); // Виклик функції пошуку з кубіту при запиті нової сторінки
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context)
          .copyWith(scrollbars: false), // Налаштування конфігурації прокрутки
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return FadingEdgeScrollView.fromScrollView(
            gradientFractionOnStart: 0,
            gradientFractionOnEnd: 0.2,
            child: PagedListView(
              shrinkWrap: true,
              scrollController: controller,
              padding: const EdgeInsets.all(PaddingConstants.medium),
              pagingController: state
                  .pagingController, // Використання контролера сторінок зі стану кубіту
              builderDelegate: PagedChildBuilderDelegate<SearchItem>(
                firstPageProgressIndicatorBuilder: (context) {
                  return const Center(
                      child:
                          CircularProgressIndicator()); // Відображення індикатора завантаження при першому завантаженні сторінки
                },
                newPageProgressIndicatorBuilder: (context) {
                  return const Center(
                      child:
                          CircularProgressIndicator()); // Відображення індикатора завантаження при завантаженні нової сторінки
                },
                itemBuilder: (context, item, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: OneResultCard(
                        search: item), // Побудова карточки з результатом пошуку
                  );
                },
                noMoreItemsIndicatorBuilder: (context) {
                  return const SizedBox(); // Порожній віджет, що вказує на відсутність додаткових елементів
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
                  ); // Відображення повідомлення про відсутність результатів пошуку
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
