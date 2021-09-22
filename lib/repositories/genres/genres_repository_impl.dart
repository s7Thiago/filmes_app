import 'package:filmes_app/application/rest_client/rest_client.dart';
import 'package:filmes_app/models/genre_model.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  // Impedindo que o rest client seja manuseado de maneira inadequada fora da camada de repository
  GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movie/list',
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData
              .map<GenreModel>((g) => GenreModel.fromMap(g))
              .toList();
        }
        return <GenreModel>[];
      },
    );

    if (result.hasError) {
      print(result.statusText);
      throw Exception('Erro durante a busca dos gêneros');
    }

    return result.body ?? <GenreModel>[];
  }
}
