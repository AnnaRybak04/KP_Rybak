import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/theme/components/one_theme_change.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';
import 'package:go_router/go_router.dart';

class OneDrawer extends StatelessWidget {
  const OneDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    if (LayoutHelper.isDesktopScreen(context)) {
      return Container();
    } else {
      return Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              margin: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Навігація'),
                  OneThemeChange(),
                ],
              ),
            ),
            ListTile(
              title: const Text('Фільми'),
              onTap: () {
                context.goNamed(MainRouteName.films);
              },
            ),
            ListTile(
              title: const Text('ТВ Шоу'),
              onTap: () {
                context.goNamed(MainRouteName.tvShows);
              },
            ),
          ],
        ),
      );
    }
  }
}
