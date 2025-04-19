// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class LoginViewModel {
  TextEditingController? login;
  TextEditingController? password;
  LoginViewModel({
    this.login,
    this.password,
  });
  bool validate() {
    if (login == null || password == null) {
      return false;
    }

    if (login!.text.isEmpty || password!.text.isEmpty) {
      return false;
    }
    return true;
  }

  void reset() {
    login!.text = '';
    password!.text = '';
  }

  bool validLogin() {
    return (login!.text != null && login!.text.isNotEmpty);
  }

  bool validPassword() {
    return (password!.text != null && password!.text.isNotEmpty);
  }

  LoginViewModel copyWith({
    TextEditingController? login,
    TextEditingController? password,
  }) {
    return LoginViewModel(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login!.text,
      'password': password!.text,
    };
  }

  factory LoginViewModel.fromMap(Map<String, dynamic> map) {
    return LoginViewModel(
      login:
          map['login'] != null ? map['login'] as TextEditingController : null,
      password: map['password'] != null
          ? map['password'] as TextEditingController
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginViewModel.fromJson(String source) =>
      LoginViewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginViewModel(login: $login, password: $password)';

  @override
  bool operator ==(covariant LoginViewModel other) {
    if (identical(this, other)) return true;

    return other.login == login && other.password == password;
  }

  @override
  int get hashCode => login.hashCode ^ password.hashCode;
}
