import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMoviesEvent extends MoviesEvent {}
class SearchPopularMoviesEvent extends MoviesEvent {
  final String query;

  const SearchPopularMoviesEvent(this.query);
}