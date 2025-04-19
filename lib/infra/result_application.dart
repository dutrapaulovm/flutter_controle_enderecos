// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Classe utilizada como padrão de resposta para requisições no formato Json.
class ResultApplication<T> {
  /// Flag que define se houve sucesso no resultado.
  bool? success = false;

  /// Informação sobre o resultado.
  String? message = '';

  /// Armazena informações sobre possíveis erros retornados pela requisição.
  dynamic errors = '';

  /// Código referente ao resultado. Aqui não é o código referente
  /// ao HTTP, mas sim códigos internos da aplicação.
  String? status = '';

  /// Dados que serão retornados pelo resultado.
  T? data;

  ResultApplication({
    this.success = false,
    this.message = '',
    this.errors = '',
    this.status = '',
    this.data,
  });

  ResultApplication copyWith({
    bool? success,
    String? message,
    String? token,
    dynamic errors,
    String? status,
    dynamic data,
  }) {
    return ResultApplication(
      success: success ?? this.success,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'errors': errors,
      'status': status,
      'data': data,
    };
  }

  factory ResultApplication.fromMap(Map<String, dynamic> map) {
    return ResultApplication(
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      errors: map['errors'] != null ? map['errors'] as dynamic : null,
      status: map['status'] != null ? map['status'] as String : null,
      data: map['data'] != null ? map['data'] as dynamic : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultApplication.fromJson(String source) =>
      ResultApplication.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResultApplication(success: $success, message: $message, errors: $errors, status: $status, data: $data)';
  }

  @override
  bool operator ==(covariant ResultApplication other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.message == message &&
        other.errors == errors &&
        other.status == status &&
        other.data == data;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        errors.hashCode ^
        status.hashCode ^
        data.hashCode;
  }
}
