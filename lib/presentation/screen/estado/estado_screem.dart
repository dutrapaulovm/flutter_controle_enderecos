import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/estado_controller.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/presentation/screen/estado/estado_form_widget.dart';

class EstadoScreen extends StatelessWidget {
  static const String routeName = '/estado';

  final Estado? estadoEditando;

  const EstadoScreen({super.key, this.estadoEditando});

  @override
  Widget build(BuildContext context) {
    final EstadoController controller = EstadoController();

    void onSubmit() {
      Navigator.pop(context, true); // Retorna true para indicar sucesso
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          estadoEditando == null ? 'Novo Estado' : 'Editar Estado',
        ),
      ),
      body: EstadoFormWidget(
        estadoController: controller,
        onSubmit: onSubmit,
      ),
    );
  }
}
