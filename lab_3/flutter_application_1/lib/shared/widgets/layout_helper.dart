import 'package:flutter/material.dart';

class LayoutHelper {
  // Перевірка, чи екран є мобільним
  static bool isMobileScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  // Перевірка, чи екран є планшетним
  static bool isTabletScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > 600 &&
      MediaQuery.of(context).size.width < 1100;

  // Перевірка, чи екран є настільним
  static bool isDesktopScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > 1100;

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
