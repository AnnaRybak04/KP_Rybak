
import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/movie_class.dart';
import 'package:flutter_application_1/resourses/app_images.dart';
import 'package:flutter_application_1/theme/app_color.dart';

// var myDefaultBackgroundColor = const Color.fromARGB(255, 214, 214, 214);
// var myAccentColor = Color.fromARGB(255, 80, 42, 234);

var myBottomNavigationBar = BottomNavigationBar(
  // currentIndex: _selectedTab,
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Головна",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "Пошук",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: "Обране",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.star_border),
      label: "Оцінене",
    ),
  ],
  // onTap: onSelectedTab,
);

var bottomBarTheme = const BottomNavigationBarThemeData(
  backgroundColor: Colors.white,
  selectedItemColor: AppColor.mainPurple,
  unselectedItemColor: Color.fromARGB(255, 121, 121, 121),
);

final my_movies = [
  Movie(
      id: 1,
      imageName: AppImages.moviePlaceholder,
      title: "Harry Potter",
      time: "1h 37m",
      year: "2020",
      genre: "Comedy",
      description:
          "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing ",
      IMDBrate: 8.9,
      viewAmount: 102.3),
  Movie(
      id: 2,
      imageName: AppImages.moviePlaceholder,
      title: "Home alone",
      time: "1h 37m",
      year: "2024",
      genre: "Horror",
      description:
          "Follow the mythic journey of  ho destroyed his family. Facing ",
      IMDBrate: 8.0,
      viewAmount: 103.9),
  Movie(
      id: 3,
      imageName: AppImages.moviePlaceholder,
      title: "Movie 1",
      time: "1h 37m",
      year: "2024",
      genre: "Horror",
      description:
          "Follow the mythic journey of  ho destroyed his family. Facing ",
      IMDBrate: 8.0,
      viewAmount: 103.9),
  Movie(
      id: 4,
      imageName: AppImages.moviePlaceholder,
      title: "Movie 1",
      time: "1h 37m",
      year: "2024",
      genre: "Horror",
      description:
          "Follow the mythic journey of  ho destroyed his family. Facing ",
      IMDBrate: 8.0,
      viewAmount: 103.9),
  Movie(
      id: 5,
      imageName: AppImages.moviePlaceholder,
      title: "Movie 1",
      time: "1h 37m",
      year: "2024",
      genre: "Horror",
      description:
          "Follow the mythic journey of  ho destroyed his family. Facing ",
      IMDBrate: 8.0,
      viewAmount: 103.9),
  Movie(
      id: 6,
      imageName: AppImages.moviePlaceholder,
      title: "Movie 1",
      time: "1h 37m",
      year: "2024",
      genre: "Horror",
      description:
          "Follow the mythic journey of  ho destroyed his family. Facing ",
      IMDBrate: 8.0,
      viewAmount: 103.9),
];
