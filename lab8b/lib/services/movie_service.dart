import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  // Using TVmaze API which doesn't require keys and is more reliable against regional blocks
  static const String _baseUrl = 'https://api.tvmaze.com';

  Future<List<Movie>> fetchTrendingMovies() async {
    // Search for highly rated/popular shows as "trending"
    final url = Uri.parse('$_baseUrl/search/shows?q=top');

    try {
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'User-Agent': 'MovieExplorer/1.0',
        },
      ).timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Server Error: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Network error. Please check your internet connection.');
    } on http.ClientException catch (e) {
      throw Exception('Connection error: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
