import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/register_user_controller.dart';
import 'package:flutter_controle_enderecos/presentation/screen/register_user/register_user_form_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "/register_user_screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  RegisterUserController registerUserController = RegisterUserController();

  bool isLoading = false;
  void submit() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RegisterUserFormWidget(
          controller: registerUserController,
          onSubmit: submit,
        ),
      ),
    );
  }
}
