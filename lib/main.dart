import 'package:filmes_app/application/bindings/application_bindings.dart';
import 'package:filmes_app/application/ui/filmes_app_ui_config.dart';
import 'package:filmes_app/modules/home/home_module.dart';
import 'package:filmes_app/modules/login/login_module.dart';
import 'package:filmes_app/modules/movie_detail/movie_detail_module.dart';
import 'package:filmes_app/modules/splash/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // Inicializa o Flutter antes mesmo de rodar a aplicação,
  // garantindo que não haverá problema ao inicializar o
  // firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  RemoteConfig.instance.fetchAndActivate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FilmesAppUiConfig.title,
      // bindings de inicialização, múdulo que agrupa tudo que será permanente na aplicação
      // e que não deve ser destruído ao mudar de rota
      initialBinding: ApplicationBindings(),
      theme: FilmesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    );
  }
}
