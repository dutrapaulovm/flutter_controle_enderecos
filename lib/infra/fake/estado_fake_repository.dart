import 'package:flutter_controle_enderecos/domain/models/estado.dart';
import 'package:flutter_controle_enderecos/domain/repository/estado_repository.dart';
import 'package:flutter_controle_enderecos/infra/fake/fake_repository.dart';

class EstadoFakeRepository extends FakeRepository<Estado>
    implements EstadoRepository {}
