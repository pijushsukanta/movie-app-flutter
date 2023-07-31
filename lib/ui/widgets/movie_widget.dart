import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/resources/style.dart';

class MovieWidget extends StatelessWidget {
  Movies movie;
  MovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5, bottom: 5),
      child: Container(
        height: height * .19,
        decoration: BoxDecoration(
            border: Border.all(width: .1),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, right: 10, top: 5, bottom: 5),
          child: Row(
            children: [
              Container(
                width: (width - 30) * .30,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: movie.posterUrl!,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              
              Container(
                padding: EdgeInsets.only(left: 10),
                width: (width - 80) * .70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title!,
                      style: getBoldStyle(color: Colors.black),
                    ),
                    Text(
                      "Year: ${movie.year!}",
                      style: getLightStyle(color: Colors.black),
                    ),
                    Text(
                      "Director: \n${movie.director!}",
                      style: getLightStyle(color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
