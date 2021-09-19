import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loaderRx) {
    // Executa alguma ação SEMPRE que o listener loaderRx for alterado
    ever<bool>(loaderRx, (loading) async {
      if (loading) {
        await Get.dialog(
          const Center(child: CircularProgressIndicator()),
          barrierDismissible: false, // O dialog não fecha ao clicar fora dele
        );
      } else {
        // Fechando a ação anterior
        Get.back();
      }
    });
  }
}
