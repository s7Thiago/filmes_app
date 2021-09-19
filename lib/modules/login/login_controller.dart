import 'package:filmes_app/application/ui/loader/loader_mixin.dart';
import 'package:filmes_app/application/ui/messages/messages_mixin.dart';
import 'package:filmes_app/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({required LoginService loginService})
      : _loginService = loginService;

// Quando o controller for carregado, chamaremos o loaderListener do LoaderMixin
// para iniciar o loader
  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      // no getx todos os Rx são callable classes
      loading(true); // o mesmo que  loading.value = true;

      await _loginService.login();

      // no getx todos os Rx são callable classes
      loading(false); // o mesmo que  loading.value = false;

      message(
        MessageModel.info(
          title: 'Sucesso',
          message: 'Login realizado com sucesso',
        ),
      );
    } catch (e, s) {
      // Se acontecer qualquer exceção, mostra uma snack bar informando o erro

      print(e);
      print(s);
      loading(false); // o mesmo que  loading.value = false;

      message(
        MessageModel.error(
          title: 'Login error',
          message: 'Erro ao realizar login',
        ),
      );
    }
  }
}
