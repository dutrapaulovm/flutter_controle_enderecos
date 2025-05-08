import 'package:flutter_controle_enderecos/controller/controller.dart';
import 'package:flutter_controle_enderecos/domain/models/cliente.dart';
import 'package:flutter_controle_enderecos/domain/repository/cliente_repository.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/view_model/cliente_view_model.dart';

class ClienteController extends Controller<Cliente> {
  final ClienteViewModel clienteViewModel = ClienteViewModel();
  final ClienteRepository repository;

  Cliente? cliente;

  ClienteController({required this.repository, this.cliente}) {
    if (cliente != null) {
      clienteViewModel.fromEntity(cliente!);
    }
  }

  @override
  String get title {
    return cliente == null ? 'Novo Cliente' : 'Editar Cliente';
  }

  @override
  Future<ResultData> save() async {
    final cliente = clienteViewModel.toEntity();
    if (cliente.id <= 0) {
      return await repository.insert(cliente);
    } else {
      return await repository.update(cliente);
    }
  }

  @override
  Future<void> reset() async {
    clienteViewModel.reset();
  }

  @override
  Future<ResultData> delete() async {
    final entity = clienteViewModel.toEntity();
    if (entity.id > 0) {
      return await repository.delete(entity);
    }
    return ResultData();
  }

  @override
  Future<ResultData> findAll() async {
    return await repository.findAll(Cliente());
  }

  @override
  void fromEntity(Cliente entity) {
    cliente = entity;
    clienteViewModel.fromEntity(entity);
  }
}
