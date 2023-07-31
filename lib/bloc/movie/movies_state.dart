import 'package:movie_app/data/models/movie.dart';

abstract class MoviesState {}

class MovieInitiate extends MoviesState {
  DataModel get props => DataModel();
}


class MovieInitState extends MoviesState {
  DataModel data;
  MovieInitState({required this.data});

  DataModel get props => this.data;
}
