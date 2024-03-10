import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_color.dart';
import 'package:flutter_application_1/widgets/main_screen/main_screen_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MovieTime",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.mainPurple,
          foregroundColor: Colors.white
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor:Colors.white,
          selectedItemColor: AppColor.mainPurple,
          unselectedItemColor: Color.fromARGB(255, 121, 121, 121),
        )
      ),
      home: MainScreenWidget(),

    );
  }
}
