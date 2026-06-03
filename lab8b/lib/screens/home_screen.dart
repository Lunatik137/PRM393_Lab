import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';
import '../widgets/movie_card.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieService _movieService = MovieService();
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() {
    setState(() {
      _moviesFuture = _movieService.fetchTrendingMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Explorer'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Movie>>(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 60),
                    const SizedBox(height: 16),
                    Text(
                      'Oops! Something went wrong.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _loadMovies,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.movie_filter, size: 60, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('No movies found.'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadMovies,
                    child: const Text('Refresh'),
                  ),
                ],
              ),
            );
          }

          final movies = snapshot.data!;
          final topPicks = movies.where((m) => m.rating >= 8).toList();

          return RefreshIndicator(
            onRefresh: () async => _loadMovies(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (topPicks.isNotEmpty) ...[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text(
                        'Recommended Tonight',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemCount: topPicks.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 160,
                            child: MovieCard(
                              movie: topPicks[index],
                              onTap: () => _navigateToDetail(topPicks[index]),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(indent: 16, endIndent: 16, height: 32),
                  ],
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Text(
                      'Trending Now',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movie: movies[index],
                        onTap: () => _navigateToDetail(movies[index]),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToDetail(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailScreen(movie: movie),
      ),
    );
  }
}
