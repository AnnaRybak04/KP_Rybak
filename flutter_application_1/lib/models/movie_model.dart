class MovieModel {
  final int id;
  // final String imageName;

  final String title;
  final String backDropPath;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final num voteAverage;
  final List<dynamic> genre_ids;
  final num popularity;
  final int vote_count;

  // final String time;
  // final String genre;
  // final String year;
  // final String description;
  // final double IMDBrate;
  // final double viewAmount;

  MovieModel(
      {required this.id,
      required this.title,
      required this.backDropPath,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.genre_ids,
      required this.popularity,
      required this.vote_count});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        title: json["title"] ,
        backDropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"],
        genre_ids: json["genre_ids"],
        popularity: json["popularity"],
        vote_count: json["vote_count"]
        );
  }

  
}
