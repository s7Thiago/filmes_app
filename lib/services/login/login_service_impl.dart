import 'package:filmes_app/repositories/login/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './login_service.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;

  // Impede que quem tiver acesso ao construtor do serviço, chamar o repository diretamente
  // A camada service nesta aplicação tem a função de business object (Objeto de regras de negócio)
  // Em alguns casos, esta camada atua como um Proxy, repassando os dados para o repository fazer o
  // processamento, como é o caso do método de login. Isso evita que regras de negócio tenham que ir
  // para lugares inadequados, como o controller. Ou pode ocorrer de somente alguns módulos tenham a
  // camada de service, e outros não, tornando a aplicação muito desorganizada. É importante ter essa
  // camada de service, mesmo que ela apenas repasse o processamento para o repository. Dessa forma, se
  // no futuro precisar ser adicionada alguma regra de negócio, basta adicionar no service, evitando assim,
  // que o código fique muito desorganizado.
  LoginServiceImpl({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  // Delega a responsabilidade de fazer o login para o repository
  @override
  Future<UserCredential> login() => _loginRepository.login();
}
