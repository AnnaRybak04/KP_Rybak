import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  ResponsiveLayout({
    required this.desktopScaffold,
    required this.mobileScaffold,
    required this.tabletScaffold,
  });

  static bool isMobileScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
 
  static bool isTabletScreen(BuildContext context) =>
    MediaQuery.of(context).size.width > 600 &&
    MediaQuery.of(context).size.width < 1100;
  
  static bool isDesktopScreen(BuildContext context) =>
    MediaQuery.of(context).size.width > 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobileScaffold;
      } else if (constraints.maxWidth < 1100) {
        return tabletScaffold;
      } else {
        return desktopScaffold;
      }
    });
  }
}
