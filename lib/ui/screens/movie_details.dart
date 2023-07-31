import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/resources/router.dart';
import 'package:movie_app/resources/style.dart';
import 'package:movie_app/ui/screens/movie_screen.dart';
import 'package:movie_app/ui/widgets/genre_widget.dart';

class MovieDetails extends StatelessWidget {
  Movies? movie;

  MovieDetails({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          // Custom logic here if needed (e.g., showing a confirmation dialog)
          // If you want to allow the back navigation, return true, otherwise return false.
          Routes.routePage(context, MovieScreen());
          return false;
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  movie!.posterUrl!,
                )),
          ),
          child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  height: height * .50,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 35,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: movie!.genres!.length,
                                itemBuilder: (context, position) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: GenreWidget(
                                      genre: movie!.genres![position],genres: movie!.genres!, position: -1,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            movie!.title!,
                            style: getMediumStyle(
                                color: Colors.black, fontSize: 24),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Year: ${movie!.year}",
                            style: getLightStyle(
                                color: Colors.black, fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Director: ",
                            style: getMediumStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            movie!.director!,
                            style: getLightStyle(
                                color: Colors.black, fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Actors: ",
                            style: getMediumStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            movie!.actors!,
                            style: getLightStyle(
                                color: Colors.black, fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Plot: ",
                            style: getMediumStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            movie!.plot!,
                            style: getLightStyle(
                                color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
