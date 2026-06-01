import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  final List<String> movies = const [
    'Avatar',
    'Inception',
    'Interstellar',
    'Joker',
    'The Batman',
    'Dune',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 - Layout Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Now Playing',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Chip(label: Text('Popular')),
                Chip(label: Text('New')),
                Chip(label: Text('Top Rated')),
              ],
            ),

            const SizedBox(height: 16),

            // ListView trong Column phải dùng Expanded
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(movie[0]),
                      ),
                      title: Text(movie),
                      subtitle: const Text('Sample description'),
                      trailing: const Icon(Icons.movie),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}