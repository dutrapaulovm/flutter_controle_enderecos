import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';

class EstadoViewModel {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController ufController = TextEditingController();

  int? id = 0;

  EstadoViewModel({this.id = 0});

  void fromEntity(Estado estado) {
    id = estado.id;
    nomeController.text = estado.nome ?? '';
    ufController.text = estado.uf ?? '';
  }

  Estado toEntity() {
    return Estado(id: id!, nome: nomeController.text, uf: ufController.text);
  }

  void reset() {
    nomeController.clear();
    ufController.clear();
  }

  void dispose() {
    nomeController.dispose();
    ufController.dispose();
  }

  @override
  String toString() {
    return 'EstadoViewModel(id: $id, nome: ${nomeController.text}, salt: ${ufController.text})';
  }
}
