class TV {
  final int id;

  final String title;
  final String backDropPath;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final num voteAverage;

  final num popularity;
  final int vote_count;

  TV(
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
}
