import 'package:flutter_controle_enderecos/domain/models/usuario.dart';

class UsuarioFakeDataSource {
  final List<Usuario> _usuarios = usuariosFake;
  int _nextId = 1;

  Future<int> insert(Usuario usuario) async {
    final novoUsuario = usuario.copyWith(id: _nextId++);
    _usuarios.add(novoUsuario);
    return novoUsuario.id!;
  }

  Future<int> update(Usuario usuario) async {
    final index = _usuarios.indexWhere((u) => u.id == usuario.id);
    if (index == -1) return 0;
    _usuarios[index] = usuario;
    return 1;
  }

  Future<int> delete(int id) async {
    final index = _usuarios.indexWhere((u) => u.id == id);
    if (index != -1) {
      _usuarios.removeAt(index);
      return 1;
    }
    return 0;
  }

  Future<Usuario?> findById(int id) async {
    return _usuarios.firstWhere(
      (u) => u.id == id,
      orElse: () => Usuario(),
    );
  }

  Future<List<Usuario>> findAll() async {
    return List.unmodifiable(_usuarios);
  }
}

List<Usuario> usuariosFake = [
  Usuario(
    id: 1,
    nome: 'Ana Costa',
    salt: 'randomSalt1',
    password: 'hashedPassword1',
    login: 'ana.costa',
    email: 'ana.costa@email.com',
    data: DateTime(1990, 5, 10),
    status: 'ativo',
    telefone: '+55 11 98765-4321',
  ),
  Usuario(
    id: 2,
    nome: 'Carlos Silva',
    salt: 'randomSalt2',
    password: 'hashedPassword2',
    login: 'carlos.silva',
    email: 'carlos.silva@email.com',
    data: DateTime(1985, 7, 20),
    status: 'inativo',
    telefone: '+55 21 99876-5432',
  ),
  Usuario(
    id: 3,
    nome: 'Juliana Oliveira',
    salt: 'randomSalt3',
    password: 'hashedPassword3',
    login: 'juliana.oliveira',
    email: 'juliana.oliveira@email.com',
    data: DateTime(1995, 12, 30),
    status: 'ativo',
    telefone: '+55 31 98765-8765',
  ),
  Usuario(
    id: 4,
    nome: 'Roberto Santos',
    salt: 'randomSalt4',
    password: 'hashedPassword4',
    login: 'roberto.santos',
    email: 'roberto.santos@email.com',
    data: DateTime(1992, 8, 25),
    status: 'ativo',
    telefone: '+55 41 98765-6543',
  ),
  Usuario(
    id: 5,
    nome: 'Fernanda Lima',
    salt: 'randomSalt5',
    password: 'hashedPassword5',
    login: 'fernanda.lima',
    email: 'fernanda.lima@email.com',
    data: DateTime(1993, 3, 15),
    status: 'inativo',
    telefone: '+55 61 98877-1234',
  ),
  Usuario(
    id: 6,
    nome: 'Marcos Pereira',
    salt: 'randomSalt6',
    password: 'hashedPassword6',
    login: 'marcos.pereira',
    email: 'marcos.pereira@email.com',
    data: DateTime(1988, 11, 5),
    status: 'ativo',
    telefone: '+55 51 98765-4322',
  ),
  Usuario(
    id: 7,
    nome: 'Paula Martins',
    salt: 'randomSalt7',
    password: 'hashedPassword7',
    login: 'paula.martins',
    email: 'paula.martins@email.com',
    data: DateTime(1997, 4, 12),
    status: 'ativo',
    telefone: '+55 71 99887-6543',
  ),
  Usuario(
    id: 8,
    nome: 'Gustavo Rocha',
    salt: 'randomSalt8',
    password: 'hashedPassword8',
    login: 'gustavo.rocha',
    email: 'gustavo.rocha@email.com',
    data: DateTime(1990, 9, 18),
    status: 'inativo',
    telefone: '+55 81 98987-1234',
  ),
  Usuario(
    id: 9,
    nome: 'Luana Souza',
    salt: 'randomSalt9',
    password: 'hashedPassword9',
    login: 'luana.souza',
    email: 'luana.souza@email.com',
    data: DateTime(1994, 6, 3),
    status: 'ativo',
    telefone: '+55 91 98765-4321',
  ),
  Usuario(
    id: 10,
    nome: 'Tiago Almeida',
    salt: 'randomSalt10',
    password: 'hashedPassword10',
    login: 'tiago.almeida',
    email: 'tiago.almeida@email.com',
    data: DateTime(1987, 2, 18),
    status: 'ativo',
    telefone: '+55 51 99876-5432',
  ),
];
