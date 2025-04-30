// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/domain/models/entity.dart';
import 'package:flutter_controle_enderecos/domain/repository/repository.dart';

class BaseState<T extends StatefulWidget, E extends Entity<E>>
    extends State<T> {
  bool isLoading = false;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  IRepository? repository;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
