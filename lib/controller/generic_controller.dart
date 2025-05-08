import 'package:flutter_controle_enderecos/controller/controllers.dart';
import 'package:flutter_controle_enderecos/domain/models/entity.dart';
import 'package:flutter_controle_enderecos/domain/repository/repository.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/view_model/entity_view_modal.dart';

class GenericController<T extends Entity<T>, VM extends EntityViewModel>
    extends Controller<T> {
  final VM viewModel;
  final IRepository<T> repository;
  T? entity;

  final String titleNew;
  final String titleEdit;

  GenericController({
    required this.viewModel,
    required this.repository,
    this.entity,
    required this.titleNew,
    required this.titleEdit,
  }) {
    if (entity != null) {
      viewModel.fromEntity(entity!);
    }
  }

  @override
  String get title {
    return entity == null ? titleNew : titleEdit;
  }

  @override
  Future<ResultData> save() async {
    final e = viewModel.toEntity();
    final id = _getId(e);

    if (id == null || id <= 0) {
      return await repository.insert(e);
    } else {
      return await repository.update(e);
    }
  }

  @override
  Future<void> reset() async {
    viewModel.reset();
  }

  @override
  Future<ResultData> delete() async {
    final e = viewModel.toEntity();
    final id = _getId(e);
    if (id != null && id > 0) {
      return await repository.delete(e);
    }
    return ResultData();
  }

  @override
  Future<ResultData> findAll() async {
    return await repository.findAll(viewModel.toEntity());
  }

  @override
  void fromEntity(T entity) {
    this.entity = entity;
    viewModel.fromEntity(entity);
  }

  int? _getId(dynamic entity) {
    try {
      return entity.id as int?;
    } catch (_) {
      return null;
    }
  }
}
