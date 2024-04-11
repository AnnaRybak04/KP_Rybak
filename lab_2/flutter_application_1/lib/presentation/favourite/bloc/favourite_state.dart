import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    required this.status,
    required this.errorMessage,
    required this.movies,
    required this.tvShows,
  });

  factory FavoriteState.loading() {
    return const FavoriteState(
      status: MainStatus.loading,
      errorMessage: '',
      movies: [],
      tvShows: [],
    );
  }

  final MainStatus status;
  final String errorMessage;
  final List<MovieItem> movies;
  final List<TVShowItem> tvShows;

  @override
  List<Object> get props => [status, errorMessage, movies, tvShows];

  FavoriteState copyWith({
    MainStatus? status,
    String? errorMessage,
    List<MovieItem>? movies,
    List<TVShowItem>? tvShows,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      movies: movies ?? this.movies,
      tvShows: tvShows ?? this.tvShows,
    );
  }
}
