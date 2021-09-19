import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<UserCredential> login() async {
    //  Chamando a função de login do google
    final googleUser = await GoogleSignIn().signIn();

    //  Pegando os dados da autenticação do usuário
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      // Pega os dados do usuário da credencial do usuário
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Caso o usuário não tenha sido criado ainda, entra nesta estrutura, cria e retorna os dados
      return FirebaseAuth.instance.signInWithCredential(credential);
    }

    throw Exception('Não foi possível realizar o login com o google');
  }
}
