import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/domain/models/entity.dart';

abstract class BaseFormState<T extends StatefulWidget, E extends Entity<E>>
    extends State<T> {
  bool isLoading = false;

  Future<void> _submitForm();

  @override
  Widget build(BuildContext context);
}
