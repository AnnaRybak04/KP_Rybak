import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/app_color.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/widgets/one_card.dart';
import 'package:flutter_application_1/shared/widgets/one_image.dart';
import 'package:go_router/go_router.dart';

class OneMediaCard extends StatelessWidget {
  const OneMediaCard({
    super.key, // Ключ, що ідентифікує екземпляр віджету
    required this.onTap, // Функція, що виконується при натисканні на картку
    required this.imageUrl, // Посилання на зображення
    required this.title, // Назва медіа
    required this.releaseDate, // Дата виходу
    required this.popularity, // Популярність
    required this.voteAverage, // Рейтинг
  });
  final Function() onTap; // Функція, що виконується при натисканні на картку
  final String imageUrl; // Посилання на зображення
  final String title; // Назва медіа
  final String releaseDate; // Дата виходу
  final double popularity; // Популярність
  final double voteAverage; // Рейтинг

  @override
  Widget build(BuildContext context) {
    return OneCard(
      onTap: () {
        // Обробник натискання на картку
        onTap(); // Викликаємо функцію, що передана при ініціалізації
        context.pushNamed(
            MainRouteName.movieDetails); // Переходимо на сторінку деталей медіа
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              BorderRadiusConstants.normal)), // Форма картки з круглими кутами
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Колір фону
          borderRadius: BorderRadius.circular(
              BorderRadiusConstants.normal), // Круглі кути контейнера
        ),
        width: 200, // Ширина контейнера
        height: 300, // Висота контейнера
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: OneImage(
                imageLink: imageUrl, // Посилання на зображення
                radius: BorderRadius.circular(
                    BorderRadiusConstants.normal), // Круглий радіус зображення
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      maxLines: 1,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '$title ($releaseDate)', // Назва та дата виходу медіа
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: PaddingConstants
                            .normal), // Відступ між назвою та інформацією про популярність та рейтинг
                    Row(
                      children: [
                        const Icon(
                          Icons.visibility_outlined,
                          color:
                              AppColor.iconsGrey, // Колір іконки популярності
                        ),
                        const SizedBox(
                            width: PaddingConstants.extraSmall /
                                2), // Додатковий відступ
                        Text(
                          popularity.toString(), // Вивід значення популярності
                          style: const TextStyle(
                            fontSize: 14,
                            color:
                                AppColor.iconsGrey, // Колір тексту популярності
                          ),
                        ),
                        const SizedBox(
                            width: PaddingConstants
                                .extraSmall), // Додатковий відступ
                        const Icon(
                          Icons.star_half_outlined,
                          color: Color.fromARGB(
                              255, 255, 199, 0), // Колір іконки рейтингу
                        ),
                        const SizedBox(
                            width: PaddingConstants.extraSmall /
                                2), // Додатковий відступ
                        Text(
                          voteAverage.toString(), // Вивід значення рейтингу
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColor.iconsGrey, // Колір тексту рейтингу
                          ),
                        ),
                      ],
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
