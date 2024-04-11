import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/shared/theme/app_color.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';
import 'package:flutter_application_1/shared/widgets/one_app_bar.dart';
import 'package:flutter_application_1/shared/widgets/one_button.dart';
import 'package:flutter_application_1/shared/widgets/one_card.dart';
import 'package:flutter_application_1/shared/widgets/one_image.dart';
import 'package:flutter_application_1/shared/widgets/one_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    super.key,
    required this.isLoading,
    required this.imageUrl,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
    required this.onFavouriteTap,
    required this.isFavourite,
    required this.onRatingChanged,
    required this.rating,
    required this.countries,
    required this.genres,
    required this.companies,
  });
  final bool isLoading;
  final String imageUrl;
  final String title;
  final String overview;
  final String releaseDate;
  final double popularity;
  final double voteAverage;
  final Function() onFavouriteTap;
  final Function(double rating) onRatingChanged;
  final double rating;
  final bool isFavourite;
  final List<String> countries;
  final List<String> genres;
  final List<String> companies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: LayoutHelper.isDesktopScreen(context) ? null : _buildActionButton(),
      appBar: !LayoutHelper.isDesktopScreen(context)
          ? AppBar(
              backgroundColor: AppColor.mainPurple,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Center(
                child: Text(
                  'Деталі фільму',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          : const OneAppBar(),
      body: !LayoutHelper.isDesktopScreen(context)
          ? OneScaffold(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 350,
                      child: OneImage(
                        aspectRatio: 2,
                        imageLink: imageUrl,
                        radius: const BorderRadius.only(
                          bottomLeft: Radius.circular(BorderRadiusConstants.extraLarge),
                          bottomRight: Radius.circular(BorderRadiusConstants.extraLarge),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          BorderRadiusConstants.normal,
                        ),
                      ),
                      child: _buildDetails(),
                    ),
                  ],
                ),
              ),
            )
          : OneScaffold(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: PaddingConstants.medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: PaddingConstants.extraLarge),
                    OneButton(
                      text: 'Назад',
                      onTap: () {
                        context.pop();
                      },
                    ),
                    const SizedBox(
                      height: PaddingConstants.extraLarge,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          OneCard(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                BorderRadiusConstants.extraLarge,
                              ),
                            ),
                            child: _buildBody(),
                          ),
                          Positioned(
                            bottom: PaddingConstants.extraLarge,
                            right: PaddingConstants.extraLarge,
                            child: _buildActionButton(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              height: double.infinity,
              child: OneImage(
                imageLink: imageUrl,
                radius: const BorderRadius.only(
                  topLeft: Radius.circular(BorderRadiusConstants.extraLarge),
                  bottomLeft: Radius.circular(BorderRadiusConstants.extraLarge),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(BorderRadiusConstants.extraLarge),
                  bottomRight: Radius.circular(BorderRadiusConstants.extraLarge),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              child: _buildDetails(),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildDetails() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(PaddingConstants.extraLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 36,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: PaddingConstants.large),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Рейтинг:',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: PaddingConstants.extraSmall / 2),
                      child: Icon(
                        Icons.star_half_outlined,
                        color: Colors.orange,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${voteAverage.toString()}/10',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: PaddingConstants.extraLarge),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Перегляди:',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: PaddingConstants.extraSmall / 2),
                      child: Icon(
                        Icons.visibility_outlined,
                        color: AppColor.iconsGrey,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        popularity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: PaddingConstants.large),
          RichText(
            maxLines: 1,
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Країна: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: countries.join(', '),
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: PaddingConstants.large),
          RichText(
            maxLines: 1,
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Компанія: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: companies.join(', '),
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: PaddingConstants.large),
          RichText(
            maxLines: 1,
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Жанр: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: genres.join(', '),
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: PaddingConstants.large),
          if (overview.isNotEmpty) ...[
            const Text(
              'Опис: ',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: PaddingConstants.normal),
            Text(
              overview,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),
          ],
          const SizedBox(height: PaddingConstants.large),
          RichText(
            maxLines: 1,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Мій рейтинг: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: PaddingConstants.normal),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: SmoothStarRating(
              allowHalfRating: false,
              onRatingChanged: onRatingChanged,
              starCount: 5,
              rating: rating,
              size: DimensionConstants.iconLarge + DimensionConstants.iconSmall,
              defaultIconData: Icons.star_border,
              halfFilledIconData: Icons.star_half,
              filledIconData: Icons.star,
              color: Colors.orange,
              borderColor: Colors.grey,
              spacing: PaddingConstants.large,
            ),
          ),
          const SizedBox(height: PaddingConstants.normal),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return FloatingActionButton(
      backgroundColor: AppColor.mainPurple,
      onPressed: onFavouriteTap,
      child: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
      ),
    );
  }
}
