import 'package:get/get.dart';

class HomeController extends GetxController {
  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  goToPage(int pageIndex) {
    _pageIndex(pageIndex);
    if (pageIndex == 1) {
      // O id do navigator que será usado é 1 (definido no navigator da HomePage)
      Get.offNamed('/favorites', id: 1);
    } else if (pageIndex == 0) {
      // O id do navigator que será usado é 1 (definido no navigator da HomePage)
      Get.offNamed('/movies', id: 1);
    }
  }
}
