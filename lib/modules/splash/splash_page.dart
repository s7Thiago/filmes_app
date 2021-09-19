import 'package:filmes_app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  // Delegando a tarefa de instanciar o controller para o Get
  // O método put disponibiliza a instância através do Get
  var controller = Get.put(SplashController());

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/background.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
