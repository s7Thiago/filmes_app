import 'package:filmes_app/models/genre_model.dart';
import 'package:filmes_app/repositories/genres/genres_repository.dart';

abstract class GenresService {
  Future<List<GenreModel>> getGenres();
}
