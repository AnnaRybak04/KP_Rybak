import 'package:flutter/material.dart';
import 'package:flutter_application_1/site_layout.dart';


import 'widgets/movie_list/movie_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(

      //   bottomNavigationBarTheme: bottomBarTheme,
      // ),
     // home: SiteLayout(),
      routes: {
        '/main_screen': (context) => SiteLayout(),
        // '/main_screen/search': (context) => SearchPage(),
        // '/main_screen/favorites': (context) => FavoritesList(),
        '/main_screen/movie_detais': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(movie_id: arguments);
          }
          return MovieDetailsWidget(movie_id: 0);
        },
      },
      initialRoute: '/main_screen',
    );
  }
}
