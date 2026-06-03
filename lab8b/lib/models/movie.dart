class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final double rating;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // Handling TVmaze specific structure
    final show = json['show'] ?? json;
    
    return Movie(
      id: show['id'] ?? 0,
      title: show['name'] ?? 'No Title',
      // TVmaze uses image object with 'medium' and 'original'
      posterPath: show['image'] != null ? show['image']['medium'] ?? '' : '',
      overview: (show['summary'] as String? ?? 'No overview available.')
          .replaceAll(RegExp(r'<[^>]*>'), ''), // Remove HTML tags from TVmaze summary
      releaseDate: show['premiered'] ?? 'Unknown',
      rating: (show['rating'] != null && show['rating']['average'] != null)
          ? (show['rating']['average'] as num).toDouble()
          : 0.0,
    );
  }

  String get fullPosterUrl => posterPath.isNotEmpty
      ? posterPath
      : 'https://via.placeholder.com/500x750?text=No+Image';

  String get releaseYear => releaseDate.length >= 4
      ? releaseDate.substring(0, 4)
      : releaseDate;
}
