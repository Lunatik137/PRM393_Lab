import '../models/movie.dart';

final List<Movie> sampleMovies = [
  Movie(
    id: '1',
    title: 'Inception',
    posterUrl: 'https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg',
    overview: 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
    genres: ['Action', 'Sci-Fi', 'Adventure'],
    rating: 8.8,
    trailers: ['Trailer 1', 'Trailer 2'],
  ),
  Movie(
    id: '2',
    title: 'The Dark Knight',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
    overview: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    genres: ['Action', 'Crime', 'Drama'],
    rating: 9.0,
    trailers: ['Trailer 1'],
  ),
  Movie(
    id: '3',
    title: 'Interstellar',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc@._V1_.jpg',
    overview: 'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.',
    genres: ['Adventure', 'Drama', 'Sci-Fi'],
    rating: 8.7,
    trailers: ['Official Trailer'],
  ),
  Movie(
    id: '4',
    title: 'The Matrix',
    posterUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfSjSWOCaw5dnDL2GT1zFd9RMCgUGw5Q2Cfg&s',
    overview: 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.',
    genres: ['Action', 'Sci-Fi'],
    rating: 8.7,
    trailers: ['Trailer 1'],
  ),
  Movie(
    id: '5',
    title: 'Pulp Fiction',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BYTViYTE3ZGQtNDBlMC00ZTAyLTkyODMtZGRiZDg0MjA2YThkXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    overview: 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.',
    genres: ['Crime', 'Drama'],
    rating: 8.9,
    trailers: ['Trailer 1', 'Teaser'],
  ),
];
