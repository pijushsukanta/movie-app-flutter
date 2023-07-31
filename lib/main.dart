import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movies_cubit.dart';
import 'package:movie_app/repository/movie_repo.dart';
import 'package:movie_app/resources/theme.dart';
import 'package:movie_app/ui/screens/movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> MoviesCubit(repository: MovieRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ez Message',
        theme: getApplicationTheme(),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: MovieScreen(),

      ),
    );
  }
}
