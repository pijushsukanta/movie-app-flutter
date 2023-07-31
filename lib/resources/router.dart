import 'package:flutter/material.dart';

class Routes{
  static const String home = '/';
  static const String movieDetails = '/movieDetails';


  static routePageAndClearStack(context,Widget page){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> page), (r){
      return false;
    });
  }

  static routePage(context,Widget page){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> page));
  }
}