import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies_database_flutter/core/utilities/enums.dart';
import 'package:movies_database_flutter/features/movies/domain/usecases/get_popular_movies.dart';

import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPopularMoviesUseCase getPopularUseCase;

  MoviesBloc(this.getPopularUseCase) : super(const MoviesState()) {
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<SearchPopularMoviesEvent>(_searchPopularMovies);
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularUseCase.execute();
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _searchPopularMovies(SearchPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(searchState: SearchState.loading));
    final result = await getPopularUseCase.executeSearch(event.query);
    result.fold(
          (l) => emit(
        state.copyWith(
          searchState: SearchState.error,
          searchMessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(
          allMovies: r,
          searchState: SearchState.loaded,
        ),
      ),
    );
  }
}
