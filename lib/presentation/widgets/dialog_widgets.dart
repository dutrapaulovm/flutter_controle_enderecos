import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';

void showErrorDialog(ResultData<dynamic> result, BuildContext context) {
  showDialog(
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
