import 'package:filmes_app/application/auth/auth_service.dart';
import 'package:filmes_app/repositories/login/login_repository.dart';
import 'package:filmes_app/repositories/login/login_repository_impl.dart';
import 'package:filmes_app/services/login/login_service.dart';
import 'package:filmes_app/services/login/login_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
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
  }
}
