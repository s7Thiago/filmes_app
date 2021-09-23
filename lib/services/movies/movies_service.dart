import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:filmes_app/models/movie_model.dart';

abstract class MoviesService {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailModel?> getDetail(int id);
}
