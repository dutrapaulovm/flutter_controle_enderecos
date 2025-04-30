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
