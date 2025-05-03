import 'package:flutter_controle_enderecos/domain/models/entity.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';

/// Classe base abstrata para controladores de entidades do domínio.
///
/// Essa classe define uma interface padrão para operações CRUD (Create, Read, Update, Delete)
/// e mapeamento entre entidades e controladores.
///
/// O tipo [E] deve estender a classe `Entity`, garantindo que apenas entidades válidas
/// do domínio possam ser manipuladas pelos controladores.
///
/// Implementações concretas dessa classe devem fornecer a lógica de negócio específica
/// para cada tipo de entidade.
///
/// Métodos:
///
/// - [save]: Salva a entidade atual. Pode representar uma inserção ou atualização.
/// - [delete]: Remove a entidade atual do repositório.
/// - [reset]: Restaura o estado interno do controlador para um estado limpo ou inicial.
/// - [findAll]: Recupera todas as entidades correspondentes no repositório.
/// - [fromEntity]: Atualiza os dados internos do controlador a partir de uma instância da entidade.
abstract class Controller<E extends Entity<E>> {
  /// Salva a entidade atual no repositório.
  ///
  /// Retorna um [ResultData] com o resultado da operação (sucesso ou erro).
  Future<ResultData> save();

  /// Remove a entidade atual do repositório.
  ///
  /// Retorna um [ResultData] com o resultado da operação (sucesso ou erro).
  Future<ResultData> delete();

  /// Restaura o estado interno do controlador, limpando os dados atuais.
  Future<void> reset();

  /// Busca todas as entidades do tipo [E] disponíveis no repositório.
  ///
  /// Retorna um [ResultData] contendo os dados ou erro, se houver.
  Future<ResultData> findAll();

  /// Carrega os dados da entidade [entity] para o estado interno do controlador.
  ///
  /// Esse método é utilizado para sincronizar o controlador com os dados de uma entidade existente.
  void fromEntity(E entity);
}
