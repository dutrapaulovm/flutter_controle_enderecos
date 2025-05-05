import 'package:flutter_controle_enderecos/controller/controllers.dart';
import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:flutter_controle_enderecos/service/user_service.dart';
import 'package:flutter_controle_enderecos/utils/utils.dart' as util;
import 'package:flutter_controle_enderecos/view_model/login_view_model.dart';
import 'package:flutter_controle_enderecos/view_model/usuario_view_model.dart';

class UserController extends Controller<Usuario> {
  LoginViewModel loginViewModel = LoginViewModel();
  UsuarioViewModel usuarioViewModel = UsuarioViewModel();
  final LoginService _loginService = LoginService();

  void init() {
    loginViewModel.reset();
  }

  @override
  Future<ResultData> save() async {
    Usuario user = usuarioViewModel.toEntity();
    user.id = -1;
    final resultApplication = await _loginService.signIn(user);
    return resultApplication;
  }

  // Método para realizar o login
  Future<ResultData> login() async {
    final resultApplication = await _loginService.login(
      loginViewModel.loginController.text,
      loginViewModel.passwordController.text,
    );

    return resultApplication;
  }

  String? fieldValidator(String? value) {
    if (util.isEmpty(value)) {
      return 'Campo obrigatório.';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    String pass = usuarioViewModel.passwordController.text;
    String confirmPass = usuarioViewModel.confirmPasswordController.text;
    if (pass != confirmPass) {
      return "Senhas devem ser iguais!";
    }
    return fieldValidator(value);
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Campo obrigatório.';
    if (!util.emailValidator(value)) return 'Email inválido!';
    return null;
  }

  String? loginValidator(String? value) {
    if (value == null || value.isEmpty) return 'Campo obrigatório.';
    if (!util.isValidLogin(value)) return 'Nome de usuário inválido!';
    return null;
  }

  bool validate() {
    return validLogin() && validPassword();
  }

  bool validLogin() {
    final text = loginViewModel.loginController.text;
    return text.isNotEmpty;
  }

  bool validPassword() {
    final text = loginViewModel.passwordController.text;
    return text.isNotEmpty;
  }

  @override
  Future<void> reset() async {
    loginViewModel.reset();
  }

  @override
  Future<ResultData> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ResultData> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  void fromEntity(Usuario entity) {
    // TODO: implement fromEntity
  }

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();
}
