import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoanController {
  double? loanAmount;
  ClientEntity? selectedClient;

  void setLoanAmount(double amount) {
    loanAmount = amount;
    print('Loan amount set to: $loanAmount'); // Para depuração
  }

  void setSelectedClient(ClientEntity client) {
    selectedClient = client;
    print('Client set to: ${selectedClient?.name}'); // Para depuração
  }

  void clear() {
    loanAmount = null;
    selectedClient = null;
    print('Loan flow data cleared.');
  }
}