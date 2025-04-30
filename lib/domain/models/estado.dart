// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_controle_enderecos/domain/models/entity.dart';

class Estado extends Entity<Estado> {
  String? nome;
  String? uf;
  Estado({
    super.id,
    this.nome,
    this.uf,
  });

  Estado copyWith({
    int? id,
    String? nome,
    String? uf,
  }) {
    return Estado(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      uf: uf ?? this.uf,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'uf': uf,
    };
  }

  factory Estado.fromMap(Map<String, dynamic> map) {
    return Estado(
      id: map['id'] != null ? map['id'] as int : 0,
      nome: map['nome'] != null ? map['nome'] as String : null,
      uf: map['uf'] != null ? map['uf'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Estado.fromJson(String source) =>
      Estado.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Estado(id: $id, nome: $nome, uf: $uf)';

  @override
  bool operator ==(covariant Estado other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nome == nome && other.uf == uf;
  }

  @override
  int get hashCode => nome.hashCode ^ uf.hashCode;

  @override
  String get entityName => "estado";

  @override
  Estado fromMap(Map<String, dynamic> map) {
    return Estado.fromMap(map);
  }
}
