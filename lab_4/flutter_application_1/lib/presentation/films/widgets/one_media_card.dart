import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/widgets/one_card.dart';
import 'package:flutter_application_1/shared/widgets/one_image.dart';
import 'package:go_router/go_router.dart';

class OneMediaCard extends StatelessWidget {
  const OneMediaCard({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.popularity,
    required this.voteAverage,
  });
  // Функція, що виконується при натисканні на картку
  final Function() onTap;
  final String imageUrl; // Посилання на зображення
  final String title; // Назва медіа
  final double popularity; // Популярність
  final double voteAverage; // Рейтинг

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OneCard(
      onTap: () {
        // Обробник натискання на картку
        onTap(); // Викликаємо функцію, що передана при ініціалізації
        context.pushNamed(MainRouteName.movieDetails);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BorderRadiusConstants.normal)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusConstants.normal),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: OneImage(
                imageLink: imageUrl,
                radius: const BorderRadius.only(
                  topLeft: Radius.circular(BorderRadiusConstants.normal),
                  topRight: Radius.circular(BorderRadiusConstants.normal),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(PaddingConstants.normal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(title, maxLines: 2),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.visibility_outlined,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: PaddingConstants.extraSmall),
                              Flexible(
                                child: Text(
                                  popularity.toString(),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: PaddingConstants.extraSmall),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              const SizedBox(width: PaddingConstants.extraSmall),
                              Flexible(
                                child: Text(
                                  voteAverage.toStringAsFixed(1),
                                  maxLines: 1,
                                ),
                              ),
                            ],
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
