import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  void _toggleFavorite() {
    setState(() {
      widget.movie.isFavorite = !widget.movie.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'movie-poster-${widget.movie.id}',
                child: Image.network(
                  widget.movie.posterUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.movie, size: 100),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.movie.title,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        widget.movie.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.movie.isFavorite ? Colors.red : null,
                      ),
                      onPressed: _toggleFavorite,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 24),
                    const SizedBox(width: 4),
                    Text(
                      widget.movie.rating.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  children: widget.movie.genres
                      .map((genre) => Chip(label: Text(genre)))
                      .toList(),
                ),
                const SizedBox(height: 24),
                Text(
                  'Overview',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.movie.overview,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(Icons.rate_review, 'Rate'),
                    _buildActionButton(Icons.share, 'Share'),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Trailers',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                ...widget.movie.trailers.map((trailer) => ListTile(
                      leading: const Icon(Icons.play_circle_fill),
                      title: Text(trailer),
                      onTap: () {
                        // Trailer playback logic would go here
                      },
                    )),
                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        IconButton.filledTonal(
          onPressed: () {},
          icon: Icon(icon),
        ),
        Text(label),
      ],
    );
  }
}
