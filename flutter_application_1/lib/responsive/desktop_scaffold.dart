import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/movie_model.dart';
import 'package:flutter_application_1/site_layout.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_list_cards.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffkey1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
            child: Container(
                // color: Colors.pinkAccent,
                ),
          ),
          Expanded(
            flex: 5,
            child:
                //  Container(
                //   decoration: const BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.all(Radius.circular(10)),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Color.fromARGB(49, 70, 70, 70),
                //       ),
                //     ],
                //   ),
                SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Тренди",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 6, 9, 27),
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 20),child:
                  SizedBox(
                    height: 440,
                    width: double.infinity,
                    child: FutureBuilder(
                      future: trendingMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          print(snapshot.data);
                          return MyCard(
                            key: scaffkey,
                            snapshot: snapshot,
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),),
                  // Container(
                  //   height: 420, // Змініть висоту, якщо потрібно
                  //   child: MyCard(
                  //     movies: my_movies,
                  //     key: scaffkey,
                  //   ),
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Найвищий рейтинг",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 6, 9, 27),
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 440,
                      width: double.infinity,
                      child: FutureBuilder(
                        future: topRatedMovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.hasData) {
                            print(snapshot.data);
                            return MyCard(
                              key: scaffkey1,
                              snapshot: snapshot,
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 420, // Змініть висоту, якщо потрібно
                  //   child: MyCard(
                  //     movies: my_movies,
                  //     key: scaffkey1,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
                // color: Colors.pinkAccent,
                ),
          ),
        ],
      ),
    );
  }
}
