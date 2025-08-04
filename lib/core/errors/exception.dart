abstract class ExceptionHandler implements Exception {
  final dynamic message;
  const ExceptionHandler({
    required this.message,
  });
}

class ConnectionFailure extends ExceptionHandler {
  const ConnectionFailure({required super.message});
}

class ServerFailure extends ExceptionHandler {
  const ServerFailure( {required super.message});
}

class ErroNotFound extends ExceptionHandler {
  const ErroNotFound({required super.message});
}

