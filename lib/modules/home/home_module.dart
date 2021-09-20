import 'package:filmes_app/application/modules/module.dart';
import 'package:filmes_app/modules/home/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
    ),
  ];
}
