import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/presentation/screen/screens.dart';

Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  UsuarioFormScreen.routeName: (context) => const UsuarioFormScreen(),
  EstadoFormScreen.routeName: (context) => const EstadoFormScreen(),
  CidadeFormScreen.routeName: (context) => const CidadeFormScreen(),
  ClienteFormScreen.routeName: (context) => const ClienteFormScreen(),
  RegisterUserFormScreenStart.routeName: (context) =>
      const RegisterUserFormScreenStart(),
  ChangePasswordFormScreen.routeName: (context) =>
      const ChangePasswordFormScreen(),
  SearchUsuarioScreen.routeName: (context) => const SearchUsuarioScreen(),
  SearchEstadoScreen.routeName: (context) => const SearchEstadoScreen(),
  SearchCidadeScreen.routeName: (context) => const SearchCidadeScreen(),
  SearchClienteScreen.routeName: (context) => const SearchClienteScreen()
};
