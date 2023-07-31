import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiRequest {
  static Uri baseUrl = Uri.parse(
      "https://raw.githubusercontent.com/erik-sytnyk/movies-list/master/db.json");

  static get() async {
    try {
      var response = await http
          .get(baseUrl)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        return http.Response("Server Timeout", 500);
      });
      // log("${jsonDecode(response.body)}");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      }
      else{
        return http.Response("Error", 401);
      }
      
    } on Exception catch (e) {
      return http.Response("$e", 402);
    }
  }
}
