// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_controle_enderecos/domain/models/entity.dart';

class Cidade extends Entity<Cidade> {
  String? nome;
  String? uf;
  String? ibge;
  Cidade({
    super.id,
    this.nome,
    this.uf,
    this.ibge,
  });

  Cidade copyWith({
    int? id,
    String? nome,
    String? uf,
    String? ibge,
  }) {
    return Cidade(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      uf: uf ?? this.uf,
      ibge: ibge ?? this.ibge,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'uf': uf,
      'ibge': ibge,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map['id'] != null ? map['id'] as int : 0,
      nome: map['nome'] != null ? map['nome'] as String : null,
      uf: map['uf'] != null ? map['uf'] as String : null,
      ibge: map['ibge'] != null ? map['ibge'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cidade.fromJson(String source) =>
      Cidade.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cidade(id: $id, nome: $nome, uf: $uf, ibge: $ibge)';
  }

  @override
  bool operator ==(covariant Cidade other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.uf == uf &&
        other.ibge == ibge;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nome.hashCode ^ uf.hashCode ^ ibge.hashCode;
  }

  @override
  String get entityName => "cidade";

  @override
  Cidade fromMap(Map<String, dynamic> map) {
    return Cidade.fromMap(map);
  }
}
