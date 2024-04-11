// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/classes/movie_class.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/resourses/app_color.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_details.dart';

class MyCard extends StatefulWidget {
  // List<Movie> movies = my_movies;
  final AsyncSnapshot snapshot;
  MyCard({required Key key, required this.snapshot}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final _movies = my_movies;

  void _onMovieTap(int index) {
    print('!!!!!!!!!!!');
    print(widget.snapshot.data[index]);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MovieDetailsWidget(movie: widget.snapshot.data[index])));
    // Navigator.of(context).pushNamed('/main_screen/movie_detais',
    //     arguments: widget.snapshot.data[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemExtent: 240,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return Padding(
              padding: EdgeInsets.all(10),
              child: Stack(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
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
                        child: Column(children: [
                          SizedBox(
                              height: 310,
                              width: 220,
                              child: Image.network(
                                '${Api.imagePath}${widget.snapshot.data[index].posterPath}',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              )),
                          // Image(image: AssetImage(movie.imageName)),
                          // const SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      maxLines: 1,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "${widget.snapshot.data[index].title} (${widget.snapshot.data[index].releaseDate.split('-')[0]})",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // const SizedBox(height: 12),

                                    // ignore: prefer_const_constructors

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
                                          Text(
                                              widget.snapshot.data[index]
                                                  .popularity
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColor.iconsGrey)),
                                          const SizedBox(width: 4),
                                          const Icon(
                                            Icons.star_half_outlined,
                                            color: Color.fromARGB(
                                                255, 255, 199, 0),
                                          ),
                                          Text(
                                            widget.snapshot.data[index]
                                                .voteAverage
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: AppColor.iconsGrey),
                                          ),
                                          Expanded(
                                            child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: IconButton(
                                                  icon: Icon(
                                                      Icons.favorite_outline,
                                                      color:
                                                          AppColor.mainPurple),
                                                  onPressed: () {},
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ]))),
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
