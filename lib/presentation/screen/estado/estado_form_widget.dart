import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/estado_controller.dart';
import 'package:flutter_controle_enderecos/presentation/app/app_form.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';

// ... imports mantidos

class EstadoFormWidget extends StatefulWidget {
  final EstadoController estadoController;
  final VoidCallback onSubmit;

  const EstadoFormWidget({
    required this.estadoController,
    required this.onSubmit,
    super.key,
  });

  @override
  State<EstadoFormWidget> createState() => EstadoFormWidgetState();
}

class EstadoFormWidgetState extends State<EstadoFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void submit() async {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    setState(() => isLoading = true);

    await widget.estadoController.save();

    if (!mounted) return;

    setState(() => isLoading = false);
    widget.onSubmit();
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
            /* spacer(0.10),
            Text(
              widget.estadoController.estado == null
                  ? 'Cadastro de Estado'
                  : 'Editar Estado',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),*/
            spacer(0.10),
            InputFormField(
              controller: widget.estadoController.nomeController,
              validator: widget.estadoController.nomeValidator,
              labelText: 'Nome do Estado',
              textInputAction: TextInputAction.next,
            ),
            spacer(0.025),
            InputFormField(
              controller: widget.estadoController.ufController,
              validator: widget.estadoController.ufValidator,
              labelText: 'Sigla (UF)',
              textCapitalization: TextCapitalization.characters,
              maxLength: 2,
              textInputAction: TextInputAction.done,
            ),
            spacer(0.05),
            FormButton(
              text: widget.estadoController.estado == null
                  ? 'Salvar'
                  : 'Atualizar',
              onPressed: submit,
            ),
          ],
        ),
      ),
    );
  }
}
