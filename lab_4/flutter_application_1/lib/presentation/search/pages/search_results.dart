import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/search_item.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_cubit.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_state.dart';
import 'package:flutter_application_1/presentation/search/pages/one_result_card.dart';
import 'package:flutter_application_1/shared/widgets/one_not_found.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final ScrollController controller = ScrollController();
  late final SearchCubit bloc = BlocProvider.of<SearchCubit>(context);

  @override
  void initState() {
    super.initState();
    // Додавання слухача подій для сторінок у кубіті
    bloc.state.pagingController.addPageRequestListener((pageKey) {
      bloc.search(widget.controller.text, page: pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return FadingEdgeScrollView.fromScrollView(
            gradientFractionOnStart: 0,
            gradientFractionOnEnd: 0.2,
            child: PagedListView(
              shrinkWrap: true,
              scrollController: controller,
              padding: const EdgeInsets.all(PaddingConstants.medium),
              pagingController: state.pagingController,
              builderDelegate: PagedChildBuilderDelegate<SearchItem>(
                firstPageProgressIndicatorBuilder: (context) {
                  return const Center(child: CircularProgressIndicator());
                },
                newPageProgressIndicatorBuilder: (context) {
                  return const Center(child: CircularProgressIndicator());
                },
                itemBuilder: (context, item, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: OneResultCard(search: item),
                  );
                },
                noMoreItemsIndicatorBuilder: (context) {
                  return const SizedBox();
                },
                noItemsFoundIndicatorBuilder: (context) {
                  return const OneNotFound();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
