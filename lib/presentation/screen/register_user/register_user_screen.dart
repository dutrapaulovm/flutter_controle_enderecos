import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/controllers.dart';
import 'package:flutter_controle_enderecos/presentation/screen/register_user/register_user_form_widget.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';

class RegisterUserScreen extends StatefulWidget {
  static const String routeName = "/register_user_screen";

  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen>
    with TickerProviderStateMixin {
  UserController registerUserController =
      ServiceLocator.instance.getService(ServiceKeys.controllerUser);

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
