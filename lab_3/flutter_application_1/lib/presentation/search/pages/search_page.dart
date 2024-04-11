import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_cubit.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_state.dart';
import 'package:flutter_application_1/presentation/search/pages/search_results.dart';
import 'package:flutter_application_1/shared/widgets/one_card.dart';
import 'package:flutter_application_1/shared/widgets/one_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  // Конструктор SearchPage, що приймає контролер для текстового поля
  const SearchPage({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Об'явлення кубіту пошуку
  late final SearchCubit bloc = context.read<SearchCubit>();
  final double width = 350;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Stack(
          children: [
            // Відображення карточки пошуку, якщо пошук видимий
            if (state.isSearchVisible)
              Column(
                children: [
                  // Проміжок для відступу від верхньої панелі та карточки
                  const SizedBox(
                      height: DimensionConstants.appBarHeight +
                          PaddingConstants.extraSmall),
                  // Карточка для відображення результатів пошуку
                  OneCard(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          BorderRadiusConstants.extraLarge),
                    ),
                    child: SizedBox(
                      width: width,
                      child: _buildBody(state),
                    ),
                  ),
                ],
              ),
            // Відображення текстового поля для введення запиту на пошук
            SizedBox(
              height: DimensionConstants.appBarHeight,
              child: Center(
                child: SizedBox(
                  width: width,
                  height: PaddingConstants.immense,
                  child: OneTextField(
                    controller: widget.controller,
                    backgroundColor: Colors.grey.shade100,
                    labelText: 'Search',
                    onChanged: (value) {
                      // Виклик методу пошуку при зміні тексту в полі
                      bloc.search(value, page: 1);
                      bloc.setSearchVisibility(true);
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Метод для відображення тіла екрану залежно від стану пошуку
  Widget _buildBody(SearchState state) {
    if (state.status == MainStatus.error) {
      // Відображення тексту помилки, якщо стан пошуку - помилка
      return Center(child: Text(state.errorMessage));
    } else if (state.status == MainStatus.initial) {
      // Відображення результатів пошуку, якщо стан пошуку - початковий
      return Container(
        constraints: const BoxConstraints(maxHeight: 600),
        child: SearchResults(
          controller: widget.controller,
        ),
      );
    } else {
      // Відображення індикатора завантаження, якщо стан пошуку - інший
      return const Padding(
        padding: EdgeInsets.all(PaddingConstants.large),
        child: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
