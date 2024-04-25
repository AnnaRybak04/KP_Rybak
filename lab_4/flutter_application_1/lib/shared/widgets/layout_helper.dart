import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';

class LayoutHelper {
  // Перевірка, чи екран є мобільним
  static bool isMobileScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < SizeConstants.smallScreenWidth;

  // Перевірка, чи екран є планшетним
  static bool isTabletScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > SizeConstants.smallScreenWidth &&
      MediaQuery.of(context).size.width < SizeConstants.largeScreenWidh;

  // Перевірка, чи екран є настільним
  static bool isDesktopScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > SizeConstants.largeScreenWidh;

  // Отримання кількості колонок для сітки в залежності від типу екрану
  static int getGridCount(BuildContext context) {
    final int count;
    if (LayoutHelper.isDesktopScreen(context)) {
      count = 4;
    } else {
      if (LayoutHelper.isTabletScreen(context)) {
        count = 2;
      } else {
        count = 1;
      }
    }
    return count;
  }
}
