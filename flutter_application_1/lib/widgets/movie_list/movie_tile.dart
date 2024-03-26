import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/movie_class.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/resourses/app_color.dart';


class MyTile extends StatefulWidget {
  List<Movie> movies = my_movies;

  MyTile({required Key key, required this.movies}) : super(key: key);

  @override
  _MyTileState createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  void _onMovieTap(int index) {
    final _id = my_movies[index].id;
    Navigator.of(context)
        .pushNamed('/main_screen/movie_detais', arguments: _id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: widget.movies.length,
            itemExtent: 160,
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                  child: Stack(children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(color: Color.fromARGB(91, 71, 69, 69)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(49, 70, 70, 70),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          children: [
                            Image(image: AssetImage(movie.imageName)),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12),
                                Text("${movie.title} (${movie.year})",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Text("${movie.genre}, ${movie.time}",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColor.middleGrey)),
                                const SizedBox(height: 8),
                                Text(movie.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColor.lightGrey)),
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.visibility_outlined,
                                        color: AppColor.iconsGrey,
                                      ),
                                      Text(movie.viewAmount.toString(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: AppColor.iconsGrey)),
                                      const SizedBox(width: 4),
                                      const Icon(
                                        Icons.star_half_outlined,
                                        color: Color.fromARGB(255, 255, 199, 0),
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
                                            child: const Icon(
                                              Icons.favorite_outline,
                                              color: AppColor.mainPurple,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(onTap: () => _onMovieTap(index)),
                    )
                  ]));
            })
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
