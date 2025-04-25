import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/login_controller.dart';
import 'package:flutter_controle_enderecos/presentation/screen/home/home_screen.dart';
import 'package:flutter_controle_enderecos/presentation/screen/login/login_form_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  LoginController loginController = LoginController();

  bool isLoading = false;
  void submit() async {
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginFormWidget(
          loginController: loginController,
          onSubmit: submit,
        ),
      ),
    );
  }
}
