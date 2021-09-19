import 'package:filmes_app/application/ui/loader/loader_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin {
  final loading = false.obs;

// Quando o controller for carregado, chamaremos o loaderListener do LoaderMixin
// para iniciar o loader
  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
  }

  Future<void> login() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    loading.value = false;
  }
}
