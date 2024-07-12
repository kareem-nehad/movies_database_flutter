import 'package:equatable/equatable.dart';
import 'package:movies_database_flutter/core/utilities/enums.dart';
import 'package:movies_database_flutter/features/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<Movie> allMovies;
  final SearchState searchState;
  final String searchMessage;

  const MoviesState({
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.allMovies = const [],
    this.searchState = SearchState.awaiting,
    this.searchMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? allMovies,
    SearchState? searchState,
    String? searchMessage,
  }) {
    return MoviesState(
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      allMovies: allMovies ?? this.allMovies,
      searchState: searchState ?? this.searchState,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object> get props => [popularMovies, popularState, popularMessage, allMovies, searchState, searchMessage,];
}
