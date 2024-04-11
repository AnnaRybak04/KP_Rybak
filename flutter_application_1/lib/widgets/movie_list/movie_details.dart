import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/classes/movie_class.dart';
import 'package:flutter_application_1/models/movie_model.dart';
import 'package:flutter_application_1/resourses/app_images.dart';
import 'package:flutter_application_1/responsive/responsive_layout.dart';
import 'package:flutter_application_1/theme/app_color.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

// class MovieDetailsWidget extends StatefulWidget {
//   final MovieModel movie;

//   const MovieDetailsWidget({super.key, required this.movie});

//   @override
//   State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
// }

class MovieDetailsWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffkey1 = GlobalKey();
  final GlobalKey<ScaffoldState> scaffkey2 = GlobalKey();

  MovieDetailsWidget({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: !ResponsiveLayout.isDesktopScreen(context)
            ? AppBar(
                backgroundColor: AppColor.mainPurple,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: const Center(
                    child: Text(
                  "Деталі фільму",
                  style: TextStyle(color: Colors.white),
                )),
                actions: [
                  Container(
                    width: 40,
                  )
                ],
              )
            : topNavigationBar(context, scaffkey),
        body: !ResponsiveLayout.isDesktopScreen(context)
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  // mainAxisSize: MainAxisSize.min,

                  // clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 760,
                      height: 300,
                      child: Image.network(
                        '${Api.imagePath}${movie.backDropPath}',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Positioned(
                    //   top: 240,
                    //   left: 0,
                    //   right: 0,
                    //   child: Container(
                    //     decoration: const BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(30),
                    //         topRight: Radius.circular(30),
                    //       ),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Color.fromARGB(49, 70, 70, 70),
                    //           blurRadius: 15,
                    //         ),
                    //       ],
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.all(32),
                    //       child:
                    //        Column(
                    //         children: [
                    Padding(
                      padding: EdgeInsets.all(32),
                      child: MovieDetailsInfoWidget(
                        movie: movie,
                        key: scaffkey1,
                      ),
                    )

                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                )))
            : Container(
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 180, right: 180, top: 20),
                    child: Column(children: [
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
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(children: [
                        Expanded(
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  // border: Border.all(color: Color.fromARGB(91, 71, 69, 69)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(49, 70, 70, 70),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Row(children: [
                                  Column(children: [
                                    SizedBox(
                                      height: 400,
                                      child: Image.network(
                                        '${Api.imagePath}${movie.posterPath}',
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ]),
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 12),
                                                MovieDetailsInfoWidget(
                                                    movie: movie,
                                                    key: scaffkey2),
                                                SizedBox(height: 12),
                                                // UserRating()
                                              ])))
                                ])))
                      ])
                    ]))));
  }
}

class MovieDetailsInfoWidget extends StatelessWidget {
  MovieDetailsInfoWidget({Key? key, required this.movie}) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                maxLines: 3,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: movie.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
              ),
              // !ResponsiveLayout.isDesktopScreen(context)
              //     ? InkWell(
              //         onTap: () {},
              //         child: Icon(
              //           Icons.favorite_border,
              //           color: AppColor.mainPurple,
              //           size: 40,
              //         ),
              //       )
              //    : Container(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Рейтинг: ",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.star_half_outlined,
                color: Color.fromARGB(255, 255, 199, 0),
              ),
              Text(
                "${movie.voteAverage.toString()}/10",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 24),
              Text(
                "Перегляди: ",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.visibility_outlined,
                color: AppColor.iconsGrey,
              ),
              Text(
                movie.popularity.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            maxLines: 1,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Режисер: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: "Ім'я режисера",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            maxLines: 1,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Жанр: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: "Жанр 1/Жанр 2",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            maxLines: 1,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Опис: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: movie.overview,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            maxLines: 1,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Актори: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            maxLines: 1,
            text: const TextSpan(
              children: [
                TextSpan(
                  text:
                      "опис опис опис описопис описопис описопис описопис описопис описопис описопис описопис описопис описопис описопис описопис описопис описопис описопис описопис описопис описопис опис",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            maxLines: 1,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Мій рейтинг: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(width: 300,
            child: Column(children: [
              UserRating(), FavButton()
            ],),),
          )
          
        ],
      ),
    );
  }
}

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      )),
      child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 58, vertical: 12),
          child: Row(
            children: [
              Icon(Icons.favorite_border_outlined),
              SizedBox(
                width: 8,
              ),
              Text(
                'Зберегти"',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}

class UserRating extends StatefulWidget {
  const UserRating({super.key});

  @override
  State<UserRating> createState() => _UserRatingState();
}

class _UserRatingState extends State<UserRating> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        icon: const Icon(Icons.star_border),
        iconSize: 40,
        onPressed: () {},
      ),
      IconButton(
          icon: const Icon(Icons.star_border), iconSize: 40, onPressed: () {}),
      IconButton(
          icon: const Icon(Icons.star_border), iconSize: 40, onPressed: () {}),
      IconButton(
          icon: const Icon(Icons.star_border), iconSize: 40, onPressed: () {}),
      IconButton(
          icon: const Icon(Icons.star_border), iconSize: 40, onPressed: () {}),
    ]);
  }
}
