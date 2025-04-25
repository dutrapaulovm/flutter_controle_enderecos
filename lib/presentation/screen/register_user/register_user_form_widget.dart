import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/register_user_controller.dart';
import 'package:flutter_controle_enderecos/presentation/app/app_form.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';

class RegisterUserFormWidget extends StatefulWidget {
  final RegisterUserController controller;
  final VoidCallback onSubmit;

  const RegisterUserFormWidget({
    required this.controller,
    required this.onSubmit,
    super.key,
  });

  @override
  State<RegisterUserFormWidget> createState() => _RegisterUserFormWidgetState();
}

class _RegisterUserFormWidgetState extends State<RegisterUserFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool isLoading = false;

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
                  ListView(
                    children: [
                      spacer(.12),
                      const Text(
                        'Criar um conta,',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      spacer(.01),
                      Text(
                        'Registre para entrar!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(.6),
                        ),
                      ),
                      spacer(.12),
                      InputFormField(
                        controller: widget.controller.nomeController,
                        labelText: 'Nome',
                        textInputAction: TextInputAction.next,
                        autoFocus: true,
                      ),
                      InputFormField(
                        controller: widget.controller.loginController,
                        labelText: 'Login',
                        textInputAction: TextInputAction.next,
                        autoFocus: true,
                      ),
                      spacer(.025),
                      InputFormField(
                        controller: widget.controller.emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autoFocus: true,
                      ),
                      spacer(.025),
                      InputFormField(
                        controller: widget.controller.passwordController,
                        labelText: 'Senha',
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.next,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      spacer(.025),
                      InputFormField(
                        controller: widget.controller.confirmPasswordController,
                        labelText: 'Confirmar Senha',
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.done,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      spacer(.075),
                      FormButton(
                        text: 'Registrar',
                        onPressed: widget.onSubmit,
                      ),
                      spacer(
                        .125,
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: RichText(
                          text: const TextSpan(
                            text: "Já estou registrado, ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Logar',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ])));
  }
}
