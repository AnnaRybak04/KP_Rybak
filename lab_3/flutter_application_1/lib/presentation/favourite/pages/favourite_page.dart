import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_cubit.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_state.dart';
import 'package:flutter_application_1/presentation/favourite/pages/favourite_shows_grid.dart';
import 'package:flutter_application_1/shared/theme/app_color.dart';
import 'package:flutter_application_1/shared/widgets/one_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key}); // Конструктор класу FavoritePage

  @override
  Widget build(BuildContext context) {
    return OneScaffold(
      // Використання власного виджета OneScaffold
      child: ScrollConfiguration(
        // Конфігурація прокрутки
        behavior: ScrollConfiguration.of(context)
            .copyWith(scrollbars: false), // Встановлення параметрів прокрутки
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          // Віджет для будівництва і поновлення стану блоку
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: PaddingConstants.extraLarge), // Відступ
                const Padding(
                  padding:
                      EdgeInsets.only(left: PaddingConstants.large), // Відступи
                  child: Text(
                    'Збережене:', // Текст
                    textAlign: TextAlign.left, // Вирівнювання тексту
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: PaddingConstants.extraLarge), // Відступ
                Expanded(child: _buildBody(state)), // Віджет тіла сторінки
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
      return Center(
          child: Text(
              state.errorMessage)
              ); // Відображення тексту помилки по центру
    } else if (state.status == MainStatus.initial) {
      // Якщо статус ініціалізації
      if (state.movies.isEmpty && state.tvShows.isEmpty) {
        // Якщо немає фільмів і шоу
        return const SizedBox(
          // Порожній контейнер
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search_off, // Іконка пошуку вимкнена
                size: 100,
                color: AppColor.iconsGrey,
              ),
              SizedBox(height: PaddingConstants.medium), // Відступ
              Text(
                'Нічого не знайдено', // Текст
                style: TextStyle(
                  color: AppColor.iconsGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        );
      } else {
        return FavouriteShowGrid(
            tvShows: state.tvShows,
            movies: state.movies,
            ); // Грід з улюбленими шоу і фільмами
      }
    } else {
      return const Center(
          child:
              CircularProgressIndicator(),
              ); // Відображення індикатора завантаження
    }
  }
}
