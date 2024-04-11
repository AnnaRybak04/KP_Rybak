import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_cubit.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_state.dart';
import 'package:flutter_application_1/presentation/search/pages/search_results.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/widgets/one_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MobileSearchPage extends StatefulWidget {
  const MobileSearchPage({super.key});

  @override
  State<MobileSearchPage> createState() => _MobileSearchPageState();
}

class _MobileSearchPageState extends State<MobileSearchPage> {
  final TextEditingController controller = TextEditingController();
  late final SearchCubit bloc = BlocProvider.of<SearchCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            // Якщо ширина екрану більша за 1100, перейдіть на домашню сторінку та поверніть пустий контейнер.
            if (width > 1100) {
              context.goNamed(MainRouteName.home);
              return const SizedBox();
            } else {
              // Інакше відображаємо текстове поле для пошуку та результати пошуку.
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(PaddingConstants.extraLarge),
                    child: OneTextField(
                      controller: controller,
                      backgroundColor: Colors.grey.shade100,
                      labelText: 'Search', // Текст мітки для текстового поля.
                      onChanged: (value) {
                        bloc.search(controller.text, page: 1);
                        setState(() {});
                      },
                    ),
                  ),
                  // Якщо текстове поле не порожнє, відображаємо результати пошуку.
                  if (controller.text.isNotEmpty)
                    Expanded(child: SearchResults(controller: controller)),
                ],
              );
            }
          },
        );
      },
    );
  }
}
