import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/domain/models/cidade.dart';
import 'package:flutter_controle_enderecos/view_model/entity_view_modal.dart';

class CidadeViewModel extends EntityViewModel<Cidade> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController ufController = TextEditingController();
  final TextEditingController ibgeController = TextEditingController();

  int? id = 0;

  CidadeViewModel({this.id = 0});

  @override
  void fromEntity(Cidade cidade) {
    id = cidade.id;
    nomeController.text = cidade.nome ?? '';
    ufController.text = cidade.uf ?? '';
    ibgeController.text = cidade.ibge ?? '';
  }

  @override
  Cidade toEntity() {
    return Cidade(
        id: id!,
        nome: nomeController.text,
        uf: ufController.text,
        ibge: ibgeController.text);
  }

  @override
  void reset() {
    nomeController.clear();
    ufController.clear();
    ibgeController.clear();
  }

  @override
  void dispose() {
    nomeController.dispose();
    ufController.dispose();
    ibgeController.dispose();
  }

  @override
  String toString() {
    return 'CidadeViewModel(id: $id, nome: ${nomeController.text}, uf: ${ufController.text})';
  }
}
