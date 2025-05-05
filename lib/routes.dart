import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/presentation/screen/screens.dart';

Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  EstadoFormScreen.routeName: (context) => const EstadoFormScreen(),
  CidadeFormScreen.routeName: (context) => const CidadeFormScreen(),
  RegisterUserScreen.routeName: (context) => const RegisterUserScreen(),
  SearchEstadoScreen.routeName: (context) => const SearchEstadoScreen(),
  SearchCidadeScreen.routeName: (context) => const SearchCidadeScreen()
};
