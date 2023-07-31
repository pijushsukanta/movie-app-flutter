import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movies_cubit.dart';
import 'package:movie_app/bloc/movie/movies_state.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movie_app/resources/router.dart';
import 'package:movie_app/ui/screens/movie_details.dart';
import 'package:movie_app/ui/widgets/genre_widget.dart';
import 'package:movie_app/ui/widgets/movie_widget.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int _position = -1;

  @override
  void initState() {
    context.read<MoviesCubit>().getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("MovieOnline"),
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(color: Colors.black, Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MovieInitiate) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MovieInitState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data.genres?.length,
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        onTap: () {
                          _position = position;
                          context
                              .read<MoviesCubit>()
                              .getMovieByGenre(state.data.genres![position]);
                        },
                        child: GenreWidget(
                          genre: state.data.genres![position],genres: state.data.genres!,position: _position
                        ),
                      );
                    },
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.only(left : 15, top: 10),
                  height: 40,
                  child: Text("${state.data.movies?.length} ${_position != -1 ? state.data.genres![_position] : ""} movies"),
                ),
                Expanded(
                  child: Container(
                    child: LazyLoadScrollView(
                      onEndOfPage: () => () {},
                      child: ListView.builder(
                        itemCount: state.data.movies!.length,
                        itemBuilder: (context, position) {
                          return GestureDetector(
                            onTap: () {
                              Routes.routePage(
                                  context,
                                  MovieDetails(
                                    movie: state.data.movies![position],
                                  ));
                            },
                            child: MovieWidget(
                              movie: state.data.movies![position],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
