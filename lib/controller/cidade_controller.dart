import 'package:flutter_controle_enderecos/controller/controller.dart';
import 'package:flutter_controle_enderecos/domain/models/cidade.dart';
import 'package:flutter_controle_enderecos/domain/repository/cidade_repository.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/view_model/cidade_view_model.dart';

class CidadeController extends Controller<Cidade> {
  final CidadeViewModel cidadeViewModel = CidadeViewModel();
  final CidadeRepository repository;

  Cidade? cidade;

  CidadeController({required this.repository, this.cidade}) {
    if (cidade != null) {
      cidadeViewModel.fromEntity(cidade!);
    }
  }

  @override
  String get title {
    return cidade == null ? 'Novo Cidade' : 'Editar Cidade';
  }

  @override
  Future<ResultData> save() async {
    final cidade = cidadeViewModel.toEntity();
    if (cidade.id <= 0) {
      return await repository.insert(cidade);
    } else {
      return await repository.update(cidade);
    }
  }

  @override
  Future<void> reset() async {
    cidadeViewModel.reset();
  }

  @override
  Future<ResultData> delete() async {
    final entity = cidadeViewModel.toEntity();
    if (entity.id >= 0) {
      return await repository.delete(entity);
    }
    return ResultData();
  }

  @override
  Future<ResultData> findAll() async {
    return await repository.findAll(Cidade());
  }

  @override
  void fromEntity(Cidade entity) {
    cidade = entity;
    return cidadeViewModel.fromEntity(entity);
  }
}
