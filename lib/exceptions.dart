/// Exception base para todos os exceptions da aplicação e para ocorrência de erros
/// gerais ocorridas na aplicação
class ApplicationException implements Exception {
  final Exception? _exception;
  late String? _message;

  ApplicationException(this._exception, {String? message}) {
    _message = message;
  }

  @override
  String toString() {
    if (_message != null) {
      return _message.toString();
    } else {
      return _exception.toString();
    }
  }

  String error() => toString();
}

/// Thrown by the repository when a problem occurs.
class RepositoryException extends ApplicationException {
  RepositoryException(Exception super.exception, {super.message});
}

/// Thrown by the Service when a problem occurs.
class ServiceException extends ApplicationException {
  ServiceException(Exception super.exception, {super.message});
}

/// Base Result class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
sealed class Result<S, E extends Exception> {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}
