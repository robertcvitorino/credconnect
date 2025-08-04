

sealed class AuthState {
  const AuthState();
}

class AuthStartState extends AuthState {}

class LoadingState extends AuthState {}

class SucessState extends AuthState {
  dynamic message;
  SucessState({
    required this.message,
  });
}

class ErrorState extends AuthState {
  final dynamic exception;

  ErrorState({required this.exception});
}
