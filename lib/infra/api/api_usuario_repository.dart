import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/domain/repository/usuario_repository.dart';
import 'package:flutter_controle_enderecos/infra/api/infra_api.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';

class ApiUsuarioRepository extends UsuarioRepository {
  ControllerBase controllerBase = ControllerBase();

  @override
  Future<ResultData<int>> delete(Usuario entity) async {
    // TODO: Implementar lógica de exclusão via API
    return ResultData(success: false, message: 'Não implementado');
  }

  @override
  Future<ResultData<List<Usuario>>> findAll(Usuario entity) async {
    // TODO: Implementar lógica de listagem via API
    return ResultData(success: false, message: 'Não implementado');
  }

  @override
  Future<ResultData<Usuario?>> findById(Usuario entity) async {
    // TODO: Implementar lógica de busca por ID via API
    return ResultData(success: false, message: 'Não implementado');
  }

  @override
  Future<ResultData<int>> insert(Usuario entity) async {
    // TODO: Implementar lógica de inserção via API
    return ResultData(success: false, message: 'Não implementado');
  }

  @override
  Future<ResultData<Usuario?>?> login(String login, String senha) async {
    // TODO: Implementar lógica de login via API
    return ResultData(success: false, message: 'Não implementado');
  }

  @override
  Future<ResultData<int>> update(Usuario entity) async {
    // TODO: Implementar lógica de atualização via API
    return ResultData(success: false, message: 'Não implementado');
  }
}
