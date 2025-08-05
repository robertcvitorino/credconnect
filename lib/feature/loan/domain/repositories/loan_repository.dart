
import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:credconnect/feature/loan/domain/entity/loan_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ILoanRepository {
  AsyncResult<ClientEntity> createClient({required ClientEntity client});
  AsyncResult<bool> createLoan({required LoanEntity loan});
}