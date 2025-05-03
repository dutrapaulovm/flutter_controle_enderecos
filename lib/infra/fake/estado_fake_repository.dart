import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/domain/repository/estado_repository.dart';
import 'package:flutter_controle_enderecos/infra/fake/fake_repository.dart';

class FakeEstadoRepository extends FakeRepository<Estado>
    implements EstadoRepository {
  FakeEstadoRepository({required super.fakeData, required super.idCounter});
}
