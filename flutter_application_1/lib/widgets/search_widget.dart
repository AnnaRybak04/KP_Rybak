import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/movie_class.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/theme/app_color.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_tile.dart';

class SearchWidget extends SearchDelegate {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey();

  List<Movie> movies = my_movies;
  SearchWidget() : super(searchFieldLabel: "Пошук");
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Movie> matchQuery = [];
    for (var item in movies) {
      if (item.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return MyTile(key: scaffkey, movies: matchQuery);

    // return ListView.builder(
    //     itemCount: matchQuery.length,
    //     itemBuilder: (context, index) {
    //       var result = matchQuery[index];
    //       return ListTile(
    //         title: Text(result),
    //       );
    //     });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Movie> matchQuery = [];
    for (var item in movies) {
      if (item.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return MyTile(key: scaffkey, movies: matchQuery);

    // ListView.builder(
    //     itemCount: matchQuery.length,
    //     itemBuilder: (context, index) {
    //       var result = matchQuery[index];
    //       return Column(children: [
    //         ListTile(
    //           contentPadding:
    //               const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
    //           title: Text(result),
    //         ),
    //         if (index < matchQuery.length - 1) Divider(),
    //       ]);
    //     });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        color: Colors.white, // Колір вашого AppBar
        iconTheme: const IconThemeData(
          color: AppColor.mainPurple,
        ),
        // Колір іконок
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey), // Колір підказки
        focusColor: AppColor.mainPurple,
        filled: true,
        fillColor: Colors.white, // Колір фону
        prefixIconColor: AppColor.mainPurple,

        // Колір іконки пошуку
      ),
    );
  }
}


// class SearchWidget extends StatelessWidget {
//   const SearchWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: TextField(
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 labelText: 'Пошук',
//                 border: OutlineInputBorder(),
//                 filled: true,
//                 fillColor: Colors.white),
//           ),
//         )
//       ],
//     );
//   }
// }