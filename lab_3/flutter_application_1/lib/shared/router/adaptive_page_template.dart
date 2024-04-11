import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';

class AdaptivePageTemplate extends StatelessWidget {
  const AdaptivePageTemplate({
    required this.page,
    super.key, 
  });
  final Widget page;

  @override
  Widget build(BuildContext context) {
    // Визначаємо, чи це декстоп
    final isDesktop = LayoutHelper.isDesktopScreen(context);
    return Center(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              // Встановлюємо позицію верхнього краю в залежності від того, чи це десктоп чи мобільний пристрій.
              top: isDesktop ? DimensionConstants.webTopNavigationBarHeight : 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: page,
            ),
          ],
        ),
      ),
    );
  }
}
