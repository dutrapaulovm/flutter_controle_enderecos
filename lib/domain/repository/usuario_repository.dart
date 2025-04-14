import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/domain/repository/repository.dart';

class UsuarioRepository extends Repository<Usuario> {
  final Repository<Usuario> _dataSource;

  UsuarioRepository(this._dataSource);

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
}
