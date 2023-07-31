import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movies_state.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/repository/movie_repo.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MovieRepository? repository;
  DataModel? data;
  DataModel dataByGenre = DataModel();
  MoviesCubit({this.repository}) : super(MovieInitiate());

  void getMovies() async {
    try {
      data = await repository?.getMovies();
      if (data == null){
        emit(MovieInitiate());
      } else {
        emit(MovieInitState(data: data!));
      }
    } on Exception catch (e) {
      emit(MovieInitiate());
    }
  }

  void getMovieByGenre(String genre) {
    emit(MovieInitiate());
    List<Movies> movies = [];
    dataByGenre.genres = data!.genres;
    data?.movies?.forEach((e) {
      if (e.genres!.contains(genre)) {
        movies.add(e);
      }
    });
    dataByGenre.movies = movies; 
    
    emit(MovieInitState(data: dataByGenre));
  }
}
