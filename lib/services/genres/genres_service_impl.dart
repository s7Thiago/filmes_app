import 'package:filmes_app/models/genre_model.dart';
import 'package:filmes_app/repositories/genres/genres_repository.dart';

import './genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;

  GenresServiceImpl({required GenresRepository genresRepository})
      : _genresRepository = genresRepository;

// Apenas delega a chamada para o repository (padrão proxy)
  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres();
}
