import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/domain/models/entity.dart';
import 'package:flutter_controle_enderecos/presentation/app/base_state.dart';

class BaseFormState<T extends StatefulWidget, E extends Entity<E>>
    extends BaseState<T, E> {
  void onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      actions: [IconButton(onPressed: onSubmit, icon: const Icon(Icons.check))],
      title: const Text(""
          //        controller.estado == null ? 'Novo Estado' : 'Editar Estado',
          ),
    ));
  }
}
