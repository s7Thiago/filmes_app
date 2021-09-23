import 'package:filmes_app/application/rest_client/rest_client.dart';
import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:filmes_app/models/movie_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      // Os query params sempre são maps <String, String> (por padrão em qualquer client)
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-BR',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MovieModel>((movieData) => MovieModel.fromMap(movieData))
              .toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print('Erro ao buscar Filmes populares: [${result.statusText}]');
      throw Exception('Erro ao buscar Filmes populares');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.get(
      '/movie/top_rated',
      // Os query params sempre são maps <String, String> (por padrão em qualquer client)
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-BR',
        'page': '1',
      },
      // * Converte o json recebido na requisição para um objeto MovieDetail
      decoder: (data) {
        final results = data['results'];

        if (results != null) {
          return results
              .map<MovieModel>((movieData) => MovieModel.fromMap(movieData))
              .toList();
        }
      },
    );

    if (result.hasError) {
      print('Erro ao buscar Filmes top rated: [${result.statusText}]');
      throw Exception('Erro ao buscar Filmes top rated');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClient.get<MovieDetailModel?>(
      '/movie/$id', //  o id do filme que terá os detalhes trazidos
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-BR',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-br',
      },
      // * Converte o json recebido na requisição para um objeto MovieDetail
      decoder: (data) {
        // Como o objeto que queremos já está na raiz do json, nenhum tratamento é necessário
        return MovieDetailModel.fromMap(data);
      },
    );

    if (result.hasError) {
      print('Erro ao buscar detalhes do filme: [${result.statusText}]');
      throw Exception('Erro ao buscar Filmes detalhes do filme');
    }

    return result.body;
  }
}
