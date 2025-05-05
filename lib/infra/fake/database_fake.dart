import 'package:flutter_controle_enderecos/domain/models/cidade.dart';
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

List<Cidade> cidadesFake = [
  Cidade(id: 1, nome: 'São Paulo', uf: 'SP', ibge: '3550308'),
  Cidade(id: 2, nome: 'Rio de Janeiro', uf: 'RJ', ibge: '3304557'),
  Cidade(id: 3, nome: 'Belo Horizonte', uf: 'MG', ibge: '3106200'),
  Cidade(id: 4, nome: 'Porto Alegre', uf: 'RS', ibge: '4314902'),
  Cidade(id: 5, nome: 'Salvador', uf: 'BA', ibge: '2927408'),
  Cidade(id: 6, nome: 'Curitiba', uf: 'PR', ibge: '4106902'),
  Cidade(id: 7, nome: 'Fortaleza', uf: 'CE', ibge: '2304400'),
  Cidade(id: 8, nome: 'Recife', uf: 'PE', ibge: '2611606'),
  Cidade(id: 9, nome: 'Goiânia', uf: 'GO', ibge: '5208707'),
  Cidade(id: 10, nome: 'Manaus', uf: 'AM', ibge: '1302603'),
];
