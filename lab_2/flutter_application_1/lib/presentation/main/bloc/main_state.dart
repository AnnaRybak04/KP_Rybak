import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';

class MainState extends Equatable {
  const MainState({
    required this.status,
    required this.errorMessage,
    required this.trandingMovies,
    required this.popularMovies,
    required this.allMovies,
    required this.favouriteMovies,
  });

  factory MainState.loading() {
    return const MainState(
      status: MainStatus.loading,
      errorMessage: '',
      trandingMovies: [],
      popularMovies: [],
      allMovies: [],
      favouriteMovies: [],
    );
  }

  final MainStatus status;
  final String errorMessage;
  final List<MovieItem> trandingMovies;
  final List<MovieItem> popularMovies;
  final List<MovieItem> allMovies;
  final List<MovieItem> favouriteMovies;

  @override
  List<Object> get props => [status, errorMessage, trandingMovies, popularMovies, allMovies, favouriteMovies];

  MainState copyWith({
    MainStatus? status,
    String? errorMessage,
    List<MovieItem>? trandingMovies,
    List<MovieItem>? popularMovies,
    List<MovieItem>? allMovies,
    List<MovieItem>? favouriteMovies,
  }) {
    return MainState(
      status: status ?? this.status,
      trandingMovies: trandingMovies ?? this.trandingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      allMovies: allMovies ?? this.allMovies,
      favouriteMovies: favouriteMovies ?? this.favouriteMovies,
      errorMessage: errorMessage ?? '',
    );
  }
}
