import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/domain/repository/usuario_repository_impl.dart';
import 'package:flutter_controle_enderecos/infra/datasource/usuario_fake_data_source.dart';
import 'package:flutter_controle_enderecos/view_model/login_view_model.dart';

class LoginController {
  final UsuarioRepositoryImpl _repository =
      UsuarioRepositoryImpl(UsuarioFakeDataSource());

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
