import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/domain/repository/usuario_repository.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';
import 'package:flutter_controle_enderecos/view_model/login_view_model.dart';

class LoginController {
  final UsuarioRepository _repository =
      ServiceLocator.instance.getService("Usuario") as UsuarioRepository;

  // Método para realizar o login
  Future<Usuario> login(LoginViewModel usuarioViewModel) async {
    final Usuario? usuario;

    // Aqui você pode adicionar qualquer regra de negócio, como validação de formato de email
    if (usuarioViewModel.login!.text.isEmpty ||
        usuarioViewModel.password!.text.isEmpty) {
      throw Exception("Email e senha são obrigatórios.");
    }

    // Simulação de login. Aqui você chamaria a API para autenticar
    usuario = await _repository.buscarPorLoginSenha(
        usuarioViewModel.login!.text, usuarioViewModel.password!.text!);

    if (usuario == null) throw Exception("Credenciais inválidas.");

    // Se a autenticação for bem-sucedida, retornamos o usuário
    return usuario;
  }
}
