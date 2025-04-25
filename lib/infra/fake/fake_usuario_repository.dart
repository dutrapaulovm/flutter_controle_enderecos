import 'package:flutter_controle_enderecos/domain/repository/usuario_repository.dart';
import 'package:flutter_controle_enderecos/infra/fake/database_fake.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import '../../domain/models/usuario.dart';

class FakeUsuarioRepository extends UsuarioRepository {
  final List<Usuario> _usuarios = usuariosFake;
  int _idCounter = usuariosFake.length;

  @override
  Future<ResultData<int>> insert(Usuario entity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final novo = entity.copyWith(id: _idCounter++);
    _usuarios.add(novo);
    return ResultData(success: true, data: novo.id);
  }

  @override
  Future<ResultData<int>> delete(Usuario entity) async {
    await Future.delayed(const Duration(milliseconds: 400));
    _usuarios.removeWhere((u) => u.id == entity.id);
    return ResultData(success: true, data: 1);
  }

  @override
  Future<ResultData<int>> update(Usuario entity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _usuarios.indexWhere((u) => u.id == entity.id);
    if (index == -1) {
      return ResultData(success: false, message: 'Usuário não encontrado');
    }
    _usuarios[index] = entity;
    return ResultData(success: true, data: 1);
  }

  @override
  Future<ResultData<Usuario?>> findById(Usuario entity) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final user = _usuarios.firstWhere(
      (u) => u.id == entity.id,
      orElse: () => Usuario(id: -1),
    );
    if (user.id == -1) {
      return ResultData(success: false, message: 'Usuário não encontrado');
    }
    return ResultData(success: true, data: user);
  }

  @override
  Future<ResultData<List<Usuario>>> findAll(Usuario entity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return ResultData(success: true, data: List<Usuario>.from(_usuarios));
  }

  @override
  Future<ResultData<Usuario?>> login(String login, String senha) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final user = _usuarios.firstWhere(
      (u) => u.login == login && u.password == senha,
      orElse: () => Usuario(id: -1),
    );

    if (user.id == -1) {
      return ResultData(success: false, message: 'Login ou senha inválidos');
    }

    return ResultData(success: true, data: user);
  }
}
