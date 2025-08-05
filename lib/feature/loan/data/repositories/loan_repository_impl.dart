import 'package:credconnect/core/errors/exception.dart';
import 'package:credconnect/feature/loan/data/datasource/loan_datasource.dart';
import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:credconnect/feature/loan/domain/entity/loan_entity.dart';
import 'package:credconnect/feature/loan/domain/repositories/loan_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';

@LazySingleton(as: ILoanRepository)
class LoanRepositoryImpl implements ILoanRepository {
  final ILoanDataSource dataSource;

  LoanRepositoryImpl({required this.dataSource});


  @override
  AsyncResult<ClientEntity> createClient({required ClientEntity client}) async {
       try {     
      final result = await dataSource.createClient(client: client);
     
      return Success(result );
    } on ErroNotFound catch (e) {
      return Failure(e);
    } on ServerFailure catch (e) {
      return Failure(e);
    }    
  }

  @override
  AsyncResult<bool> createLoan({required LoanEntity loan})async {
     try {     
      final result = await dataSource.createLoan(loan: loan);     
      return Success(result);
    } on ErroNotFound catch (e) {
      return Failure(e);
    } on ServerFailure catch (e) {
      return Failure(e);
    }    
  }
}
