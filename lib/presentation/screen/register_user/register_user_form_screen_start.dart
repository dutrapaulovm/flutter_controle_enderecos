import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/controllers.dart';
import 'package:flutter_controle_enderecos/presentation/screen/register_user/register_user_form_widget.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';

class RegisterUserFormScreenStart extends StatefulWidget {
  static const String routeName = "/register_user_screen";

  const RegisterUserFormScreenStart({super.key});

  @override
  State<RegisterUserFormScreenStart> createState() =>
      _RegisterUserFormScreenStartState();
}

class _RegisterUserFormScreenStartState
    extends State<RegisterUserFormScreenStart> with TickerProviderStateMixin {
  UsuarioController registerUserController =
      ServiceLocator.instance.getService(ServiceKeys.controllerUser.name);

  bool isLoading = false;

  void submit() async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RegisterUserFormWidget(
          userController: registerUserController,
          onSubmit: submit,
        ),
      ),
    );
  }
}
