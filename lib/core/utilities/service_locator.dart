import 'package:get_it/get_it.dart';
import 'package:movies_database_flutter/features/movies/data/repositories/movies_repository.dart';
import 'package:movies_database_flutter/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_database_flutter/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_database_flutter/features/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_database_flutter/features/movies/data/source/data_source.dart';

mixin ServiceLocator {
  static final instance = GetIt.instance;

  static Future<void> init() async {
    // Blocs
    instance.registerFactory(() => MoviesBloc(instance()));

    // Cubits

    // Usecases
    instance.registerLazySingleton(() => GetPopularMoviesUseCase(instance()));

    // Repositories
    instance.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(baseMovieRemoteDataSource: instance()));

    // Data Sources
    instance.registerLazySingleton<BaseMovieDataSource>(() => MovieDataSource());

  }
}