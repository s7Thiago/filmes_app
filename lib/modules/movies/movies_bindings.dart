import 'package:filmes_app/modules/movies/movies_controller.dart';
import 'package:filmes_app/repositories/genres/genres_repository.dart';
import 'package:filmes_app/repositories/genres/genres_repository_impl.dart';
import 'package:filmes_app/services/genres/genres_service.dart';
import 'package:filmes_app/services/genres/genres_service_impl.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    // Busca o rest client declarado nos binding globais (application_bindings.dart)
    Get.lazyPut<GenresRepository>(
      () => GenresRepositoryImpl(restClient: Get.find()),
    );

    // Carregando o service
    Get.lazyPut<GenresService>(
      // Recupera o repository da linha acima
      () => GenresServiceImpl(genresRepository: Get.find()),
    );

    Get.lazyPut(
      // Recuperando o service adicionado na linha acima
      () => MoviesController(
        // O services foram carregados nos bindings da aplicação
        genresService: Get.find(),
        moviesService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
