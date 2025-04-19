import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/domain/repository/repository.dart';

abstract class UsuarioRepository extends IRepository<Usuario> {
  Future<Usuario?> buscarPorLoginSenha(String login, String senha);
}
