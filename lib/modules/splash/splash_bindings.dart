import 'package:filmes_app/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

/// O binding do GetX é responsável por definir quando uma página vai carregar
/// Normalmente a classe binding carrega antes da page
class SplashBindings implements Bindings {
  @override
  void dependencies() {
    // Provê o acesso ao controller através do GetX antes da page ser carregada
    // Quando a splash page sair da pilha de navegação, o controller destruirá esta instância
    Get.put(SplashController());
  }
}
