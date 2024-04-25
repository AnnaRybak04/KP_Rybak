import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_cubit.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_state.dart';
import 'package:flutter_application_1/presentation/favourite/pages/shows_grid.dart';
import 'package:flutter_application_1/shared/widgets/one_not_found.dart';
import 'package:flutter_application_1/shared/widgets/one_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key}); // Конструктор класу FavoritePage

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OneScaffold(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
           // Віджет для будівництва і поновлення стану блоку
           builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: PaddingConstants.extraLarge),
                Padding(
                  padding: const EdgeInsets.only(left: PaddingConstants.large),
                  child: Text(
                    'Збережене',
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onSurface),
                  ),
                ),
                const SizedBox(height: PaddingConstants.extraLarge),
                Expanded(child: _buildBody(state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(FavoriteState state) {
    if (state.status == MainStatus.error) {
      // Якщо статус помилки
      return Center(child: Text(state.errorMessage));
    } else if (state.status == MainStatus.initial) {
      // Якщо статус ініціалізації
      if (state.movies.isEmpty && state.tvShows.isEmpty) {
        // Якщо немає фільмів і шоу
        return const SizedBox(
          width: double.infinity,
          child: OneNotFound(),
        );
      } else {
        return ShowsGrid(tvShows: state.tvShows, movies: state.movies);
      }
    } else {
      return const Center(child: CircularProgressIndicator()); // Відображення індикатора завантаження
    }
  }
}
