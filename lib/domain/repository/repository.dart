import 'package:flutter_controle_enderecos/domain/models/entity.dart';

abstract class Repository<T extends Entity> {
  Future<int> insert(T entity);
  Future<int> delete(T entity);
  Future<int> update(T entity);
  Future<T?> findById(T entity);
  Future<List<T>> findAll(T entity);
}
