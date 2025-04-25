import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/service/login_service.dart';
import 'package:flutter_controle_enderecos/utils/utils.dart';

class LoginController {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final LoginService _loginService = LoginService();

  // Método para realizar o login
  Future<ResultData> login() async {
    final resultApplication = await _loginService.login(
      loginController.text,
      passwordController.text,
    );

    return resultApplication;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório.';
    }

    return null;
  }

  String? loginValidator(String? value) {
    if (value == null || value.isEmpty) return 'Campo obrigatório.';
    if (!isValidLogin(value)) return 'Nome de usuário inválido!';
    return null;
  }

  bool validate() {
    return validLogin() && validPassword();
  }

  bool validLogin() {
    final text = loginController.text;
    return text.isNotEmpty;
  }

  bool validPassword() {
    final text = passwordController.text;
    return text.isNotEmpty;
  }

  void reset() {
    loginController.clear();
    passwordController.clear();
  }
}
