import 'package:flutter_controle_enderecos/infra/result_data.dart';

/// Interface genérica para repositórios que manipulam entidades do tipo [T].
/// Todos os métodos retornam [ResultData] encapsulando o resultado da operação.
abstract class IRepository<T> {
  /// Insere uma entidade [T] no repositório.
  /// Retorna um [ResultData<int>] com o ID inserido ou erro.
  Future<ResultData<int>> insert(T entity);

  /// Remove uma entidade [T] do repositório.
  /// Retorna um [ResultData<int>] com a quantidade de registros removidos ou erro.
  Future<ResultData<int>> delete(T entity);

  /// Atualiza uma entidade [T] no repositório.
  /// Retorna um [ResultData<int>] com a quantidade de registros atualizados ou erro.
  Future<ResultData<int>> update(T entity);

  /// Busca uma entidade [T] por seu identificador.
  /// Retorna um [ResultData<T?>] contendo a entidade, ou null se não encontrada.
  Future<ResultData<T?>> findById(T entity);

  /// Retorna todas as entidades do tipo [T] disponíveis no repositório.
  /// Retorna um [ResultData<List<T>>] contendo a lista de resultados ou erro.
  Future<ResultData<List<T>>> findAll(T entity);
}
