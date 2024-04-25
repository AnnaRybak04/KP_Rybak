import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';
import 'package:flutter_application_1/shared/widgets/one_app_bar.dart';
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
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: LayoutHelper.isDesktopScreen(context) ? null : _buildActionButton(),
      appBar: !LayoutHelper.isDesktopScreen(context)
          ? AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Деталі фільму',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimary),
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
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 250,
                    //   child: OneImage(
                    //     aspectRatio: 2,
                    //     imageLink: imageUrl,
                    //     radius: const BorderRadius.only(
                    //       // bottomLeft: Radius.circular(BorderRadiusConstants.extraLarge),
                    //       // bottomRight: Radius.circular(BorderRadiusConstants.extraLarge),
                    //     ),
                    //   ),
                    // ),
                    Stack(
  children: [
    SizedBox(
      width: double.infinity,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    ),
    Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black.withOpacity(0.5), // темніше
        ),
      ),
    ),
    Positioned(
      left: 40,
      top: 10,
      child: Container(
        width: 150,
        height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child:OneImage(
                        aspectRatio: 2,
                        imageLink: imageUrl, 
                        radius: BorderRadius.circular(
                          BorderRadiusConstants.normal, // Ваш постер в цьому віджеті
      ),
      ),
    ),),
  ],
),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          BorderRadiusConstants.normal,
                        ),
                      ),
                      child: _buildDetails(context),
                    ),
                  ],
                ),
              ),
            )
          : OneScaffold(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingConstants.medium,
                  vertical: PaddingConstants.extraImmense,
                ),
                child: Stack(
                  children: [
                    OneCard(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          BorderRadiusConstants.extraLarge,
                        ),
                      ),
                      child: _buildBody(context),
                    ),
                    Positioned(
                      bottom: PaddingConstants.extraLarge,
                      right: PaddingConstants.extraLarge,
                      child: _buildActionButton(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Row(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              height: double.infinity,
              child: OneImage(
                imageLink: imageUrl,
                radius: const BorderRadius.only(
                  topLeft: Radius.circular(BorderRadiusConstants.extraLarge),
                  bottomLeft:
                      Radius.circular(BorderRadiusConstants.extraLarge),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(BorderRadiusConstants.extraLarge),
                  bottomLeft: Radius.circular(BorderRadiusConstants.extraLarge),
                ),
              ),
              height: double.infinity,
              child: _buildDetails(context),
            ),
          ),
          
        ],
      );
    }
  }

  Widget _buildDetails(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(PaddingConstants.extraLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (LayoutHelper.isDesktopScreen(context)) ...[
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  splashRadius: DimensionConstants.iconLarge,
                  icon: Icon(
                    Icons.arrow_back,
                    size: DimensionConstants.iconLarge,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: PaddingConstants.normal),
              ] else
                const SizedBox(),
              Expanded(
                child: Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: PaddingConstants.large),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        'Рейтинг:',
                        style: theme.textTheme.bodyLarge,
                        
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: PaddingConstants.extraSmall),
                      child: Icon(
                        Icons.star_half_outlined,
                        color: Colors.orange,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${voteAverage.toString()}/10',
                        style: theme.textTheme.bodyMedium,
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
                    Text(
                      'Перегляди:',
                      style: theme.textTheme.bodyLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: PaddingConstants.extraSmall),
                      child: Icon(
                        Icons.visibility_outlined,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        popularity.toString(),
                        style: theme.textTheme.bodyMedium,
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
              style: theme.textTheme.bodyLarge,
              children: [
                const TextSpan(
                  text: 'Країна: ',
                  
                ),
                TextSpan(
                  text: countries.join(', '),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: PaddingConstants.large),
          RichText(
            maxLines: 1,
            text: TextSpan(
              style: theme.textTheme.bodyLarge,
              children: [
                const TextSpan(
                  text: 'Дата виходу: ',
                ),
                TextSpan(
                  style: theme.textTheme.bodyMedium,
                  text: releaseDate,
                ),
              ],
            ),
          ),
          const SizedBox(height: PaddingConstants.large),
          RichText(
            maxLines: 1,
            text: TextSpan(
              style: theme.textTheme.bodyLarge,
              children: [
                const TextSpan(
                  text: 'Компанія: ',
                ),
                TextSpan(
                  style: theme.textTheme.bodyMedium,
                  text: companies.join(', '),
                ),
              ],
            ),
          ),
          const SizedBox(height: PaddingConstants.large),
          RichText(
            maxLines: 1,
            text: TextSpan(
              style: theme.textTheme.bodyLarge,
              children: [
                const TextSpan(
                  text: 'Жанр: ',
                ),
                TextSpan(
                  style: theme.textTheme.bodyMedium,
                  text: genres.join(', '),
                ),
              ],
            ),
          ),
          const SizedBox(height: PaddingConstants.large),
          if (overview.isNotEmpty) ...[
            RichText(
              maxLines: 1,
              text: TextSpan(
                style: theme.textTheme.bodyLarge,
                children: const [
                  TextSpan(
                    text: 'Опис ',
                  ),
                  
                ],
              ),
            ),
            const SizedBox(height: PaddingConstants.normal),
            Text(
              overview,
            ),
          ],
          const SizedBox(height: PaddingConstants.large),
           RichText(
            maxLines: 1,
            text: TextSpan(
              style: theme.textTheme.bodyLarge,
              children: const [
                TextSpan(
                  text: 'Рейтинг ',
                ),
              ],
            ),
          ),
          const SizedBox(height: PaddingConstants.large),
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
              borderColor: theme.colorScheme.onSurfaceVariant,
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
      onPressed: onFavouriteTap,
      child: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
      ),
    );
  }
}
