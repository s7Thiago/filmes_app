import 'package:filmes_app/application/auth/auth_service.dart';
import 'package:filmes_app/application/rest_client/rest_client.dart';
import 'package:filmes_app/repositories/login/login_repository.dart';
import 'package:filmes_app/repositories/login/login_repository_impl.dart';
import 'package:filmes_app/repositories/movies/movies_repository.dart';
import 'package:filmes_app/repositories/movies/movies_repository_impl.dart';
import 'package:filmes_app/services/login/login_service.dart';
import 'package:filmes_app/services/login/login_service_impl.dart';
import 'package:filmes_app/services/movies/movies_service.dart';
import 'package:filmes_app/services/movies/movies_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    // Expondo o RestClient para ser acessível por toda a aplicação
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );

    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(),
      // o Get não vai destruir a instância do repository quando a tela que causou a criação dela for fechada
      fenix: true,
    );
    Get.lazyPut<LoginService>(
      () => LoginServiceImpl(
        // Adicionando a instância do repository que foi carregado anteriormente
        loginRepository: Get.find(),
      ),
      // o Get não vai destruir a instância do repository quando a tela que causou a criação dela for fechada
      fenix: true,
    );
    // Assim que a aplicação inicializar, verifica se o usuário está logado, aciona o listener, e se houver usuário,
    // imediatamente navega para a tela home
    Get.put(AuthService()).init();

    // Expondo o MoviesRepository para ser acessível para o service que será consumido em toda a aplicação
    Get.lazyPut<MoviesRepository>(
      () => MoviesRepositoryImpl(
        // Capturando o rest client que foi exposto para injetar no MoviesRepository
        restClient: Get.find<RestClient>(),
      ),
      fenix: true,
    );

    // Como o serviço de obtenção das informações dos filmes precisará ser acessado em várias camadas do app (Filmes, Favoritos e Detalhes)
    // os services responsáveis serão expostos através do binding global
    Get.lazyPut<MoviesService>(
      () => MoviesServiceImpl(
        // Capturando o repository que foi exposto para injetar no MoviesService
        moviesRepository: Get.find<MoviesRepository>(),
      ),
      fenix: true,
    );
  }
}
