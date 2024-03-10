import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/theme/app_color.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MovieListWidget(),
    Text("10"),
    Text("20"),
    Text("30"),
  ];

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Center(child: 
          Text("MovieTime", style: TextStyle(fontWeight: FontWeight.w900),)),
        actions: [Icon(null)],
      ),
      body:  Center(child: _widgetOptions[_selectedTab],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
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
        onTap: onSelectedTab,
      ),
    );
  }
}
