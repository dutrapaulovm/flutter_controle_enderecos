import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/usuario_controller.dart';
import 'package:flutter_controle_enderecos/presentation/screen/home/home_screen.dart';
import 'package:flutter_controle_enderecos/presentation/screen/login/login_form_widgets.dart';
import 'package:flutter_controle_enderecos/service_locator.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/';

  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  UsuarioController loginController =
      ServiceLocator.instance.getService(ServiceKeys.controllerUser.name);

  bool isLoading = false;
  void submit() async {
    Navigator.pop(context);
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    loginController.init();
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
