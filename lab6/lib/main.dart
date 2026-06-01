import 'package:flutter/material.dart';

void main() {
  runApp(const MovieApp());
}

class Movie {
  final String title;
  final int year;
  final List<String> genres;
  final String posterUrl;
  final double rating;

  Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterUrl,
    required this.rating,
  });
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Genre Browser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
        useMaterial3: true,
      ),
      home: const MovieGenreBrowser(),
    );
  }
}

class MovieGenreBrowser extends StatefulWidget {
  const MovieGenreBrowser({super.key});

  @override
  State<MovieGenreBrowser> createState() => _MovieGenreBrowserState();
}

class _MovieGenreBrowserState extends State<MovieGenreBrowser> {
  // Sample Data
  final List<Movie> _allMovies = [
    Movie(
      title: 'Inception',
      year: 2010,
      genres: ['Sci-Fi', 'Action'],
      posterUrl: 'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?auto=format&fit=crop&q=80&w=400',
      rating: 8.8,
    ),
    Movie(
      title: 'The Shawshank Redemption',
      year: 1994,
      genres: ['Drama'],
      posterUrl: 'https://images.unsplash.com/photo-1594909122845-11baa439b7bf?auto=format&fit=crop&q=80&w=400',
      rating: 9.3,
    ),
    Movie(
      title: 'The Dark Knight',
      year: 2008,
      genres: ['Action', 'Thriller'],
      posterUrl: 'https://images.unsplash.com/photo-1478720568477-152d9b164e26?auto=format&fit=crop&q=80&w=400',
      rating: 9.0,
    ),
    Movie(
      title: 'Interstellar',
      year: 2014,
      genres: ['Sci-Fi', 'Adventure', 'Drama'],
      posterUrl: 'https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&q=80&w=400',
      rating: 8.6,
    ),
    Movie(
      title: 'Pulp Fiction',
      year: 1994,
      genres: ['Drama', 'Thriller'],
      posterUrl: 'https://m.media-amazon.com/images/M/MV5BYTViYTE3ZGQtNDBlMC00ZTAyLTkyODMtZGRiZDg0MjA2YThkXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
      rating: 8.9,
    ),
    Movie(
      title: 'Superbad',
      year: 2007,
      genres: ['Comedy'],
      posterUrl: 'https://images.unsplash.com/photo-1485846234645-a62644f84728?auto=format&fit=crop&q=80&w=400',
      rating: 7.6,
    ),
  ];

  final List<String> _genres = [
    'Action',
    'Drama',
    'Comedy',
    'Sci-Fi',
    'Adventure',
    'Thriller',
  ];

  // State Variables
  String _searchQuery = '';
  final Set<String> _selectedGenres = {};
  String _sortBy = 'A-Z';

  // Controllers
  final TextEditingController _searchController = TextEditingController();

  List<Movie> get _filteredAndSortedMovies {
    List<Movie> filtered = _allMovies.where((movie) {
      final matchesSearch = movie.title.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesGenre = _selectedGenres.isEmpty || 
          movie.genres.any((genre) => _selectedGenres.contains(genre));
      return matchesSearch && matchesGenre;
    }).toList();

    switch (_sortBy) {
      case 'A-Z':
        filtered.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Z-A':
        filtered.sort((a, b) => b.title.compareTo(a.title));
        break;
      case 'Year':
        filtered.sort((a, b) => b.year.compareTo(a.year));
        break;
      case 'Rating':
        filtered.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }

    return filtered;
  }

  void _clearFilters() {
    setState(() {
      _searchQuery = '';
      _searchController.clear();
      _selectedGenres.clear();
      _sortBy = 'A-Z';
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredMovies = _filteredAndSortedMovies;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            _buildHeader(),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
                ),
              ),
            ),

            // Genre Chips
            _buildGenreSection(),

            // Sort and Filters Row
            _buildSortAndFilterActionRow(),

            // Responsive Movie List/Grid
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (filteredMovies.isEmpty) {
                    return const Center(child: Text('No movies found.'));
                  }

                  if (constraints.maxWidth < 800) {
                    // ListView for mobile
                    return ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) => _MovieCard(movie: filteredMovies[index]),
                    );
                  } else {
                    // GridView for tablet/web
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2.5,
                      padding: const EdgeInsets.all(16),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: filteredMovies.map((movie) => _MovieCard(movie: movie)).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find a Movie',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const Text('Browse by genre and rating'),
            ],
          ),
          if (_selectedGenres.isNotEmpty)
            Badge(
              label: Text('${_selectedGenres.length}'),
              child: const Icon(Icons.filter_list),
            ),
        ],
      ),
    );
  }

  Widget _buildGenreSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: _genres.map((genre) {
              final isSelected = _selectedGenres.contains(genre);
              return FilterChip(
                label: Text(genre),
                selected: isSelected,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      _selectedGenres.add(genre);
                    } else {
                      _selectedGenres.remove(genre);
                    }
                  });
                },
                selectedColor: Theme.of(context).colorScheme.primaryContainer,
                checkmarkColor: Theme.of(context).colorScheme.primary,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSortAndFilterActionRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
            value: _sortBy,
            underline: Container(),
            icon: const Icon(Icons.sort),
            items: ['A-Z', 'Z-A', 'Year', 'Rating'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text('Sort by: $value'),
              );
            }).toList(),
            onChanged: (newValue) {
              if (newValue != null) {
                setState(() {
                  _sortBy = newValue;
                });
              }
            },
          ),
          TextButton.icon(
            onPressed: _clearFilters,
            icon: const Icon(Icons.clear_all),
            label: const Text('Clear Filters'),
          ),
        ],
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  final Movie movie;

  const _MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Poster Image
            SizedBox(
              width: 100,
              child: Image.network(
                movie.posterUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.movie),
                  );
                },
              ),
            ),
            // Movie Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.amber[700],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, size: 14, color: Colors.white),
                              const SizedBox(width: 4),
                              Text(
                                movie.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Year: ${movie.year}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      children: movie.genres.map((g) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            g,
                            style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
