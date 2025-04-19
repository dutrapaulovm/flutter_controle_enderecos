import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/login_controller.dart';
import 'package:flutter_controle_enderecos/presentation/app/app_form.dart';
import 'package:flutter_controle_enderecos/presentation/screen/register_screen.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';

class LoginFormWidget extends StatelessWidget {
  final LoginController loginController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSubmit;
  final bool isLoading;
  const LoginFormWidget({
    required this.loginController,
    required this.formKey,
    required this.onSubmit,
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    if (isLoading) {
      return const Center(child: CircularProgress());
    }

    Widget spacer(double factor) => SizedBox(height: screenHeight * factor);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppForm(
        focusNode: FocusScopeNode(),
        formKey: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            spacer(0.12),
            const Text(
              'Bem-vindo,',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            spacer(0.01),
            Text(
              'Entre com Login e Senha para continuar!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            spacer(0.12),
            InputFormField(
              controller: loginController.loginController,
              validator: loginController.loginValidator,
              labelText: 'Email ou Usuário',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            spacer(0.025),
            InputFormField(
              controller: loginController.passwordController,
              validator: loginController.passwordValidator,
              labelText: 'Senha',
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Esqueceu a Senha!',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            spacer(0.075),
            FormButton(text: 'Entrar', onPressed: onSubmit),
            spacer(0.15),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RegisterScreen()),
              ),
              child: RichText(
                text: const TextSpan(
                  text: "Eu sou um novo usuário, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Registrar',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
