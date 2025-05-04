import 'package:flutter_controle_enderecos/domain/models/cidade.dart';
import 'package:flutter_controle_enderecos/domain/repository/cidade_repository.dart';
import 'package:flutter_controle_enderecos/infra/fake/fake_repository.dart';

class FakeCidadeRepository extends FakeRepository<Cidade>
    implements CidadeRepository {
  FakeCidadeRepository({required super.fakeData, required super.idCounter});
}
