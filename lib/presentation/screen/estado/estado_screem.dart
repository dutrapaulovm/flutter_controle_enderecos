import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/estado_controller.dart';
import 'package:flutter_controle_enderecos/presentation/screen/estado/estado_form_widget.dart';

class EstadoScreen extends StatelessWidget {
  static const String routeName = '/estado_screen';

  const EstadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final GlobalKey<EstadoFormWidgetState> formKey =
        GlobalKey<EstadoFormWidgetState>();

    final EstadoController controller = EstadoController();

    void onSubmit() {
      formKey.currentState?.submit();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: onSubmit, icon: const Icon(Icons.check))
        ],
        title: Text(
          controller.estado == null ? 'Novo Estado' : 'Editar Estado',
        ),
      ),
      body: EstadoFormWidget(
        estadoController: controller,
        key: formKey,
        onSubmit: onSubmit,
      ),
    );
  }
}
