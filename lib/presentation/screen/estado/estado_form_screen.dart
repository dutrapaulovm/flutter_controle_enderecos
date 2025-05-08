import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/estado_controller.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/presentation/app/generic_form_screen.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';
import 'package:flutter_controle_enderecos/utils/utils.dart' as util;

class EstadoFormScreen extends StatefulWidget {
  static const String routeName = '/estado_screen';

  const EstadoFormScreen({
    super.key,
  });

  @override
  State<EstadoFormScreen> createState() => EstadoFormScreenState();
}

class EstadoFormScreenState extends State<EstadoFormScreen> {
  final EstadoController controller =
      ServiceLocator.instance.getService(ServiceKeys.controllerEstado.name);

  final GlobalKey<GenericFormScreenState<Estado, EstadoController>>
      _formScreenKey = GlobalKey();

  Future<ResultData> onActionSubmit() async {
    final result = await controller.save();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GenericFormScreen<Estado, EstadoController>(
      key: _formScreenKey,
      controller: controller,
      title: controller.title,
      onActionSubmit: onActionSubmit,
      buildForm: () => buildEstadoForm(),
      onSuccess: () {
        Navigator.pop(context);
      },
    );
  }

  Widget buildEstadoForm() {
    final screenHeight = MediaQuery.of(context).size.height;
    Widget spacer(double factor) => SizedBox(height: screenHeight * factor);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        spacer(0.10),
        InputFormField(
          controller: controller.estadoViewModel.nomeController,
          validator: util.fieldValidator,
          labelText: 'Nome do Estado',
          maxLength: 60,
          textInputAction: TextInputAction.next,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.estadoViewModel.ufController,
          validator: util.ufValidator,
          labelText: 'Sigla (UF)',
          textCapitalization: TextCapitalization.characters,
          maxLength: 2,
          textInputAction: TextInputAction.done,
        ),
        spacer(0.05),
        FormButton(
          text: controller.estado == null ? 'Salvar' : 'Atualizar',
          onPressed: () {
            _formScreenKey.currentState?.submitForm();
          },
        ),
      ],
    );
  }
}
