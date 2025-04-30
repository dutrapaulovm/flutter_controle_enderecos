import 'package:flutter_controle_enderecos/domain/models/usuario.dart';
import 'package:flutter_controle_enderecos/utils/encrypt/encryption_context.dart';

EncryptionContext context = EncryptionContext();

// Gera uma lista de usuários fakes
List<Usuario> gerarUsuariosFakes(int quantidade) {
  final usuarios = <Usuario>[];

  for (int i = 0; i < quantidade; i++) {
    final nome = 'Usuário $i';
    final login = 'usuario$i';
    final senhaOriginal = 'usuario$i';
    final email = 'usuario$i@email.com';
    final telefone = '55519999999$i';
    final status = 'ativo';

    final result = context.encryptPassword(senhaOriginal);

    final usuario = Usuario(
      id: i + 1,
      nome: nome,
      login: login,
      password: result.hash,
      salt: result.salt,
      email: email,
      telefone: telefone,
      status: status,
      data: DateTime.now(),
    );

    usuarios.add(usuario);
  }

  return usuarios;
}

final List<Usuario> usuariosFake = gerarUsuariosFakes(20);

/*
final List<Usuario> usuariosFake = [
  Usuario(
    id: 1,
    nome: "Alice Santos",
    salt: "abc123",
    password: "senha123",
    login: "alice",
    email: "alice@example.com",
    data: DateTime(2024, 5, 12),
    status: "ativo",
    telefone: "11999999999",
  ),
  Usuario(
    id: 2,
    nome: "Bruno Oliveira",
    salt: "def456",
    password: "123senha",
    login: "bruno_oliveira",
    email: "bruno.o@gmail.com",
    data: DateTime(2023, 11, 2),
    status: "inativo",
    telefone: "21988888888",
  ),
  Usuario(
    id: 3,
    nome: "Carla Mendes",
    salt: "ghi789",
    password: "carla2024",
    login: "carlam",
    email: "carla.mendes@if.edu.br",
    data: DateTime(2022, 8, 23),
    status: "ativo",
    telefone: "31977777777",
  ),
  Usuario(
    id: 4,
    nome: "Diego Lima",
    salt: "xyz321",
    password: "senhaDiego",
    login: "diegol",
    email: "diego.lima@empresa.com",
    data: DateTime(2024, 1, 1),
    status: "ativo",
    telefone: "11912345678",
  ),
  Usuario(
    id: 5,
    nome: "Eduarda Silva",
    salt: "lmn654",
    password: "edu123",
    login: "eduarda_s",
    email: "eduarda.silva@hotmail.com",
    data: DateTime(2021, 9, 15),
    status: "pendente",
    telefone: "11945678901",
  ),
];
*/