import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/movie_model.dart';
import 'package:flutter_application_1/site_layout.dart';
import 'package:flutter_application_1/widgets/media_grid.dart';

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
        //'/main_screen/all_movies': (context) => MoviesPage(),
        // '/main_screen/search': (context) => SearchPage(),
        // '/main_screen/favorites': (context) => FavoritesList(),
        //'/main_screen/movie_detais': (context) {},
          // final arguments = ModalRoute.of(context)?.settings.arguments;
          // if (arguments is MovieModel) {
          //   return MovieDetailsWidget(movie: arguments);
          // } else {
          //   return Center(child: Text("0000"));
          // }
        
      },
      initialRoute: '/main_screen',
    );
  }
}
