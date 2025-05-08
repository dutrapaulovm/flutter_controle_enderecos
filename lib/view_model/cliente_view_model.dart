import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/domain/models/cliente.dart';
import 'package:flutter_controle_enderecos/view_model/entity_view_modal.dart';

class ClienteViewModel extends EntityViewModel<Cliente> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController ruaController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController idCidadeController = TextEditingController();
  final TextEditingController nomeCidadeController = TextEditingController();
  final TextEditingController idEstadoController = TextEditingController();
  final TextEditingController nomeEstadoController = TextEditingController();
  final TextEditingController ufController = TextEditingController();

  int? id = 0;

  ClienteViewModel({this.id = 0});

  void fromEntity(Cliente cliente) {
    id = cliente.id;
    nomeController.text = cliente.nome ?? '';
    emailController.text = cliente.email ?? '';
    telefoneController.text = cliente.telefone ?? '';
    ruaController.text = cliente.rua ?? '';
    bairroController.text = cliente.bairro ?? '';
    numeroController.text = cliente.numero ?? '';
    cepController.text = cliente.cep ?? '';
    idCidadeController.text = cliente.idCidade?.toString() ?? '';
    nomeCidadeController.text = cliente.nomeCidade ?? '';
    idEstadoController.text = cliente.idEstado?.toString() ?? '';
    nomeEstadoController.text = cliente.nomeEstado ?? '';
    ufController.text = cliente.uf ?? '';
  }

  Cliente toEntity() {
    return Cliente(
      id: id!,
      nome: nomeController.text,
      email: emailController.text,
      telefone: telefoneController.text,
      rua: ruaController.text,
      bairro: bairroController.text,
      numero: numeroController.text,
      cep: cepController.text,
      idCidade: int.tryParse(idCidadeController.text),
      nomeCidade: nomeCidadeController.text,
      idEstado: int.tryParse(idEstadoController.text),
      nomeEstado: nomeEstadoController.text,
      uf: ufController.text,
    );
  }

  void reset() {
    nomeController.clear();
    emailController.clear();
    telefoneController.clear();
    ruaController.clear();
    bairroController.clear();
    numeroController.clear();
    cepController.clear();
    idCidadeController.clear();
    nomeCidadeController.clear();
    idEstadoController.clear();
    nomeEstadoController.clear();
    ufController.clear();
  }

  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    ruaController.dispose();
    bairroController.dispose();
    numeroController.dispose();
    cepController.dispose();
    idCidadeController.dispose();
    nomeCidadeController.dispose();
    idEstadoController.dispose();
    nomeEstadoController.dispose();
    ufController.dispose();
  }

  @override
  String toString() {
    return 'ClienteViewModel(id: $id, nome: ${nomeController.text}, email: ${emailController.text}, cidade: ${nomeCidadeController.text}, estado: ${ufController.text})';
  }
}
