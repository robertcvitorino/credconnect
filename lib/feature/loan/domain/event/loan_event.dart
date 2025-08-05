import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:credconnect/feature/loan/domain/entity/loan_entity.dart';

sealed class LoanEvent {}


class CreateClientEvent implements LoanEvent {
  final ClientEntity client;
  CreateClientEvent({required this.client});
}



class CreateLoanEvent implements LoanEvent {
  final LoanEntity loan;
  CreateLoanEvent({required this.loan});
}


