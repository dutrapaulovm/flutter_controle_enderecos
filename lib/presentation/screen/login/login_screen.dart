import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/login_controller.dart';
import 'package:flutter_controle_enderecos/infra/result_application.dart';
import 'package:flutter_controle_enderecos/presentation/screen/home_screen.dart';
import 'package:flutter_controle_enderecos/presentation/screen/login/login_screen_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  LoginController loginController = LoginController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Define quando exibirá o CircularProgressIndicator
  bool isLoading = false;

  ///Valida todos os dados do formulário de login
  void submit() async {
    final form = formKey.currentState;
    if (form == null || !form.validate()) return;

    setState(() => isLoading = true);

    var result = await loginController.login();

    // Verifica se o widget ainda está montado
    if (!mounted) return;

    if (!result.success!) {
      showErrorDialog(result);

      setState(() {
        isLoading = false;
        loginController.reset();
      });

      return;
    }

    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  void showErrorDialog(ResultApplication<dynamic> result) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: Text(result.message!),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginFormWidget(
          loginController: loginController,
          formKey: formKey,
          onSubmit: submit,
          isLoading: isLoading,
        ),
      ),
    );
  }
}
