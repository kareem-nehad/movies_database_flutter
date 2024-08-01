// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/movies/data/repositories/movies_repository.dart'
    as _i277;
import '../../features/movies/data/source/data_source.dart' as _i850;
import '../../features/movies/domain/repositories/base_movies_repository.dart'
    as _i795;
import '../../features/movies/domain/usecases/get_popular_movies.dart' as _i995;
import '../../features/movies/presentation/controller/movies_bloc.dart' as _i9;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i850.BaseMovieDataSource>(() => _i850.MovieDataSource());
    gh.lazySingleton<_i795.BaseMoviesRepository>(() => _i277.MoviesRepository(
        baseMovieRemoteDataSource: gh<_i850.BaseMovieDataSource>()));
    gh.lazySingleton<_i995.GetPopularMoviesUseCase>(
        () => _i995.GetPopularMoviesUseCase(gh<_i795.BaseMoviesRepository>()));
    gh.factory<_i9.MoviesBloc>(
        () => _i9.MoviesBloc(gh<_i995.GetPopularMoviesUseCase>()));
    return this;
  }
}
