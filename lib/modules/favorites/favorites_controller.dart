import 'package:filmes_app/application/auth/auth_service.dart';
import 'package:filmes_app/models/movie_model.dart';
import 'package:filmes_app/services/movies/movies_service.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final MoviesService _moviesService;
  final AuthService _authService;

  // Lista de filmes favoritos que será exposta para o widget acessar
  final movies = <MovieModel>[].obs;

  FavoritesController(
      {required MoviesService moviesService, required AuthService authService})
      : _moviesService = moviesService,
        _authService = authService;

  @override
  Future<void> onReady() async {
    super.onReady();

    _getFavorites();
  }

  Future<void> _getFavorites() async {
    // Quando a tela estiver carregada, busca os filmes favoritos do usuário
    var user = _authService.user;
    if (user != null) {
      var favorites = await _moviesService.getFavoriteMovies(user.uid);
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorite(MovieModel movie) async {
    var user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(
        user.uid,
        movie.copyWith(favorite: false),
      );

      movies.remove(movie);
    }
  }
}
