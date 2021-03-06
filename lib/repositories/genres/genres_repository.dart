import 'package:filmes_app/models/genre_model.dart';

abstract class GenresRepository {
  Future<List<GenreModel>> getGenres();
}
