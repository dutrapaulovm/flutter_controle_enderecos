import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/domain/repository/usuario_repository.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';

class LocalUsuarioRepository extends UsuarioRepository {
  @override
  Future<ResultData<int>> delete(Usuario entity) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ResultData<List<Usuario>>> findAll(Usuario entity) async {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<ResultData<Usuario?>> findById(Usuario entity) async {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<ResultData<int>> insert(Usuario entity) async {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<ResultData<Usuario?>?> login(String login, String senha) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<ResultData<int>> update(Usuario entity) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
