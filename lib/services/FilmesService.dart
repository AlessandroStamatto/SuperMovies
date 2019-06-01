import 'dart:convert';
import 'package:super_movies/models/Filme.dart';
import 'package:http/http.dart' as http;

class FilmesService {
  static Future<List<Filme>> getFilmes() async {
    final url = 'https://api.themoviedb.org/3/movie/popular?api_key=9ac4466dcf069ac63db44c560c9e8731&language=pt-BR';

    final response = await http.get(url);
    final results = json.decode(response.body)['results'];
    final filmes = results.map<Filme>((json) => Filme.fromJson(json)).toList();

    return filmes;
  }

  static Future<List<Filme>> getFavoritos() async {
    final url = 'https://api.themoviedb.org/3/movie/popular?api_key=9ac4466dcf069ac63db44c560c9e8731&language=pt-BR';

    final response = await http.get(url);
    final results = json.decode(response.body)['results'];
    final filmes = results.map<Filme>((json) => Filme.fromJson(json)).toList();

    return filmes;
  }
}