import 'package:equatable/equatable.dart';

import 'movie.dart';

class MovieDetailsArgs extends Equatable {
  final Movie movie;
  final List<Movie> otherPopularMovies;

  const MovieDetailsArgs(this.movie, this.otherPopularMovies);

  @override
  List<Object> get props => [movie, otherPopularMovies];
}