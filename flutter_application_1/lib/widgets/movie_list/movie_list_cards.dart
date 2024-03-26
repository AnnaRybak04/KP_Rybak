// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/movie_class.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/resourses/app_color.dart';


class MyCard extends StatefulWidget {
  List<Movie> movies = my_movies;

  MyCard({required Key key, required this.movies}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final _movies = my_movies;

  void _onMovieTap(int index) {
    final _id = my_movies[index].id;
    Navigator.of(context)
        .pushNamed('/main_screen/movie_detais', arguments: _id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _movies.length,
        itemExtent: 220,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              child: Stack(children: [
                 Container(
                    
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Color.fromARGB(91, 71, 69, 69)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(49, 70, 70, 70),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        // const SizedBox(width: 8),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const SizedBox(height: 12),
                                  Text("${movie.title} (${movie.year})",
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Text("${movie.genre}, ${movie.time}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColor.middleGrey)),
                                  const SizedBox(height: 8),

                                  Expanded(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.visibility_outlined,
                                          color: AppColor.iconsGrey,
                                        ),
                                        Text(movie.viewAmount.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColor.iconsGrey)),
                                        const SizedBox(width: 4),
                                        const Icon(
                                          Icons.star_half_outlined,
                                          color:
                                              Color.fromARGB(255, 255, 199, 0),
                                        ),
                                        Text(
                                          movie.IMDBrate.toString(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: AppColor.iconsGrey),
                                        ),
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                icon: Icon(
                                                    Icons.favorite_outline,
                                                    color: AppColor.mainPurple),
                                                onPressed: () {},
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        // const SizedBox(width: 8),
                      ],
                    ),
                  
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(onTap: () => _onMovieTap(index)),
                )
              ]));
        });
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
