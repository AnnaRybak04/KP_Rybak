// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/classes/movie_class.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/resourses/app_color.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_details.dart';

class MediaGrid extends StatefulWidget {
  // List<Movie> movies = my_movies;
  final AsyncSnapshot snapshot;
  MediaGrid({required Key key, required this.snapshot}) : super(key: key);

  @override
  _MediaGridState createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
 // final _movies = my_movies;

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
    print("111");
    print(widget.snapshot.data.length);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2 / 3, // Adjust this ratio as per your preference
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: widget.snapshot.data.length,
      
      itemBuilder: (context, index) {
        final movie = widget.snapshot.data[index];
        return Padding(
          padding: EdgeInsets.all(2),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                      SizedBox(
                        height: 300,
                        width: 220,
                        child: Image.network(
                          '${Api.imagePath}${movie.posterPath}',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                                          "${movie.title} (${movie.releaseDate.split('-')[0]})",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "${my_movies[0].genre}, ${my_movies[0].time}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.middleGrey,
                                ),
                              ),
                              // SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.visibility_outlined,
                                    color: AppColor.iconsGrey,
                                  ),
                                  Text(
                                    movie.popularity.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.iconsGrey,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.star_half_outlined,
                                    color: Color.fromARGB(255, 255, 199, 0),
                                  ),
                                  Text(
                                    movie.voteAverage.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.iconsGrey,
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: Container(
                                  //     alignment: Alignment.centerRight,
                                  //     child: IconButton(
                                  //       icon: Icon(
                                  //         Icons.favorite_outline,
                                  //         color: AppColor.mainPurple,
                                  //       ),
                                  //       onPressed: () {},
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _onMovieTap(index),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
