import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/infra/fake/estado_fake_repository.dart';

class EstadoController {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController ufController = TextEditingController();

  final EstadoFakeRepository repository = EstadoFakeRepository();

  Estado? estado;

  EstadoController({this.estado}) {
    if (estado != null) {
      nomeController.text = estado!.nome!;
      ufController.text = estado!.uf!;
    }
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

  Future<void> salvarOuAtualizarEstado() async {
    final _estado = Estado(
      id: estado?.id, // se for edição, mantém o ID
      nome: nomeController.text.trim(),
      uf: ufController.text.trim().toUpperCase(),
    );

    if (estado == null) {
      await repository.insert(_estado);
    } else {
      await repository.update(_estado);
    }
  }

  void reset() {
    nomeController.clear();
    ufController.clear();
    estado = null;
  }
}
