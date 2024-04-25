import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/presentation/main/bloc/main_cubit.dart';
import 'package:flutter_application_1/presentation/main/bloc/main_state.dart';
import 'package:flutter_application_1/presentation/main/pages/widgets/movie_cards.dart';
import 'package:flutter_application_1/shared/widgets/one_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OneScaffold(
      // Віджет-обгортка з однією рамкою
      child: ScrollConfiguration(
        // Конфігурація прокрутки
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          // Прокрутка, яка вміщує один віджет
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
              // Будуємо віджети залежно від стану
            return SizedBox(
              width: double.infinity,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: PaddingConstants.extraLarge,
                      horizontal: PaddingConstants.medium,
                    ),
                    child: Text(
                      'Тренди',
                      textAlign: TextAlign.left,
                      style: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onSurface),
                    ),
                  ),
                  SizedBox(
                    height: SizeConstants.homeCardHeight,
                    child: _buildBody(state, state.trandingMovies),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: PaddingConstants.extraLarge,
                      horizontal: PaddingConstants.medium,
                    ),
                    child: Text(
                      'Найвищий рейтинг',
                      textAlign: TextAlign.left,
                      style: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onSurface),
                    ),
                  ),
                  SizedBox(
                    height: SizeConstants.homeCardHeight,
                    child: _buildBody(state, state.popularMovies),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

    // Віджет для побудови тіла
  Widget _buildBody(MainState state, List<MovieItem> movies) {
    if (state.status == MainStatus.error) {
      // Якщо статус помилки
      return Center(child: Text(state.errorMessage));
    } else if (state.status == MainStatus.initial) {
      // Якщо статус ініціалізації
      return MovieCards(movies: movies, favouriteMovies: state.favouriteMovies);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
