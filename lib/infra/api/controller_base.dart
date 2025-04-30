import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<ResultData> post(String method, String bodyJson);

  Future<ResultData> delete(String method, {Object? body});

  Future<ResultData> put(String method, String bodyJson);

  Future<ResultData> get(String method, {Map<String, String>? parameters});
}

enum HttpVerbs { post, get, delete, put }

class ControllerBase implements IHttpClient {
  final String urlbase = "localhost:8080";

  Future<ResultData> httpMethod(String method, HttpVerbs httpMethod,
      {String? bodyJson, Object? body, Map<String, String>? parameters}) async {
    var header = {"Content-type": "application/json"};
    ResultData resultApplication = ResultData();

    try {
      Uri url;

      //Definindo a URL para realizar a requisição da WebAPI
      if (httpMethod == HttpVerbs.get) {
        url = Uri.http(urlbase, "api/Aluno/$method", parameters);
      } else {
        url = Uri.http(urlbase, "api/Aluno/$method");
      }

      http.Response result;

      switch (httpMethod) {
        case HttpVerbs.post:
          //Realizando a requisição utilizando o verbo POST
          result = await http.post(url, body: bodyJson, headers: header);
          break;
        case HttpVerbs.get:
          result = await http.get(url, headers: header);
          break;
        case HttpVerbs.put:
          result = await http.put(url, body: bodyJson, headers: header);
          break;
        case HttpVerbs.delete:
          result = await http.delete(url, headers: header);
          break;
      }

      var bodyResult = result.body;

      resultApplication = ResultData.fromJson(bodyResult);

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
  @override
  Future<ResultData> post(String method, String bodyJson) async {
    return await httpMethod(method, HttpVerbs.post, bodyJson: bodyJson);
  }

  @override
  Future<ResultData> delete(String method, {Object? body}) async {
    return await httpMethod(method, HttpVerbs.delete, body: body);
  }

  @override
  Future<ResultData> put(String method, String bodyJson) async {
    return await httpMethod(method, HttpVerbs.put, bodyJson: bodyJson);
  }

  @override
  Future<ResultData> get(String method,
      {Map<String, String>? parameters}) async {
    return await httpMethod(method, HttpVerbs.get, parameters: parameters);
  }
}
