import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/estado_controller.dart';
import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/presentation/app/app_form.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';

class EstadoFormWidget extends StatefulWidget {
  final EstadoController controller;
  final VoidCallback onSubmit;

  const EstadoFormWidget({
    required this.controller,
    required this.onSubmit,
    super.key,
  });

  @override
  State<EstadoFormWidget> createState() => EstadoFormWidgetState();
}

class EstadoFormWidgetState extends State<EstadoFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void submit() async {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    setState(() => isLoading = true);

    final result = await widget.controller.save();

    if (!mounted) return;

    if (!result.success!) {
      showErrorDialog(result, context);
      setState(() => isLoading = false);
      return;
    }
    setState(() => isLoading = false);
    await showMessageDialog("Salvo com sucesso", context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (isLoading) return const Center(child: CircularProgress());
    Widget spacer(double factor) => SizedBox(height: screenHeight * factor);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppForm(
        focusNode: FocusScopeNode(),
        formKey: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            spacer(0.10),
            InputFormField(
              controller: widget.controller.estadoViewModel.nomeController,
              validator: widget.controller.nomeValidator,
              labelText: 'Nome do Estado',
              maxLength: 60,
              textInputAction: TextInputAction.next,
            ),
            spacer(0.025),
            InputFormField(
              controller: widget.controller.estadoViewModel.ufController,
              validator: widget.controller.ufValidator,
              labelText: 'Sigla (UF)',
              textCapitalization: TextCapitalization.characters,
              maxLength: 2,
              textInputAction: TextInputAction.done,
            ),
            /* spacer(0.05),
            FormButton(
              text: widget.controller.estado == null ? 'Salvar' : 'Atualizar',
              onPressed: submit,
            ),*/
          ],
        ),
      ),
    );
  }
}
