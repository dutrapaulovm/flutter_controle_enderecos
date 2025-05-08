import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/cliente_controller.dart';
import 'package:flutter_controle_enderecos/domain/models/cliente.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/presentation/app/generic_form_screen.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';
import 'package:flutter_controle_enderecos/utils/formatter/phone_input_formatter.dart';
import 'package:flutter_controle_enderecos/utils/utils.dart' as util;

class ClienteFormScreen extends StatefulWidget {
  static const String routeName = '/cliente_screen';

  const ClienteFormScreen({
    super.key,
  });

  @override
  State<ClienteFormScreen> createState() => ClienteFormScreenState();
}

class ClienteFormScreenState extends State<ClienteFormScreen> {
  final ClienteController controller =
      ServiceLocator.instance.getService(ServiceKeys.controllerCliente.name);

  final GlobalKey<GenericFormScreenState<Cliente, ClienteController>>
      _formScreenKey = GlobalKey();

  Future<ResultData> onActionSubmit() async {
    final result = await controller.save();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GenericFormScreen<Cliente, ClienteController>(
      key: _formScreenKey,
      controller: controller,
      title: controller.title,
      onActionSubmit: onActionSubmit,
      buildForm: () => buildClienteForm(),
      onSuccess: () {
        Navigator.pop(context, true);
      },
    );
  }

  Widget buildClienteForm() {
    final screenHeight = MediaQuery.of(context).size.height;
    Widget spacer(double factor) => SizedBox(height: screenHeight * factor);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        spacer(0.10),
        InputFormField(
          controller: controller.clienteViewModel.nomeController,
          validator: util.fieldValidator,
          labelText: 'Nome do Cliente',
          maxLength: 60,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          autoFocus: true,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.clienteViewModel.emailController,
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: util.emailValidator,
          autoFocus: true,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.clienteViewModel.telefoneController,
          labelText: 'Telefone',
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          validator: util.fieldValidator,
          inputFormatters: [PhoneInputFormatter()],
          autoFocus: true,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.clienteViewModel.ruaController,
          labelText: 'Rua',
          validator: util.fieldValidator,
          textInputAction: TextInputAction.next,
          autoFocus: true,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.clienteViewModel.numeroController,
          labelText: 'Número',
          keyboardType: TextInputType.number,
          validator: util.fieldValidator,
          textInputAction: TextInputAction.next,
          autoFocus: true,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.clienteViewModel.bairroController,
          labelText: 'Bairro',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: util.fieldValidator,
          autoFocus: true,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.clienteViewModel.cepController,
          labelText: 'CEP',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: util.fieldValidator,
          autoFocus: true,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.clienteViewModel.nomeCidadeController,
          labelText: 'Cidade',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: util.fieldValidator,
          autoFocus: true,
        ),
        spacer(0.025),
        InputFormField(
          controller: controller.clienteViewModel.ufController,
          validator: util.ufValidator,
          labelText: 'Sigla (UF)',
          textCapitalization: TextCapitalization.characters,
          maxLength: 2,
          textInputAction: TextInputAction.next,
          autoFocus: true,
        ),
        spacer(0.025),
        FormButton(
          text: controller.cliente == null ? 'Salvar' : 'Atualizar',
          onPressed: () {
            _formScreenKey.currentState?.submitForm();
          },
        ),
      ],
    );
  }
}
