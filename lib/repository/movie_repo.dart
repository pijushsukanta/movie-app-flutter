import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/remote/network.dart';

class MovieRepository {
  Future<DataModel> getMovies() async {
    Response response = await ApiRequest.get();
    print(response.statusCode);
    DataModel data = DataModel.fromJson(jsonDecode(response.body));

    return data;
  }
}
