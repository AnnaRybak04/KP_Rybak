import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/models/movie_model.dart';
import 'package:flutter_application_1/responsive/desktop_scaffold.dart';
import 'package:flutter_application_1/responsive/responsive_layout.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'responsive/mobile_scaffold.dart';
import 'responsive/tablet_scaffold.dart';


class SiteLayout extends StatefulWidget {
  const SiteLayout({super.key});

  @override
  State<SiteLayout> createState() => _SiteLayoutState();
}

late Future<List<MovieModel>> trendingMovies;
late Future<List<MovieModel>> topRatedMovies;

class _SiteLayoutState extends State<SiteLayout> {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey();
  
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
  }

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
