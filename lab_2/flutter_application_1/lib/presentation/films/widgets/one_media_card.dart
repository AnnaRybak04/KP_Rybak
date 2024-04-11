import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/app_color.dart';
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
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
  });
  final Function() onTap;
  final String imageUrl;
  final String title;
  final String releaseDate;
  final double popularity;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return OneCard(
      onTap: () {
        onTap();
        context.pushNamed(MainRouteName.movieDetails);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BorderRadiusConstants.normal)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(BorderRadiusConstants.normal),
        ),
        width: 200,
        height: 300,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: OneImage(
                imageLink: imageUrl,
                radius: BorderRadius.circular(BorderRadiusConstants.normal),
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
                            text: '$title ($releaseDate)',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: PaddingConstants.normal),
                    Row(
                      children: [
                        const Icon(
                          Icons.visibility_outlined,
                          color: AppColor.iconsGrey,
                        ),
                        const SizedBox(width: PaddingConstants.extraSmall / 2),
                        Text(
                          popularity.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColor.iconsGrey,
                          ),
                        ),
                        const SizedBox(width: PaddingConstants.extraSmall),
                        const Icon(
                          Icons.star_half_outlined,
                          color: Color.fromARGB(255, 255, 199, 0),
                        ),
                        const SizedBox(width: PaddingConstants.extraSmall / 2),
                        Text(
                          voteAverage.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColor.iconsGrey,
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
