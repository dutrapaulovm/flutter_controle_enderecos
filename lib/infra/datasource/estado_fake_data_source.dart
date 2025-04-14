import 'package:flutter_controle_enderecos/domain/models/estado.dart';

List<Estado> estadoFakeData = [
  Estado(id: 1, nome: 'Acre', uf: 'AC'),
  Estado(id: 2, nome: 'Alagoas', uf: 'AL'),
  Estado(id: 3, nome: 'Amazonas', uf: 'AM'),
  Estado(id: 4, nome: 'Bahia', uf: 'BA'),
  Estado(id: 5, nome: 'Ceará', uf: 'CE'),
  Estado(id: 6, nome: 'Espírito Santo', uf: 'ES'),
  Estado(id: 7, nome: 'Goiás', uf: 'GO'),
  Estado(id: 8, nome: 'Maranhão', uf: 'MA'),
  Estado(id: 9, nome: 'Mato Grosso', uf: 'MT'),
  Estado(id: 10, nome: 'Mato Grosso do Sul', uf: 'MS'),
  Estado(id: 11, nome: 'Minas Gerais', uf: 'MG'),
  Estado(id: 12, nome: 'Pará', uf: 'PA'),
  Estado(id: 13, nome: 'Paraíba', uf: 'PB'),
  Estado(id: 14, nome: 'Paraná', uf: 'PR'),
  Estado(id: 15, nome: 'Pernambuco', uf: 'PE'),
  Estado(id: 16, nome: 'Piauí', uf: 'PI'),
  Estado(id: 17, nome: 'Rio de Janeiro', uf: 'RJ'),
  Estado(id: 18, nome: 'Rio Grande do Norte', uf: 'RN'),
  Estado(id: 19, nome: 'Rio Grande do Sul', uf: 'RS'),
  Estado(id: 20, nome: 'Rondônia', uf: 'RO'),
  Estado(id: 21, nome: 'Roraima', uf: 'RR'),
  Estado(id: 22, nome: 'Santa Catarina', uf: 'SC'),
  Estado(id: 23, nome: 'São Paulo', uf: 'SP'),
  Estado(id: 24, nome: 'Sergipe', uf: 'SE'),
  Estado(id: 25, nome: 'Tocantins', uf: 'TO'),
  Estado(id: 26, nome: 'Distrito Federal', uf: 'DF'),
];

class EstadoFakeDataSource {
  final List<Estado> _estados = estadoFakeData;

  Future<List<Estado>> findAll() async {
    return List.unmodifiable(_estados);
  }

  Future<Estado?> findById(int id) async {
    return _estados.firstWhere((estado) => estado.id == id,
        orElse: () => Estado());
  }

  Future<int> insert(Estado estado) async {
    _estados.add(estado);
    return estado.id ?? 0; // Retorna o id do estado inserido
  }

  Future<int> update(Estado estado) async {
    var index = _estados.indexWhere((e) => e.id == estado.id);
    if (index != -1) {
      _estados[index] = estado;
      return estado.id ?? 0;
    }
    return 0;
  }

  Future<int> delete(Estado estado) async {
    var index = _estados.indexWhere((e) => e.id == estado.id);
    if (index != -1) {
      _estados.removeAt(index);
      return estado.id ?? 0;
    }
    return 0;
  }
}
