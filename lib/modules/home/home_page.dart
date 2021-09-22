import 'package:filmes_app/modules/favorites/favorites_page.dart';
import 'package:filmes_app/modules/home/home_controller.dart';
import 'package:filmes_app/modules/movies/movies_bindings.dart';
import 'package:filmes_app/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:filmes_app/application/ui/theme_extensions.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: context.themeGrey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Filmes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout_outlined),
              label: 'Sair',
            ),
          ],
        );
      }),
      body: Navigator(
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        initialRoute: '/movies',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/movies':
              return GetPageRoute(
                settings: settings,
                page: () => const MoviesPage(),
                binding: MoviesBindings(),
              );
            case '/favorites':
              return GetPageRoute(
                settings: settings,
                page: () => const FavoritesPage(),
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
