import 'package:get/get.dart';

/// Todos os módulos no projeto obrigatoriamente terão que estender desta classe
abstract class Module {
  abstract List<GetPage> routers;
}
