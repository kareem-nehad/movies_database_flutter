import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'service_locator.config.dart';
import 'package:movies_database_flutter/features/movies/data/repositories/movies_repository.dart';
import 'package:movies_database_flutter/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_database_flutter/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_database_flutter/features/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_database_flutter/features/movies/data/source/data_source.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
