import 'package:filmes_app/application/modules/module.dart';
import 'package:filmes_app/modules/movie_detail/movie_detail_page.dart';
import 'package:filmes_app/modules/movies/movies_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MovieDetailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => const MovieDetailPage(),
      binding: MoviesBindings(),
    )
  ];
}
