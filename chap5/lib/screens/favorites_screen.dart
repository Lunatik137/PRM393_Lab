import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_movies_provider.dart';
import '../widgets/movie_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: Consumer<FavoriteMoviesProvider>(
        builder: (context, provider, child) {
          if (provider.favorites.isEmpty) {
            return const Center(
              child: Text('No favorites yet.'),
            );
          }
          return ListView.builder(
            itemCount: provider.favorites.length,
            itemBuilder: (context, index) {
              return MovieCard(movie: provider.favorites[index]);
            },
          );
        },
      ),
    );
  }
}
