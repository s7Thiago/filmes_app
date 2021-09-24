import 'package:filmes_app/application/ui/widgets/movie_card.dart';
import 'package:filmes_app/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos Page'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: SizedBox(
              width: Get.width,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: controller.movies
                    .map(
                      (m) => MovieCard(
                        movie: m,
                        favoriteCallback: () => controller.removeFavorite(m),
                      ),
                    )
                    .toList(),
              )),
        );
      }),
    );
  }
}
