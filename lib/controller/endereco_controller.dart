import 'package:flutter_controle_enderecos/controller/controller.dart';
import 'package:flutter_controle_enderecos/domain/models/endereco.dart';
import 'package:flutter_controle_enderecos/domain/repository/endereco_repository.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/view_model/endereco_view_model.dart';

class EnderecoController extends Controller<Endereco> {
  final EnderecoViewModel enderecoViewModel = EnderecoViewModel();
  final EnderecoRepository repository;

  Endereco? endereco;

  EnderecoController({required this.repository, this.endereco}) {
    if (endereco != null) {
      enderecoViewModel.fromEntity(endereco!);
    }
  }

  @override
  String get title {
    return endereco == null ? 'Novo Endereço' : 'Editar Endereço';
  }

  @override
  Future<ResultData> save() async {
    final endereco = enderecoViewModel.toEntity();
    if (endereco.id <= 0) {
      return await repository.insert(endereco);
    } else {
      return await repository.update(endereco);
    }
  }

  @override
  Future<void> reset() async {
    enderecoViewModel.reset();
  }

  @override
  Future<ResultData> delete() async {
    final entity = enderecoViewModel.toEntity();
    if (entity.id > 0) {
      return await repository.delete(entity);
    }
    return ResultData();
  }

  @override
  Future<ResultData> findAll() async {
    return await repository.findAll(Endereco());
  }

  @override
  void fromEntity(Endereco entity) {
    endereco = entity;
    enderecoViewModel.fromEntity(entity);
  }
}
