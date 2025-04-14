import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/domain/repository/repository.dart';

class UsuarioRepository extends Repository<Usuario> {
  @override
  Future<int> delete(Usuario entity) {
    throw UnimplementedError();
  }

  @override
  Future<List<Usuario>> findAll(Usuario entity) {
    throw UnimplementedError();
  }

  @override
  Future<Usuario?> findById(Usuario entity) {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(Usuario entity) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(Usuario entity) {
    throw UnimplementedError();
  }
}
