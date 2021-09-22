import 'package:filmes_app/application/ui/messages/messages_mixin.dart';
import 'package:filmes_app/models/genre_model.dart';
import 'package:filmes_app/services/genres/genres_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  // Seguindo um padrão de projeto: o repository tem o service, e o service é recebido pelo controller
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  MoviesController({required GenresService genresService})
      : _genresService = genresService;

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
      final genres = await _genresService.getGenres();

      // * O assignAll do Get sobrescreve todos os dados dentro da lista (a variável de estado)
      this.genres.assignAll(genres);
    } catch (e) {
      // Atribuindo os dados no objeto de erro (usando sintaxe liberada pelo Get)
      _message(
        MessageModel.error(
          title: 'Ocorreu um problema!',
          message: 'Erro ao buscar Categorias',
        ),
      );
    }
  }
}
