import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/site_layout.dart';
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
                      child: SizedBox(
                      height: 440,
                      width: double.infinity,
                      child: FutureBuilder(
                        future: allMovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.hasData) {
                            print(snapshot.data);
                            return MyTile(
                              key: scaffkey,
                              snapshot: snapshot
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ]));
  }
}
