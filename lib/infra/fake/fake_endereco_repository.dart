import 'package:flutter_controle_enderecos/domain/models/endereco.dart';
import 'package:flutter_controle_enderecos/domain/repository/endereco_repository.dart';
import 'package:flutter_controle_enderecos/infra/fake/fake_repository.dart';

class FakeEnderecoRepository extends FakeRepository<Endereco>
    implements EnderecoRepository {
  FakeEnderecoRepository({required super.fakeData, required super.idCounter});
}
