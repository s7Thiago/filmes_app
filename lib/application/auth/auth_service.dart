import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

/// Toda vez que for necessário saber se o usuário está logado, esta classe
/// pode ser usada para isso. GetxService é um tipo de classe que não sofre
/// dispose (semelhante a propriedade fenix:true usada no ApplicationBindings
/// deste projeto), dessa forma a instância sempre vai existir enquanto o app
/// estiver em execução, e pode ser acessada quando necessário.
class AuthService extends GetxService {
  // Para fazer algumas coisas (como por exemplo, favoritar), é necessário guardar
  // o estado atual do objeto de informações do usuário. Como a instância desta classe
  // não é destruída, este é um local adequado para fazer esse tipo de coisa.
  User? user;

  // Permite que ao inicializar esta classe, o estado do firebase seja escutado continuamente
  // Basicamente será observado se o estado de User? user mudará de nulo para não nulo
  void init() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      this.user = user;
      if (user == null) {
        // O usuário não está logado
        Get.offAllNamed('/login');
      } else {
        // O usuário está logado
        Get.offAllNamed('/home');
      }
    });
  }
}
