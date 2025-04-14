import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/domain/repository/repository.dart';

class LoginService {
  final Repository<Usuario> repository;

  LoginService(this.repository);

  // Método para realizar o login
  Future<Usuario> login(String email, String senha) async {
    // Aqui você pode adicionar qualquer regra de negócio, como validação de formato de email
    if (email.isEmpty || senha.isEmpty) {
      throw Exception("Email e senha são obrigatórios.");
    }

    // Chama o repositório para validar as credenciais
    final usuario = await repository.findById(Usuario(id: null, nome: email));

    // Simulação de login. Aqui você chamaria a API para autenticar
    if (usuario == null || !validarSenha(usuario, senha)) {
      throw Exception("Credenciais inválidas.");
    }

    // Se a autenticação for bem-sucedida, retornamos o usuário
    return usuario;
  }

  // Valida a senha - pode ser substituída por lógica mais complexa
  bool validarSenha(Usuario usuario, String senha) {
    return false;
  }
}
