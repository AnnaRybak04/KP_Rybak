class TVModel {
  final int id;
  // final String imageName;

  final String title;
  final String backDropPath;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final num voteAverage;

  final num popularity;
  final int vote_count;

  // final String time;
  // final String genre;
  // final String year;
  // final String description;
  // final double IMDBrate;
  // final double viewAmount;

  TVModel(
      {required this.id,
      required this.title,
      required this.backDropPath,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.popularity,
      required this.vote_count});

  factory TVModel.fromJson(Map<String, dynamic> json) {
    return TVModel(
        id: json['id'],
        title: json["name"],
        backDropPath: json["backdrop_path"],
        originalTitle: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["first_air_date"],
        voteAverage: json["vote_average"],
        popularity: json["popularity"],
        vote_count: json["vote_count"]);
  }
}
