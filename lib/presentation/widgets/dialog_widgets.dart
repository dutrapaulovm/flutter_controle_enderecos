import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';

Future<void> showMessageDialog(String message, BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Aviso'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}

Future<void> showErrorDialog(
    ResultData<dynamic> result, BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Aviso'),
        content: Text(result.message!),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}

void showExitDialog(BuildContext context, {Function()? onPressed}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Sair'),
      content: const Text('Deseja realmente sair da sessão?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Cancela
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Fecha o dialog
            if (onPressed != null) {
              onPressed.call();
            }
          },
          child: const Text('Sim, sair'),
        ),
      ],
    ),
  );
}
