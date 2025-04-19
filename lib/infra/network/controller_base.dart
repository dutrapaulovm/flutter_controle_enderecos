import 'dart:convert' as convert;
import 'package:flutter_controle_enderecos/infra/result_application.dart';
import 'package:http/http.dart' as http;

abstract class HttpClient {
  Future<ResultApplication> post(String method, String bodyJson);

  Future<ResultApplication> delete(String method, {Object? body});

  Future<ResultApplication> put(String method, String bodyJson);

  Future<ResultApplication> get(String method,
      {Map<String, String>? parameters});
}

enum HttpMethods { POST, GET, DELETE, PUT }

class ControllerBase extends HttpClient {
  final String url_base = "localhost:8080";

  Future<ResultApplication> httpMethod(String method, HttpMethods httpMethod,
      {String? bodyJson, Object? body, Map<String, String>? parameters}) async {
    var header = {"Content-type": "application/json"};
    ResultApplication resultApplication = ResultApplication();

    try {
      var url;

      //Definindo a URL para realizar a requisição da WebAPI
      if (httpMethod == HttpMethods.GET)
        url = Uri.http(url_base, "api/Aluno/${method}", parameters);
      else
        url = Uri.http(url_base, "api/Aluno/${method}");

      var result;

      switch (httpMethod) {
        case HttpMethods.POST:
          //Realizando a requisição utilizando o verbo POST
          result = await http.post(url, body: bodyJson, headers: header);
          break;
        case HttpMethods.GET:
          result = await http.get(url, headers: header);
          break;
        case HttpMethods.PUT:
          result = await http.put(url, body: bodyJson, headers: header);
          break;
        case HttpMethods.DELETE:
          result = await http.delete(url, headers: header);
          break;
      }

      var bodyResult = result.body;

      resultApplication = ResultApplication.fromJson(bodyResult);

      if (resultApplication.success == null) {
        resultApplication.success = false;
        resultApplication.message = result.body;
        resultApplication.errors = result.reasonPhrase;
      }

      return resultApplication;
    } catch (e) {
      resultApplication.success = false;
      resultApplication.message = e.toString();
      return resultApplication;
    }
  }

  ///
  /// Método responsável por realizar as requisições post do controller
  ///
  /// Parâmetro method: Nome do método a ser chamado pela requisição na rota.
  /// Parâmetro bodyJson: Json com os dados a serem enviados durante a requisição.
  ///
  Future<ResultApplication> post(String method, String bodyJson) async {
    return await httpMethod(method, HttpMethods.POST, bodyJson: bodyJson);
  }

  Future<ResultApplication> delete(String method, {Object? body}) async {
    return await httpMethod(method, HttpMethods.DELETE, body: body);
  }

  Future<ResultApplication> put(String method, String bodyJson) async {
    return await httpMethod(method, HttpMethods.PUT, bodyJson: bodyJson);
  }

  Future<ResultApplication> get(String method,
      {Map<String, String>? parameters}) async {
    return await httpMethod(method, HttpMethods.GET, parameters: parameters);
  }
}
