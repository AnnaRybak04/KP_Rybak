import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_cubit.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_state.dart';
import 'package:flutter_application_1/presentation/search/pages/search_page.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';
import 'package:flutter_application_1/shared/widgets/one_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWrapper extends StatefulWidget {
  const SearchWrapper({super.key, required this.child});
  final Widget child;

  @override
  State<SearchWrapper> createState() => _SearchWrapperState();
}

class _SearchWrapperState extends State<SearchWrapper> {
  // Контролер для текстового поля пошуку
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            if (LayoutHelper.isDesktopScreen(context))
              const SizedBox(
                height: DimensionConstants.appBarHeight,
                child: OneAppBar(),
              )
            else
              const SizedBox(),
            Expanded(child: widget.child),
          ],
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state.isSearchVisible) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<SearchCubit>(context).setSearchVisibility(false);
                  controller.clear();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        if (LayoutHelper.isDesktopScreen(context))
          SizedBox(
            width: SizeConstants.largeScreenWidh,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Positioned(
                  right: 100,
                  child: SizedBox(width: SizeConstants.searchPageWidth, child: SearchPage(controller: controller)),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
