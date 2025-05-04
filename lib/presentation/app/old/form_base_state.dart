import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/controllers.dart';
import 'package:flutter_controle_enderecos/domain/models/entity.dart';
import 'package:flutter_controle_enderecos/presentation/app/app_form.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';
import 'package:flutter_controle_enderecos/utils/utils.dart';
/*
class FormBaseState<T extends StatefulWidget, E extends Entity<E>>
    extends State<T> {
  final Controller controller;
  final VoidCallback onSubmit;
  final Widget? child;
  bool isLoading = false;
  FormBaseState({required this.controller, required this.onSubmit, this.child});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submit() async {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    setState(() => isLoading = true);

    final result = await controller.save();

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
    if (isLoading) return const Center(child: CircularProgress());

    final Bundle args = ModalRoute.of(context)!.settings.arguments as Bundle;
    E entity = args.get(Argument.entity) as E;
    controller.fromEntity(entity);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppForm(
        focusNode: FocusScopeNode(),
        formKey: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [if (child != null) child!],
        ),
      ),
    );
  }
}
*/