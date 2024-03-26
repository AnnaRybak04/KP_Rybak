import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive/desktop_scaffold.dart';
import 'package:flutter_application_1/responsive/responsive_layout.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'responsive/mobile_scaffold.dart';
import 'responsive/tablet_scaffold.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topNavigationBar(context, scaffkey),
      body: ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}
