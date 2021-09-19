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
    // no getx todos os Rx são callable classes
    loading(true); // o mesmo que  loading.value = true;

    //o mesmo que  await Future.delayed(const Duration(seconds: 2));
    await 2.seconds.delay();

    // no getx todos os Rx são callable classes
    loading(false); // o mesmo que  loading.value = false;

    Get.snackbar('Título da Snack', 'Teste');
  }
}
