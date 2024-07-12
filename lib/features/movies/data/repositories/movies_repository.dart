import 'package:dartz/dartz.dart';
import 'package:movies_database_flutter/core/error/exception.dart';
import 'package:movies_database_flutter/core/error/failure.dart';
import 'package:movies_database_flutter/features/movies/domain/entities/movie.dart';
import 'package:movies_database_flutter/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_database_flutter/features/movies/data/source/data_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieDataSource baseMovieRemoteDataSource;

  MoviesRepository({
    required this.baseMovieRemoteDataSource,
  });


  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchPopularMovies(String query) async {
    final result = await baseMovieRemoteDataSource.searchPopularMovies(query);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
