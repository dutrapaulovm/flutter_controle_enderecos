import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/domain/repository/repository.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';

abstract class UsuarioRepository implements IRepository<Usuario> {
  Future<ResultData<Usuario?>?> login(String login, String senha);
}
