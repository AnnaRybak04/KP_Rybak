

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String genre;
  final String year;
  final String description;
  final double IMDBrate;
  final double viewAmount;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.year,
    required this.genre,
    required this.description,
    required this.IMDBrate,
    required this.viewAmount,
  });
}
