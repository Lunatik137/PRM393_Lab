import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/sample_data.dart';
import '../widgets/movie_card.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Simulate deep link: movieapp://movie/1
                Navigator.pushNamed(context, 'movieapp://movie/1');
              },
              child: const Text('Open Movie #1 via Deep Link'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sampleMovies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: sampleMovies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
