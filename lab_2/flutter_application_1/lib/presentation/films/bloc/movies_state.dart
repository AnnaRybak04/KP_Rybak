import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MoviesState extends Equatable {
  const MoviesState({
    required this.status,
    required this.errorMessage,
    required this.moviesPagingController,
  });

  factory MoviesState.loading() {
    return MoviesState(
      status: MainStatus.loading,
      errorMessage: '',
      moviesPagingController: PagingController(firstPageKey: 1),
    );
  }

  final MainStatus status;
  final String errorMessage;
  final PagingController<int, MovieItem> moviesPagingController;

  @override
  List<Object> get props => [
        status,
        errorMessage,
        moviesPagingController,
      ];

  MoviesState copyWith({
    MainStatus? status,
    String? errorMessage,
    PagingController<int, MovieItem>? moviesPagingController,
  }) {
    return MoviesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      moviesPagingController: moviesPagingController ?? this.moviesPagingController,
    );
  }
}
