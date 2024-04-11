import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/classes/movie_class.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/movie_model.dart';
import 'package:flutter_application_1/theme/app_color.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_details.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_tile.dart';

class SearchWidget extends SearchDelegate {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey();
  final Future<List<MovieModel>> moviesFuture;

  SearchWidget(this.moviesFuture) : super(searchFieldLabel: "Пошук");

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
    return FutureBuilder<List<MovieModel>>(
      future: moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Помилка: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Результатів не знайдено'));
        } else {
          return MyTile(key: scaffkey, snapshot: snapshot);
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Помилка: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Результатів не знайдено'));
        } else {
          return MyTile(key: scaffkey, snapshot: snapshot);
        }
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        color: Colors.white,
        iconTheme: const IconThemeData(
          color: AppColor.mainPurple,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
        focusColor: AppColor.mainPurple,
        filled: true,
        fillColor: Colors.white,
        prefixIconColor: AppColor.mainPurple,
      ),
    );
  }
}
