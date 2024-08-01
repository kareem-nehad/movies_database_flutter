import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_database_flutter/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_database_flutter/core/error/failure.dart';
import 'package:movies_database_flutter/features/movies/domain/entities/movie.dart';

@lazySingleton
class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }

  Future<Either<Failure, List<Movie>>> executeSearch(String query) async {
    return await baseMoviesRepository.searchPopularMovies(query);
  }
}