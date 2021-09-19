import 'package:filmes_app/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    // Só cria a instância quando necessário
    Get.lazyPut(() => LoginController());
  }
}
