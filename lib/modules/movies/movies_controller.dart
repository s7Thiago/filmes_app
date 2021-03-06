import 'package:filmes_app/application/auth/auth_service.dart';
import 'package:filmes_app/application/ui/messages/messages_mixin.dart';
import 'package:filmes_app/models/genre_model.dart';
import 'package:filmes_app/models/movie_model.dart';
import 'package:filmes_app/services/genres/genres_service.dart';
import 'package:filmes_app/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  // Seguindo um padrão de projeto: o repository tem o service, e o service é recebido pelo
  // controller
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  // Listas principais cujos dados trazidos (diretamente da API através do service que acessa o
  // repository responsável) serão observados
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  // Listas auxiliares para filtragem local (com o objetivo de reduzir o número de requisições
  // à API)
  var popularMoviesOriginal = <MovieModel>[];
  var topRatedMoviesOriginal = <MovieModel>[];

  final selectedGenre = Rxn<GenreModel>();

  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
    required AuthService authService,
  })  : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  //*  Fornece acesso para componentes externos a esta classe lerem a lista de categorias
  // List<GenreModel> get genres => _genres;

  @override
  void onInit() {
    super.onInit();
    // Delegando a variável observável para a entidade tratadora de erros
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    // ! Quando a tela estiver pronta, faz a busca dos dados
    try {
      // * Traz a lista de categorias da API
      final genresData = await _genresService.getGenres();

      // * O assignAll do Get sobrescreve todos os dados dentro da lista (a variável de estado)
      genres.assignAll(genresData);

      await getMovies();
    } catch (e, s) {
      print(e);
      print(s);

      // Atribuindo os dados no objeto de erro (usando sintaxe liberada pelo Get)
      _message(
        MessageModel.error(
          title: 'Ocorreu um problema!',
          message: 'Erro ao tentar buscar dadas da páginas',
        ),
      );
    }
  }

  Future<void> getMovies() async {
    // ! Quando a tela estiver pronta, faz a busca dos dados
    try {
      // * Traz os filmes populares da API
      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRated();

      final favorites = await getFavorites();

      // ? Percorrendo cada uma das listas e favorita, se necessário
      popularMoviesData = popularMoviesData.map(
        (m) {
          if (favorites.containsKey(m.id)) {
            return m.copyWith(favorite: true);
          } else {
            return m.copyWith(favorite: false);
          }
        },
      ).toList();

      topRatedMoviesData = topRatedMoviesData.map(
        (m) {
          if (favorites.containsKey(m.id)) {
            return m.copyWith(favorite: true);
          } else {
            return m.copyWith(favorite: false);
          }
        },
      ).toList();

      // * Atribuindo os dados recebidos a variável de estado
      popularMovies.assignAll(popularMoviesData);
      topRatedMovies.assignAll(topRatedMoviesData);

      // * Populando as listas auxiliares de filtragem
      popularMoviesOriginal = popularMoviesData;
      topRatedMoviesOriginal = topRatedMoviesData;
    } catch (e, s) {
      print(e);
      print(s);

      // Atribuindo os dados no objeto de erro (usando sintaxe liberada pelo Get)
      _message(
        MessageModel.error(
          title: 'Ocorreu um problema!',
          message: 'Erro ao tentar buscar dadas da páginas',
        ),
      );
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      // * Filtrando a lista de filmes populares pelo título
      var newPopularMovies = popularMoviesOriginal.where(
          (movie) => movie.title.toLowerCase().contains(title.toLowerCase()));

      // * Filtrando a lista de top rated pelo título
      var newTopRatedMovies = topRatedMoviesOriginal.where(
          (movie) => movie.title.toLowerCase().contains(title.toLowerCase()));

      // Sobrescrevendo as respectivas listas acessíveis externamente com os dados filtrados
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(popularMoviesOriginal);
      topRatedMovies.assignAll(topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genre) {
    var genreFilter = genre;

    // Verificando se o filtro que está vindo é igual ao que está selecionado. Deste modo
    // O filtro é desfeito e o widget vai perder o status de seleção quando o usuário clicar
    // em cada um (prove alternação do gênero selecionado)
    if (genreFilter?.id == selectedGenre.value?.id) {
      // * O que fazer quando o elemento já estiver selecionado
      genreFilter = null;
    }

    selectedGenre.value = genreFilter;

    if (genreFilter != null) {
      var newPopularMovies = popularMoviesOriginal
          .where((movie) => movie.genres.contains(genreFilter?.id));

      // * Filtrando a lista de top rated pelo título
      var newTopRatedMovies = topRatedMoviesOriginal
          .where((movie) => movie.genres.contains(genreFilter?.id));

      // Sobrescrevendo as respectivas listas acessíveis externamente com os dados filtrados
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(popularMoviesOriginal);
      topRatedMovies.assignAll(topRatedMoviesOriginal);
    }
  }

  Future<void> favoriteMovie(MovieModel movie) async {
    final user = _authService.user;

    if (user != null) {
      // Usando padrão prototype para alterar o estado do objeto (que por padrão é imutável)
      //através de uma nova instância com a propriedade desejada já alterada
      var newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

// Cria um map onde a chave de cada registro é o id do filme favoritado. Se o id de um filme estiver
// nas chaves, significa que ele é favorito, dessa forma não é necessário varrer a lista para esse
// propósito
  Future<Map<int, MovieModel>> getFavorites() async {
    var user = _authService.user;

    if (user != null) {
      final favorites = await _moviesService.getFavoriteMovies(user.uid);

      return <int, MovieModel>{for (var fav in favorites) fav.id: fav};
    }

    return {};
  }
}
