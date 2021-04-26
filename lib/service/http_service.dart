import 'dart:convert';
import 'dart:io';
import 'package:flutter_minggu9/models/movie.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = 'b822d8c7909015bfd75408bc0ff78bfa';
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=b822d8c7909015bfd75408bc0ff78bfa&language=en-US';

  Future<List> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}
