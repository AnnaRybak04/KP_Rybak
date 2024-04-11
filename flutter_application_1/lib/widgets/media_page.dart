import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/movie_model.dart';
import 'package:flutter_application_1/site_layout.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_list_cards.dart';
import 'package:flutter_application_1/widgets/media_grid.dart';

class MediaPage extends StatefulWidget {
  final String type_of_content;
  const MediaPage({Key? key, required this.type_of_content}) : super(key: key);

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffkey1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigationBar(context, scaffkey1),
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
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(187, 0, 0, 0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text("Назад")
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Популярне: ${widget.type_of_content == 'movies' ? 'Фільми' : widget.type_of_content == 'tv_shows' ? 'Серіали' : 'Інше'}",
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
                      height: 800,
                      width: double.infinity,
                      child: FutureBuilder(
                        future: widget.type_of_content == 'movies'
                            ? allMovies
                            : widget.type_of_content == 'tv_shows'
                                ? allTVShows
                                : allMovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            print("-----------");
                            print(snapshot);
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.hasData) {
                            return MediaGrid(
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
                    ),
                  ),
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
