import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_tile.dart';



class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
     // drawer: MyDrawer(),
      body: Column(
        children: [
          Expanded(
              child: MyTile(movies: my_movies, key: scaffkey,))
                  
        ],
      ),
    );
  }
}
