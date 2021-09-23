import 'package:filmes_app/application/rest_client/rest_client.dart';
import 'package:filmes_app/models/genre_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

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
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br'
      },
      // * Converte o json recebido na requisição para um objeto GenreModel
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
      print('Erro ao buscar Genres: [${result.statusText}]');
      throw Exception('Erro durante a busca dos gêneros');
    }

    return result.body ?? <GenreModel>[];
  }
}
