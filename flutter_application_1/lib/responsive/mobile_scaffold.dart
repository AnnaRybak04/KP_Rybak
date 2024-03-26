import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_tile.dart';


class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
            //index: _selectedTab,
            children: [
              Column(
                children: [
                  Expanded(
                      child: MyTile(
                    movies: my_movies,
                    key: scaffkey,
                  ))
                ],
              ),
            ]));
  }
}
