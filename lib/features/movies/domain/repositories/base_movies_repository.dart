import 'package:dartz/dartz.dart';
import 'package:movies_database_flutter/core/error/failure.dart';
import 'package:movies_database_flutter/features/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> searchPopularMovies(String query);
}