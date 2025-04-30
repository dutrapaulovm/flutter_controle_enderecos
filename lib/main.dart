import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/routes.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';

void main() {
  initRepositories(mode: RepositoryMode.fake);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: routes, debugShowCheckedModeBanner: false);
  }
}
