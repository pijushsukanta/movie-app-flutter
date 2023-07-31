import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/resources/style.dart';

class GenreWidget extends StatelessWidget {
  String genre;
  List<String> genres;
  int position;
  GenreWidget({super.key, required this.genre, required this.genres, required this.position});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 20,
        padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: position == -1 ? Colors.white : genres[position] == genre ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          genre,
          style: getMediumStyle(color: position == -1 ? Colors.black : genres[position] == genre ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}
