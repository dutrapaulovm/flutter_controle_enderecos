import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/controllers.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/presentation/app/generic_form_screen.dart';

class EstadoFormScreenNew extends StatefulWidget {
  final EstadoController controller;

  const EstadoFormScreenNew({
    super.key,
    required this.controller,
  });

  @override
  State<EstadoFormScreenNew> createState() => _EstadoFormScreenNewState();
}

class _EstadoFormScreenNewState extends State<EstadoFormScreenNew> {
  @override
  Widget build(BuildContext context) {
    return GenericFormScreen<Estado, EstadoController>(
      controller: widget.controller,
      title: widget.controller.title,
      buildForm: () {
        return Container();
      },
    );
  }
}
