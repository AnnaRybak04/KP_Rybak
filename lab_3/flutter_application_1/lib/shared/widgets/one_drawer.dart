import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
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
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Text('Навігація'),
            ),
            ListTile(
              title: const Text('Головна'),
              onTap: () {
                context.goNamed(MainRouteName.home);
              },
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
