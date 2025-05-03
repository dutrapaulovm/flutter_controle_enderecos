import 'package:flutter_controle_enderecos/controller/controllers.dart';
import 'package:flutter_controle_enderecos/domain/repository/estado_repository.dart';
import 'package:flutter_controle_enderecos/domain/repository/usuario_repository.dart';
import 'package:flutter_controle_enderecos/exceptions.dart';
import 'package:flutter_controle_enderecos/infra/api/api_usuario_repository.dart';
import 'package:flutter_controle_enderecos/infra/fake/estado_fake_data_source.dart';
import 'package:flutter_controle_enderecos/infra/fake/estado_fake_repository.dart';
import 'package:flutter_controle_enderecos/infra/fake/fake_usuario_repository.dart';

/// A classe `ServiceLocator` fornece um mecanismo centralizado para
///  registrar e recuperar serviços em uma aplicação.
///
/// Exemplo de uso da classe ServiceLocator:
///
/// ```dart
/// void main() {
///   // Criando uma instância do ServiceLocator
///   var locator = ServiceLocator();
///
///   // Registrando um serviço
///   locator.registerService("logger", Logger());
///
///   // Obtendo o serviço
///   var logger = locator.getService("logger");
///   logger.log("Hello, world!");
/// }
/// ```
///
/// Neste exemplo, criamos uma instância do `ServiceLocator`,
/// registramos um serviço com a chave "logger" e, em seguida,
/// recuperamos esse serviço usando `getService`. Finalmente,
/// utilizamos o serviço obtido para fazer um log de uma mensagem.
class ServiceLocator {
  // Instância única da classe (privada).
  static final ServiceLocator _instance = ServiceLocator._internal();

  // Construtor privado para impedir múltiplas instâncias.
  ServiceLocator._internal();

  // Getter público para acessar a instância única.
  static ServiceLocator get instance => _instance;

  /// Um mapa que mantém os serviços registrados, onde a chave é uma
  /// String representando o nome do serviço e o valor é o próprio serviço.
  final Map<String, dynamic> _singletons = {};
  //final Map<Type, Function> _singletons = {};
  final Map<String, Function> _factories = {};

  /// Registra um serviço com a chave especificada.
  ///
  /// O parâmetro [key] é a chave única que identifica o serviço.
  ///
  /// O parâmetro [service] é o próprio serviço a ser registrado.
  void registerSingleton<T>(String key, T Function() service) {
    if (_factories.containsKey(key)) {
      throw ServiceException(
          message: "Serviço com chave $key já foi registrado.");
    }

    _factories[key] = () {
      if (!_singletons.containsKey(key)) {
        _singletons[key] = service();
      }
      return _singletons[key];
    };
  }

  void registerFactory<T>(String key, T Function() service) {
    if (_factories.containsKey(key)) {
      throw ServiceException(
          message: "Serviço com chave '$key' já foi registrado.");
    }
    _factories[key] = service;
  }

  /// Recupera o serviço associado à chave especificada.
  ///
  /// Retorna o serviço correspondente à chave [key] fornecida,
  /// ou [null] se nenhum serviço estiver registrado com essa chave.
  dynamic getService(String key) {
    final builder = _factories[key];
    if (builder == null) {
      throw ServiceException(message: "Serviço $key não registrado! Verifique a configuração do ServiceLocator.");
    }
    return builder();
  }

  /// Remove o tipo T do container (tanto singleton quanto factory)
  void unregister(String key) {
    _factories.remove(key);
    _singletons.remove(key);
  }

  ///Verifica se o serviço foi registrado
  bool isRegistered(String key) => _factories.containsKey(key);
}

/// Contém as chaves usadas para registrar e recuperar serviços no `ServiceLocator`.
class ServiceKeys {
  /// Chave de identificação para o serviço relacionado ao repositório de usuários.
  static const repositoryUsuario = 'repositoryUsuario';
  static const repositoryEstado = 'repositoryEstado';
  static const controllerEstado = "controllerEstado";
  static const controllerUser = "controllerUser";
}

/// Enum que define os modos disponíveis para configuração de repositórios.
enum RepositoryMode {
  /// Utiliza repositórios fake/mock, geralmente usados para testes ou desenvolvimento inicial.
  fake,

  /// Utiliza repositórios que fazem chamadas para uma API real.
  api,

  /// Utiliza repositórios locais, como armazenamento SQLite ou arquivos.
  local,
}

/// Inicializa os repositórios usando uma implementação que consome uma API real.
///
/// Registra os repositórios necessários no `ServiceLocator` usando o modo de produção.
void initApiRepositories() {
  ServiceLocator.instance.registerSingleton(
    ServiceKeys.repositoryUsuario,
    () => ApiUsuarioRepository(),
  );
}

/// Inicializa os repositórios fake (mocks) para simulação ou testes.
///
/// Ideal para uso em ambientes de desenvolvimento ou durante testes unitários.
void initFakeRepositories() {
  ServiceLocator.instance.registerSingleton(
    ServiceKeys.repositoryUsuario,
    () => FakeUsuarioRepository(),
  );
  ServiceLocator.instance.registerSingleton(
    ServiceKeys.repositoryEstado,
    () => FakeEstadoRepository(
        fakeData: estadoFakeData, idCounter: estadoFakeData.length + 1),
  );
}


void setupControllers() {
  EstadoRepository repository =
      ServiceLocator.instance.getService(ServiceKeys.repositoryEstado);
  ServiceLocator.instance.registerFactory(
    ServiceKeys.controllerEstado,
    () => EstadoController(repository: repository),
  );

  UsuarioRepository usuarioRepository =
      ServiceLocator.instance.getService(ServiceKeys.repositoryUsuario);
  ServiceLocator.instance.registerFactory(
    ServiceKeys.controllerUser,
    () => UserController(),
  );
}

/// Inicializa os repositórios com base no modo especificado.
///
/// Permite configurar o ambiente de execução para usar diferentes
/// tipos de repositórios (fake, api, local).
///
/// Exemplo de uso:
/// ```dart
/// setupRepositories(mode: RepositoryMode.fake);
/// ```
///
/// [mode] O tipo de repositório a ser utilizado.
void setupRepositories({required RepositoryMode mode}) {
  switch (mode) {
    case RepositoryMode.fake:
      initFakeRepositories();
      return;
    case RepositoryMode.api:
      initApiRepositories();
      return;
    case RepositoryMode.local:
      // No futuro, implementar initLocalRepositories();
      return;
  }
}
