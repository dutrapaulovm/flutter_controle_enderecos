import 'package:flutter_controle_enderecos/domain/models/cliente.dart';
import 'package:flutter_controle_enderecos/domain/repository/cliente_repository.dart';
import 'package:flutter_controle_enderecos/infra/fake/fake_repository.dart';

class FakeClienteRepository extends FakeRepository<Cliente>
    implements ClienteRepository {
  FakeClienteRepository({required super.fakeData, required super.idCounter});
}
