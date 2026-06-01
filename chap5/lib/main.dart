import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/sample_data.dart';
import 'providers/favorite_movies_provider.dart';
import 'screens/home_screen.dart';
import 'screens/movie_detail_screen.dart';
import 'screens/error_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteMoviesProvider(),
      child: const MovieApp(),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomeScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == null) return null;

        final uri = Uri.parse(settings.name!);
        int? movieId;

        // Handle /movie/{id} (standard named route)
        if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'movie') {
          movieId = int.tryParse(uri.pathSegments[1]);
        }
        // Handle movieapp://movie/{id} (deep link)
        else if (uri.scheme == 'movieapp' &&
            uri.host == 'movie' &&
            uri.pathSegments.isNotEmpty) {
          movieId = int.tryParse(uri.pathSegments[0]);
        }

        if (movieId != null) {
          try {
            final movie = sampleMovies.firstWhere((m) => m.id == movieId);
            return MaterialPageRoute(
              builder: (context) => MovieDetailScreen(movie: movie),
            );
          } catch (e) {
            return MaterialPageRoute(
              builder: (context) => const ErrorScreen(message: 'Movie not found'),
            );
          }
        }

        return null;
      },
    );
  }
}
