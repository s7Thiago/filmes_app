import 'package:filmes_app/models/movie_model.dart';
import 'package:filmes_app/repositories/movies/movies_repository.dart';

import './movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;

  MoviesServiceImpl({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() => _moviesRepository.getTopRated();
}
