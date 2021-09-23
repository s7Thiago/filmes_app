import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:filmes_app/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailHeader extends GetView<MoviesController> {
  final MovieDetailModel? movie;

  const MovieDetailHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // para não precisar forçar com ! no itemCount do ListView
    var movieData = movie;

    if (movieData != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieData.urlImages.length,
          itemBuilder: (context, index) {
            final image = movieData.urlImages[index];
            return Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network(
                image,
                // fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
    } else {
      // Quando queremos retornar uma tela vazia, SizedBox.shrink() é uma boa escolha
      return const SizedBox.shrink();
    }
  }
}
