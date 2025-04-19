import 'dart:async';
import 'dart:math';
import 'package:flutter_controle_enderecos/domain/repository/usuario_repository.dart';
import 'package:flutter_controle_enderecos/infra/fake/database_fake.dart';

import '../../domain/models/usuario.dart';

class UsuarioFakeRepository extends UsuarioRepository {
  final List<Usuario> _usuarios = usuariosFake;
  int _idCounter = usuariosFake.length;

  final _random = Random();

  @override
  Future<int> insert(Usuario entity) async {
    await Future.delayed(Duration(milliseconds: 500)); // simula latência
    final novo = entity.copyWith(id: _idCounter++);
    _usuarios.add(novo);
    return novo.id!;
  }

  @override
  Future<int> delete(Usuario entity) async {
    await Future.delayed(Duration(milliseconds: 400));
    _usuarios.removeWhere((u) => u.id == entity.id);
    return 1;
  }

  @override
  Future<int> update(Usuario entity) async {
    await Future.delayed(Duration(milliseconds: 500));
    final index = _usuarios.indexWhere((u) => u.id == entity.id);
    if (index == -1) return 0;
    _usuarios[index] = entity;
    return 1;
  }

  @override
  Future<Usuario?> findById(Usuario entity) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _usuarios.firstWhere(
      (u) => u.id == entity.id,
      orElse: () => Usuario(),
    );
  }

  @override
  Future<List<Usuario>> findAll(Usuario entity) async {
    await Future.delayed(Duration(milliseconds: 500));
    return List<Usuario>.from(_usuarios);
  }

  @override
  Future<Usuario?> buscarPorLoginSenha(String login, String senha) {
    // TODO: implement buscarPorLoginSenha
    throw UnimplementedError();
  }
}
