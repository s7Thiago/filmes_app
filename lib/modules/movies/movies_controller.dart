import 'package:filmes_app/services/genres/genres_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  // Seguindo um padrão de projeto: o repository tem o service, e o service é recebido pelo controller
  final GenresService _genresService;

  MoviesController({required GenresService genresService})
      : _genresService = genresService;
}
