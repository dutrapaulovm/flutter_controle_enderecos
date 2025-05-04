import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/domain/models/cidade.dart';

class CidadeViewModel {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController ufController = TextEditingController();
  final TextEditingController ibgController = TextEditingController();

  int? id = 0;

  CidadeViewModel({this.id = 0});

  void fromEntity(Cidade cidade) {
    id = cidade.id;
    nomeController.text = cidade.nome ?? '';
    ufController.text = cidade.uf ?? '';
    ibgController.text = cidade.ibge ?? '';
  }

  Cidade toEntity() {
    return Cidade(
        id: id!,
        nome: nomeController.text,
        uf: ufController.text,
        ibge: ibgController.text);
  }

  void reset() {
    nomeController.clear();
    ufController.clear();
    ibgController.clear();
  }

  void dispose() {
    nomeController.dispose();
    ufController.dispose();
    ibgController.dispose();
  }

  @override
  String toString() {
    return 'CidadeViewModel(id: $id, nome: ${nomeController.text}, uf: ${ufController.text})';
  }
}
