import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/cidade_controller.dart';
import 'package:flutter_controle_enderecos/domain/models/cidade.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/presentation/app/generic_form_screen.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';

class CidadeFormScreen extends StatefulWidget {
  static const String routeName = '/cidade_screen';

  const CidadeFormScreen({
    super.key,
  });

  @override
  State<CidadeFormScreen> createState() => CidadeFormScreenState();
}

class CidadeFormScreenState extends State<CidadeFormScreen> {
  final CidadeController controller =
      ServiceLocator.instance.getService(ServiceKeys.controllerCidade);

  final GlobalKey<GenericFormScreenState<Cidade, CidadeController>>
      _formScreenKey = GlobalKey();

  Future<ResultData> onActionSubmit() async {
    final result = await controller.save();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GenericFormScreen<Cidade, CidadeController>(
      key: _formScreenKey,
      controller: controller,
      title: controller.title,
      onActionSubmit: onActionSubmit,
      buildForm: () => buildCidadeForm(),
      onSuccess: () {
        Navigator.pop(context, true);
      },
    );
  }

  Widget buildCidadeForm() {
    //final screenHeight = MediaQuery.of(context).size.height;
    //if (isLoading) return const Center(child: CircularProgress());
    //Widget spacer(double factor) => SizedBox(height: screenHeight * factor);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        spacer(0.10),
        InputFormField(
          controller: controller.cidadeViewModel.nomeController,
          validator: controller.nomeValidator,
          labelText: 'Nome do Cidade',
          maxLength: 60,
          textInputAction: TextInputAction.next,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.cidadeViewModel.ufController,
          validator: controller.ufValidator,
          labelText: 'Sigla (UF)',
          textCapitalization: TextCapitalization.characters,
          maxLength: 2,
          textInputAction: TextInputAction.next,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.cidadeViewModel.ibgeController,
          validator: controller.ibgeValidator,
          labelText: 'IBGE',
          textCapitalization: TextCapitalization.characters,
          maxLength: 10,
          textInputAction: TextInputAction.done,
        ),
        spacer(0.05),
        FormButton(
          text: controller.cidade == null ? 'Salvar' : 'Atualizar',
          onPressed: () {
            _formScreenKey.currentState?.submitForm();
          },
        ),
      ],
    );
  }
}
