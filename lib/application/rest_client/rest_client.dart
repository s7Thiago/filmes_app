import 'dart:io';

import 'package:get/get.dart';

class RestClient extends GetConnect {
  // O próprio construtor padrão já vai configurar algumas coisas
  RestClient() {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
  }
}
