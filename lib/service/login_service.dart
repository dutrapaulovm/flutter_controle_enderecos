import 'package:flutter_controle_enderecos/domain/repository/usuario_repository.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';

class LoginService {
  final UsuarioRepository _repository = ServiceLocator.instance
      .getService(ServiceKeys.usuario) as UsuarioRepository;

  // Método para realizar o login
  Future<ResultData> login(String login, String senha) async {
    final resultApplication = ResultData();
    resultApplication.success = false;

    // Verifica se os campos login e senha não estão vazios
    if (login.isEmpty || senha.isEmpty) {
      resultApplication.message = "Email e senha são obrigatórios.";
      return resultApplication;
    }

    // Chama o repositório para autenticar o usuário
    final usuario = await _repository.login(login, senha);

    // Verifica se o usuário não foi encontrado ou a senha está incorreta
    if (usuario == null || usuario.data == null || usuario.data!.id == -1) {
      resultApplication.message = "Usuário ou senha inválidos";
      return resultApplication;
    }

    // Se o login for bem-sucedido, marca o sucesso e retorna o usuário
    resultApplication.success = true;
    return resultApplication;
  }
}
