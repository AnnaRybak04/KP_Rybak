import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/theme/components/one_theme_change.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';
import 'package:flutter_application_1/shared/widgets/one_button.dart';
import 'package:flutter_application_1/shared/widgets/one_scaffold.dart';
import 'package:go_router/go_router.dart';

class OneAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OneAppBar({
    super.key,
    this.appBarHeight = DimensionConstants.appBarHeight,
  });
  final double appBarHeight;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (LayoutHelper.isDesktopScreen(context)) {
      return OneScaffold(
        child: SizedBox(
          width: double.infinity,
          child: SizedBox(
            height: DimensionConstants.webTopNavigationBarHeight,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: PaddingConstants.extraImmense,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OneButton(
                            onTap: () {
                              context.goNamed(MainRouteName.films);
                            },
                            text: 'Фільми',
                          ),
                          const SizedBox(width: PaddingConstants.normal),
                          OneButton(
                            onTap: () {
                              context.goNamed(MainRouteName.tvShows);
                            },
                            text: 'ТВ Шоу',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(left: PaddingConstants.medium, child: _buildTitle(context)),
                Positioned(
                  right: PaddingConstants.medium,
                  child: Row(
                    children: [
                      SizedBox(
                        height: appBarHeight,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite_border,
                            ),
                            color: theme.colorScheme.primary,
                            onPressed: () {
                              context.goNamed(MainRouteName.favourite);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: appBarHeight,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.star_outline,
                            ),
                            color: theme.colorScheme.primary,
                            onPressed: () {
                              context.goNamed(MainRouteName.rated);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return AppBar(
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            context.goNamed(MainRouteName.home);
          },
          child: Text(
            'MovieTime',
            style: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onPrimary),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: PaddingConstants.medium),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  context.goNamed(MainRouteName.search);
                },
              ),
              const SizedBox(width: PaddingConstants.extraSmall),
              IconButton(
                icon: const Icon(Icons.star_outline),
                onPressed: () {
                  context.goNamed(MainRouteName.rated);
                },
              ),
              const SizedBox(width: PaddingConstants.extraSmall),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  context.goNamed(MainRouteName.favourite);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: appBarHeight,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            context.goNamed(MainRouteName.home);
          },
          child: Row(
            children: [
              Text(
                'MovieTime',
                style: theme.textTheme.displaySmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: PaddingConstants.extraSmall),
              const OneThemeChange(),
            ],
          ),
        ),
      ),
    );
  }
}
