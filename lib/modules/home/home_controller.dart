import 'package:filmes_app/services/login/login_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  static const INDEX_PAGE_EXIT = 2;
  final LoginService _loginService;

// Com a estratégia abaixo, podemos ter parâmetros nomeados, mas mesmo assim, não deixamos o loginService disponível
// para quem tiver uma instância desta controller, evitando assim que a regra de negócio possa ser manipulada indevidamente
  HomeController({required LoginService loginService})
      : this._loginService = loginService;

  final _pages = ['/movies', '/favorites'];

  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  goToPage(int pageIndex) {
    _pageIndex(pageIndex);
    if (pageIndex == INDEX_PAGE_EXIT) {
      _loginService.logout();
    } else {
      // O id do navigator que será usado é 1 (ligado ao Navigator da HomePage)
      Get.offNamed(_pages[pageIndex], id: NAVIGATOR_KEY);
    }
  }
}
