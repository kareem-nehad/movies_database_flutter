import 'package:dio/dio.dart';
import 'package:movies_database_flutter/core/error/exception.dart';
import 'package:movies_database_flutter/core/network/error_message_model.dart';
import 'package:movies_database_flutter/core/utilities/app_constants.dart';
import 'package:movies_database_flutter/features/movies/data/models/movie_model.dart';

abstract class BaseMovieDataSource {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> searchPopularMovies(String query);
}

class MovieDataSource extends BaseMovieDataSource {
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final dio = Dio();
    final response = await dio.get('${AppConstants.baseUrl}${AppConstants.popularMoviesEndPoint}?api_key=${AppConstants.apiKey}');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> searchPopularMovies(String query) async {
    final dio = Dio();
    final response = await dio.get('${AppConstants.baseUrl}/search/movie?api_key=${AppConstants.apiKey}&query=$query');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
