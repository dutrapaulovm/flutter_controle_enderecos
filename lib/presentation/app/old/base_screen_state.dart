/*import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/controller.dart';
import 'package:flutter_controle_enderecos/domain/models/entity.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';
import 'package:flutter_controle_enderecos/utils/util.dart';

abstract class BaseScreenState<T extends StatefulWidget, E extends Entity<E>,
    C extends Controller<E>> extends State<T> {
  late C controller;

  @override
  void initState() {
    super.initState();
    controller =
        ServiceLocator.instance.getService(ServiceKeys.controllerEstado);
    // Dê um pequeno atraso para garantir que o contexto está pronto
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args != null) {
        Bundle bundle = args as Bundle;
        E estado = bundle.get(Argument.entity) as E;
        controller.fromEntity(estado);
        setState(() {}); // Força o rebuild com título atualizado
      }
    });
  }

  void onSubmit();

  Widget buildForm(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: onSubmit, icon: const Icon(Icons.check))
        ],
        title: Text(
          controller.title,
        ),
      ),
      body: buildForm(context),
    );
  }
}
*/