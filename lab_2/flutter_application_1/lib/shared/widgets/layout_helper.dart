import 'package:flutter/material.dart';

class LayoutHelper {
  static bool isMobileScreen(BuildContext context) => MediaQuery.of(context).size.width < 600;

  static bool isTabletScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > 600 && MediaQuery.of(context).size.width < 1100;

  static bool isDesktopScreen(BuildContext context) => MediaQuery.of(context).size.width > 1100;

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
