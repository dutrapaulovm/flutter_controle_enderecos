import 'package:flutter_controle_enderecos/controller/controller.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/domain/repository/estado_repository.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/view_model/estado_view_model.dart';

class EstadoController extends Controller<Estado> {
  final EstadoViewModel estadoViewModel = EstadoViewModel();
  final EstadoRepository repository;

  Estado? estado;

  EstadoController({required this.repository, this.estado}) {
    if (estado != null) {
      estadoViewModel.fromEntity(estado!);
    }
  }

  @override
  String get title {
    return estado == null ? 'Novo Estado' : 'Editar Estado';
  }

  String? nomeValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'O nome do estado é obrigatório';
    }
    return null;
  }

  String? ufValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'A sigla (UF) é obrigatória';
    }
    if (value.trim().length != 2) {
      return 'A UF deve conter exatamente 2 letras';
    }
    return null;
  }

  @override
  Future<ResultData> save() async {
    final estado = estadoViewModel.toEntity();
    if (estado.id <= 0) {
      return await repository.insert(estado);
    } else {
      return await repository.update(estado);
    }
  }

  @override
  Future<void> reset() async {
    estadoViewModel.reset();
  }

  @override
  Future<ResultData> delete() async {
    final entity = estadoViewModel.toEntity();
    if (entity.id >= 0) {
      return await repository.delete(entity);
    }
    return ResultData();
  }

  @override
  Future<ResultData> findAll() async {
    return await repository.findAll(Estado());
  }

  @override
  void fromEntity(Estado entity) {
    estado = entity;
    return estadoViewModel.fromEntity(entity);
  }
}
