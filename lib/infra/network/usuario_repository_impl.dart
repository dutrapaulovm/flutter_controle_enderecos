import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/domain/repository/usuario_repository.dart';

class UsuarioRepositoryImpl extends UsuarioRepository {
  final UsuarioRepository _dataSource;

  UsuarioRepositoryImpl(this._dataSource);

  @override
  Future<int> insert(Usuario entity) => _dataSource.insert(entity);

  @override
  Future<int> update(Usuario entity) => _dataSource.update(entity);

  @override
  Future<int> delete(Usuario entity) => _dataSource.delete(entity);

  @override
  Future<Usuario?> findById(Usuario entity) => _dataSource.findById(entity);

  @override
  Future<List<Usuario>> findAll(Usuario entity) => _dataSource.findAll(entity);

  @override
  Future<Usuario?> buscarPorLoginSenha(String login, String senha) =>
      _dataSource.buscarPorLoginSenha(login, senha);
}
