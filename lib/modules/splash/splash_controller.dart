import 'package:get/get.dart';

/// *  Classe responsável por trabalhar os dados e atualizar a tela. A page
/// * Será responsável apenas por exibir os dados fornecidos pelo controller.
/// * Também é possível gerenciar o ciclo de vida dentro do controller
class SplashController extends GetxController {
  /// Quando a tela estiver pronta, navega para a tela de login
  /// Faz uma checagem se o usuário já está logado
  @override
  void onReady() {
    super.onReady();
    // Navegando para a tela de login sem a necessidade de contexto
    // Remove toda a pilha de navegação que existir e vai para a tela de login
    Get.offAllNamed('/login');
  }
}
