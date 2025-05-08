import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/domain/models/endereco.dart';

class EnderecoViewModel {
  final TextEditingController idController = TextEditingController();
  final TextEditingController idClienteController = TextEditingController();
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

  EnderecoViewModel({this.id = 0});

  void fromEntity(Endereco endereco) {
    id = endereco.id;
    idClienteController.text = endereco.idCliente?.toString() ?? '';
    ruaController.text = endereco.rua ?? '';
    bairroController.text = endereco.bairro ?? '';
    numeroController.text = endereco.numero ?? '';
    cepController.text = endereco.cep ?? '';
    idCidadeController.text = endereco.idCidade?.toString() ?? '';
    nomeCidadeController.text = endereco.nomeCidade ?? '';
    idEstadoController.text = endereco.idEstado?.toString() ?? '';
    nomeEstadoController.text = endereco.nomeEstado ?? '';
    ufController.text = endereco.uf ?? '';
  }

  Endereco toEntity() {
    return Endereco(
      id: id!,
      idCliente: int.tryParse(idClienteController.text),
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
    idClienteController.clear();
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
    idClienteController.dispose();
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
    return 'EnderecoViewModel(id: $id, rua: ${ruaController.text}, cidade: ${nomeCidadeController.text}, estado: ${ufController.text})';
  }
}
