import 'package:flutter/material.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // New movie data
    final movies = [
      {
        'title': 'Interstellar',
        'year': '2014',
        'emoji': '🚀',
      },
      {
        'title': 'Avengers: Endgame',
        'year': '2019',
        'emoji': '🦸',
      },
      {
        'title': 'Spider-Man: No Way Home',
        'year': '2021',
        'emoji': '🕷️',
      },
      {
        'title': 'Frozen II',
        'year': '2019',
        'emoji': '❄️',
      },
      {
        'title': 'Fast X',
        'year': '2023',
        'emoji': '🏎️',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),

      body: ListView.builder(
        itemCount: movies.length,

        itemBuilder: (context, index) {

          final movie = movies[index];

          return ListTile(

            // Emoji avatar
            leading: CircleAvatar(
              child: Text(movie['emoji']!),
            ),

            // Movie title
            title: Text(movie['title']!),

            // Release year
            subtitle: Text('Year: ${movie['year']}'),

            trailing: const Icon(Icons.chevron_right),

            // Show SnackBar
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Selected: ${movie['title']}',
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          );
        },
      ),
    );
  }
}