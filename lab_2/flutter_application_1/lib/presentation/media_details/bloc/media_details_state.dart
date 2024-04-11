import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/content_type_enum.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';

class MediaDetailsState extends Equatable {
  const MediaDetailsState({
    required this.status,
    required this.movie,
    required this.tvShow,
    required this.contentType,
    required this.isFavourite,
    required this.rating,
  });

  factory MediaDetailsState.loading() {
    return MediaDetailsState(
      status: MainStatus.loading,
      movie: MovieItem.empty(),
      tvShow: TVShowItem.empty(),
      contentType: ContentTypeEnum.movies,
      isFavourite: false,
      rating: 0,
    );
  }

  final MainStatus status;
  final MovieItem movie;
  final TVShowItem tvShow;
  final ContentTypeEnum contentType;
  final bool isFavourite;
  final double rating;

  @override
  List<Object> get props => [status, movie, tvShow, movie, contentType, isFavourite, rating];

  MediaDetailsState copyWith({
    MainStatus? status,
    MovieItem? movie,
    TVShowItem? tvShow,
    ContentTypeEnum? contentType,
    bool? isFavourite,
    double? rating,
  }) {
    return MediaDetailsState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      tvShow: tvShow ?? this.tvShow,
      contentType: contentType ?? this.contentType,
      isFavourite: isFavourite ?? this.isFavourite,
      rating: rating ?? this.rating,
    );
  }
}
