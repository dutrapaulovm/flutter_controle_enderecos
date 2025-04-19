import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/presentation/screen/home_screen.dart';
import 'package:flutter_controle_enderecos/presentation/screen/login/login_screen.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';

void main() {
  init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: routes, debugShowCheckedModeBanner: false);
  }
}

var routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  "/": (context) => const LoginScreen()
};
