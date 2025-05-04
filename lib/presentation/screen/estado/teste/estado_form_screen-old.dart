/*import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/estado_controller.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/presentation/screen/estado/estado_form_widget.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';
import 'package:flutter_controle_enderecos/utils/util.dart';

class EstadoFormScreen extends StatefulWidget {
  static const String routeName = '/estado_screen';

  const EstadoFormScreen({super.key});

  @override
  State<StatefulWidget> createState() => _EstadoScrenState();
}

class _EstadoScrenState extends State<EstadoFormScreen> {
  final GlobalKey<EstadoFormWidgetState> formKey =
      GlobalKey<EstadoFormWidgetState>();

  final EstadoController controller =
      ServiceLocator.instance.getService(ServiceKeys.controllerEstado);

  @override
  void initState() {
    super.initState();
    // Dê um pequeno atraso para garantir que o contexto está pronto
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as Bundle;
      final estado = args.get(Argument.entity) as Estado;
      controller.fromEntity(estado);
      setState(() {}); // Força o rebuild com título atualizado
    });
  }

  void onSubmit() {
    formKey.currentState?.submit();
  }

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
      body: EstadoFormWidget(
          controller: controller, key: formKey, onSubmit: onSubmit),
    );
  }
}
*/