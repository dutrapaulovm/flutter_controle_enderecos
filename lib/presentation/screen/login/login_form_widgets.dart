import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/login_controller.dart';
import 'package:flutter_controle_enderecos/presentation/app/app_form.dart';
import 'package:flutter_controle_enderecos/presentation/screen/register_user/register_user_screen.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';

class LoginFormWidget extends StatefulWidget {
  final LoginController loginController;
  final VoidCallback onSubmit;

  const LoginFormWidget({
    required this.loginController,
    required this.onSubmit,
    super.key,
  });

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool isLoading = false;

  ///Valida todos os dados do formulário de login
  void submit() async {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    setState(() => isLoading = true);

    var result = await widget.loginController.login();

    // Verifica se o widget ainda está montado
    if (!mounted) return;

    if (!result.success!) {
      showErrorDialog(result, context);

      setState(() {
        isLoading = false;
        widget.loginController.reset();
      });

      return;
    }
    widget.onSubmit();
  }

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
        formKey: _formKey,
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
              controller: widget.loginController.loginController,
              validator: widget.loginController.loginValidator,
              labelText: 'Email ou Usuário',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            spacer(0.025),
            InputFormField(
              controller: widget.loginController.passwordController,
              validator: widget.loginController.passwordValidator,
              labelText: 'Senha',
              obscureText: _obscurePassword,
              textInputAction: TextInputAction.done,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
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
            FormButton(text: 'Entrar', onPressed: widget.onSubmit),
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
