import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/app_color.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/presentation/main/bloc/main_cubit.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/widgets/one_card.dart';
import 'package:flutter_application_1/shared/widgets/one_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// Клас, що представляє карточку одного фільму
class OneMovieCard extends StatelessWidget {
  const OneMovieCard(
      {super.key, required this.movie, required this.isFavourite});
  final MovieItem movie; // Представлення фільму
  final bool isFavourite; // Чи є фільм у списку обраних

  @override
  Widget build(BuildContext context) {
    return OneCard(
      // Віджет карточки
      onTap: () {
        // Обробник натискання на карточку
        BlocProvider.of<MediaDetailsCubit>(context)
            .setMovie(movie.id); // Встановлення фільму для відображення деталей
        context.pushNamed(MainRouteName
            .movieDetails); // Перехід на сторінку з деталями фільму
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusConstants
              .normal)), // Форма карточки з закругленими краями
      child: Container(
        // Контейнер для карточки
        decoration: BoxDecoration(
          // Декорація карточки
          color: Colors.white, // Колір фону
          borderRadius: BorderRadius.circular(
              BorderRadiusConstants.normal), // Закруглення країв
        ),
        width: 200, // Ширина карточки
        child: Column(
          // Вміст карточки
          children: [
            Expanded(
              // Розширений вміст для зображення
              flex: 3,
              child: SizedBox(
                // Розміщення для зображення
                child: OneImage(
                  // Віджет зображення
                  imageLink: movie.imageUrl, // Посилання на зображення фільму
                  radius: BorderRadius.circular(BorderRadiusConstants
                      .normal), // Закруглення країв для зображення
                ),
              ),
            ),
            Expanded(
              // Розширений вміст для назви та рейтингу фільму
              child: Padding(
                // Поставлення відступів для вмісту
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Вирівнювання по лівому краю
                  children: [
                    RichText(
                      // Текст з можливістю різних стилів
                      maxLines: 1, // Максимальна кількість рядків
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${movie.title} (${movie.releaseDate})', // Назва та рік випуску фільму
                            style: const TextStyle(
                              // Стиль тексту
                              fontWeight: FontWeight.bold, // Жирний
                              fontSize: 18, // Розмір шрифту
                              color: Colors.black, // Колір тексту
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8), // Порожній відступ
                    Expanded(
                      // Розширений вміст для рядка з популярністю та рейтингом
                      child: Row(
                        children: [
                          Expanded(
                            // Розширений вміст для рядка з популярністю
                            child: Row(
                              children: [
                                const Icon(
                                  // Іконка з популярністю
                                  Icons.visibility_outlined, // Іконка видимості
                                  color: AppColor.iconsGrey, // Колір іконки
                                ),
                                const SizedBox(
                                    width: PaddingConstants
                                        .small), // Порожній відступ
                                Expanded(
                                  child: Text(
                                    // Текст з популярністю
                                    movie.popularity
                                        .toString(), // Значення популярності
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color:
                                            AppColor.iconsGrey), // Стиль тексту
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 4), // Порожній відступ
                          Expanded(
                            // Розширений вміст для рядка з рейтингом та кнопкою "В обране"
                            child: Row(
                              children: [
                                const Icon(
                                  // Іконка з рейтингом
                                  Icons.star_half_outlined, // Іконка рейтингу
                                  color: Color.fromARGB(
                                      255, 255, 199, 0), // Колір іконки
                                ),
                                Expanded(
                                  child: Text(
                                    // Текст з рейтингом
                                    movie.voteAverage.toStringAsFixed(
                                        1), // Значення рейтингу з фіксованим кількістю десяткових знаків
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color:
                                            AppColor.iconsGrey), // Стиль тексту
                                  ),
                                ),
                                Container(
                                  // Контейнер для кнопки "В обране"
                                  alignment: Alignment
                                      .centerRight, // Вирівнювання контенту по правому краю
                                  child: IconButton(
                                    // Кнопка із зображенням
                                    icon: Icon(
                                      // Іконка
                                      isFavourite
                                          ? Icons.favorite
                                          : Icons
                                              .favorite_border, // Заповнена або пуста іконка в залежності від статусу "В обране"
                                      color:
                                          AppColor.mainPurple, // Колір іконки
                                    ),
                                    onPressed: () {
                                      // Обробник натискання на кнопку
                                      BlocProvider.of<MainCubit>(context)
                                          .onFavouriteMovie(
                                              movie); // Додавання або видалення фільму у список обраних
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
