// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_controle_enderecos/domain/models/entity.dart';
import 'package:flutter_controle_enderecos/domain/repository/repository.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';

class FakeRepository<T extends Entity<T>> extends IRepository<T> {
  List<T> fakeData = [];
  int idCounter = 0;

  FakeRepository({
    required this.fakeData,
    required this.idCounter,
  });

  @override
  Future<ResultData<int>> insert(T entity) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simula latência
    entity.id = idCounter++;
    fakeData.add(entity);
    return ResultData(success: true, data: entity.id);
  }

  @override
  Future<ResultData<int>> delete(T entity) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final removed = fakeData.removeWhere((u) => u.id == entity.id);
    return ResultData(success: true, data: 1);
  }

  @override
  Future<ResultData<int>> update(T entity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = fakeData.indexWhere((u) => u.id == entity.id);
    if (index == -1) {
      return ResultData(success: false, message: 'Entidade não encontrada');
    }
    fakeData[index] = entity;
    return ResultData(success: true, data: 1);
  }

  @override
  Future<ResultData<T?>> findById(T entity) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final result = fakeData.where((u) => u.id == entity.id).toList();
    if (result.isEmpty) {
      return ResultData(success: false, message: 'Entidade não encontrada');
    }
    return ResultData(success: true, data: result.first);
  }

  @override
  Future<ResultData<List<T>>> findAll(T entity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return ResultData(success: true, data: List<T>.from(fakeData));
  }
}
