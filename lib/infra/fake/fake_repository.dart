import 'package:flutter_controle_enderecos/domain/models/entity.dart';
import 'package:flutter_controle_enderecos/domain/repository/repository.dart';
import 'package:flutter_controle_enderecos/infra/fake/database_fake.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';

class FakeRepository<T extends Entity> extends IRepository<T> {
  final List<T> _usuarios = [];
  int _idCounter = usuariosFake.length;

  @override
  Future<ResultData<int>> insert(T entity) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simula latência
    entity.id = _idCounter++;
    _usuarios.add(entity);
    return ResultData(success: true, data: entity.id);
  }

  @override
  Future<ResultData<int>> delete(T entity) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final removed = _usuarios.removeWhere((u) => u.id == entity.id);
    return ResultData(success: true, data: 1);
  }

  @override
  Future<ResultData<int>> update(T entity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _usuarios.indexWhere((u) => u.id == entity.id);
    if (index == -1) {
      return ResultData(success: false, message: 'Entidade não encontrada');
    }
    _usuarios[index] = entity;
    return ResultData(success: true, data: 1);
  }

  @override
  Future<ResultData<T?>> findById(T entity) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final result = _usuarios.where((u) => u.id == entity.id).toList();
    if (result.isEmpty) {
      return ResultData(success: false, message: 'Entidade não encontrada');
    }
    return ResultData(success: true, data: result.first);
  }

  @override
  Future<ResultData<List<T>>> findAll(T entity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return ResultData(success: true, data: List<T>.from(_usuarios));
  }
}
