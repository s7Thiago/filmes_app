import 'package:filmes_app/application/ui/loader/loader_mixin.dart';
import 'package:filmes_app/application/ui/messages/messages_mixin.dart';
import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:filmes_app/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _movieService;

  MovieDetailController({required MoviesService movieService})
      : _movieService = movieService;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  // * Variável observável que receberá os dados de detalhe do filme para serem acessados no widget
  var movie = Rxn<MovieDetailModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  void onReady() async {
    super.onReady();
    // ? Quando a tela estiver pronta, busca os detalhes do filme com id passado através dos argumentos de rota do GetX
    try {
      final movieId = Get.arguments;
      loading(true);

      // Acessando o serviço para obter os detalhes do filme a partir do id recebido da região de argumentos do Getx
      final movieDetailData = await _movieService.getDetail(movieId);

      // na época da aula a sintaxe  movie(movieDetailData) estava com problema, e poderia retornar um valor antigo
      // mesmo que movieDetailData não tenha sido recebido (esteja null)
      movie.value = movieDetailData;
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(
        MessageModel.error(
          title: 'Erro',
          message: 'Erro ao tentar buscar os detalhes de um filme',
        ),
      );
    }
  }
}
