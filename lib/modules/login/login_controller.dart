import 'package:get/get.dart';

class LoginController extends GetxController {
  var name = 'Thiago Silva'.obs;

  void login() {
    name.value = 'Academia do Flutter';
  }
}
