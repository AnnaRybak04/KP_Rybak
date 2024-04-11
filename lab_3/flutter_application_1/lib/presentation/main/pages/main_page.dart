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
  const MainPage({super.key}); // Конструктор класу MainPage

  @override
  Widget build(BuildContext context) {
    return OneScaffold(
      // Віджет-обгортка з однією рамкою
      child: ScrollConfiguration(
        // Конфігурація прокрутки
        behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars:
                false), // Копіюємо конфігурацію прокрутки з контексту та відключаємо полоси прокрутки
        child: SingleChildScrollView(
          // Прокрутка, яка вміщує один віджет
          child: BlocBuilder<MainCubit, MainState>(
            // Віджет для побудови віджетів залежно від стану блоку
            builder: (context, state) {
              // Будуємо віджети залежно від стану
              return SizedBox(
                // Фіксований контейнер розміром до вмісту
                width: double
                    .infinity, // Ширина розтягується на всю доступну ширину
                child: Column(
                  // Колонка дочірних віджетів
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Вирівнювання по лівому краю
                  children: [
                    const Padding(
                      // Додавання відступів
                      padding: EdgeInsets.symmetric(
                        vertical: PaddingConstants.extraLarge,
                        horizontal: PaddingConstants.medium,
                      ),
                      child: Text(
                        // Текстовий віджет
                        'Тренди', // Текст
                        textAlign:
                            TextAlign.left, // Вирівнювання тексту ліворуч
                        style: TextStyle(
                          // Стиль тексту
                          fontSize: 24, // Розмір шрифту
                          fontWeight: FontWeight.w800, // Товщина шрифту
                        ),
                      ),
                    ),
                    SizedBox(
                      // Фіксований контейнер розміром до вмісту
                      height: 440, // Висота контейнера
                      child: _buildBody(state,
                          state.trandingMovies), // Віджет для побудови тіла
                    ),
                    const Padding(
                      // Додавання відступів
                      padding: EdgeInsets.symmetric(
                        vertical: PaddingConstants.extraLarge,
                        horizontal: PaddingConstants.medium,
                      ),
                      child: Text(
                        // Текстовий віджет
                        'Найвищий рейтинг', // Текст
                        textAlign:
                            TextAlign.left, // Вирівнювання тексту ліворуч
                        style: TextStyle(
                          // Стиль тексту
                          fontSize: 24, // Розмір шрифту
                          fontWeight: FontWeight.w800, // Товщина шрифту
                        ),
                      ),
                    ),
                    SizedBox(
                      // Фіксований контейнер розміром до вмісту
                      height: 440, // Висота контейнера
                      child: _buildBody(state,
                          state.popularMovies), // Віджет для побудови тіла
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(MainState state, List<MovieItem> movies) {
    // Віджет для побудови тіла
    if (state.status == MainStatus.error) {
      // Якщо статус помилки
      return Center(
          child: Text(state
              .errorMessage)); // Повертаємо центральний віджет з текстом помилки
    } else if (state.status == MainStatus.initial) {
      // Якщо статус ініціалізації
      return MovieCards(
          movies: movies,
          favouriteMovies:
              state.favouriteMovies); // Повертаємо віджет карточок фільмів
    } else {
      // В іншому випадку
      return const Center(
          child:
              CircularProgressIndicator()); // Повертаємо центральний віджет з крутильним індикатором
    }
  }
}
