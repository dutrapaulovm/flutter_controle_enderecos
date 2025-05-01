// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Classe utilizada como padrão de resposta para requisições no formato Json.
class ResultData<T> {
  /// Flag que define se houve sucesso no resultado.
  bool? success = false;

  /// Informação sobre o resultado.
  String? message = '';

  /// Armazena informações sobre possíveis erros retornados pela requisição.
  dynamic errors = '';

  /// Código referente ao resultado. Aqui não é o código referente
  /// ao HTTP, mas sim códigos internos da aplicação.
  String? status = '';

  String? token = '';

  /// Dados que serão retornados pelo resultado.
  T? data;

  /// Lista para retornar outros dados importantes que não contemplam as informações anteriores
  List<Map<String, dynamic>>? others;

  ResultData(
      {this.success = false,
      this.message = '',
      this.errors = '',
      this.status = '',
      this.token = '',
      this.data,
      this.others});

  ResultData copyWith({
    bool? success,
    String? message,
    String? token,
    dynamic errors,
    String? status,
    dynamic data,
  }) {
    return ResultData(
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
      'token': token,
      'data': data,
    };
  }

  factory ResultData.fromMap(Map<String, dynamic> map) {
    return ResultData(
      success: map['success'] != null ? map['success'] as bool : false,
      message: map['message'] != null ? map['message'] as String : "",
      errors: map['errors'] != null ? map['errors'] as dynamic : null,
      status: map['status'] != null ? map['status'] as String : "",
      token: map['token'] != null ? map['token'] as String : "",
      data: map['data'] != null ? map['data'] as T : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultData.fromJson(String source) =>
      ResultData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResultData(success: $success, message: $message, errors: $errors, status: $status, data: $data)';
  }

  @override
  bool operator ==(covariant ResultData other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.message == message &&
        other.errors == errors &&
        other.status == status &&
        other.token == token &&
        other.data == data;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        errors.hashCode ^
        status.hashCode ^
        token.hashCode ^
        data.hashCode;
  }
}
