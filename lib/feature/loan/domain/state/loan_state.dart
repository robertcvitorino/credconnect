
sealed class LoanState {
  const LoanState();
}

class LoanStartState extends LoanState {}

class LoadingState extends LoanState {}

class SucessState extends LoanState {
  dynamic message;
  SucessState({
    required this.message,
  });
}

class ErrorState extends LoanState {
  final dynamic exception;

  ErrorState({required this.exception});
}
