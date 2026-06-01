import 'package:flutter/material.dart';
import '../models/movie.dart';

class FavoriteMoviesProvider with ChangeNotifier {
  final List<Movie> _favorites = [];

  List<Movie> get favorites => List.unmodifiable(_favorites);

  void addFavorite(Movie movie) {
    if (!_favorites.any((m) => m.id == movie.id)) {
      _favorites.add(movie);
      notifyListeners();
    }
  }

  void removeFavorite(int movieId) {
    _favorites.removeWhere((m) => m.id == movieId);
    notifyListeners();
  }

  void toggleFavorite(Movie movie) {
    if (isFavorite(movie.id)) {
      removeFavorite(movie.id);
    } else {
      addFavorite(movie);
    }
  }

  bool isFavorite(int movieId) {
    return _favorites.any((m) => m.id == movieId);
  }
}
