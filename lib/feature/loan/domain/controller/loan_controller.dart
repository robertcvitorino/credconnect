import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoanController {
  double? loanAmount;
  ClientEntity? selectedClient;

  void setLoanAmount(double amount) {
    loanAmount = amount;
    
  }

  void setSelectedClient(ClientEntity client) {
    selectedClient = client;
    
  }

  void clear() {
    loanAmount = null;
    selectedClient = null;

  }

  void clearClient() => selectedClient = null;
}