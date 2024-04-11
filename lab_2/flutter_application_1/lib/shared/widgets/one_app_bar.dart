import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/theme/app_color.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';
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
    if (LayoutHelper.isDesktopScreen(context)) {
      return SizedBox(
        width: double.infinity,
        child: Container(
          height: DimensionConstants.webTopNavigationBarHeight,
          color: AppColor.mainPurple,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.goNamed(MainRouteName.films);
                        },
                        child: const Text(
                          'Фільми',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.goNamed(MainRouteName.tvShows);
                        },
                        child: const Text(
                          'ТВ Шоу',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(left: PaddingConstants.extraImmense, child: _buildTitle(context)),
              Positioned(
                right: PaddingConstants.extraImmense,
                child: Row(
                  children: [
                    SizedBox(
                      height: appBarHeight,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            context.goNamed(MainRouteName.favourite);
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
      );
    }
    return AppBar(
      title: Center(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              context.goNamed(MainRouteName.home);
            },
            child: const Text(
              'MovieTime',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
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
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  context.goNamed(MainRouteName.favourite);
                },
              ),
            ],
          ),
        ),
      ],
      backgroundColor: AppColor.mainPurple,
      foregroundColor: Colors.white,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return SizedBox(
      height: appBarHeight,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            context.goNamed(MainRouteName.home);
          },
          child: const Center(
            child: Text(
              'MovieTime',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
