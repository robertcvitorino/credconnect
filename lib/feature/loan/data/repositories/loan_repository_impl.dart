import 'package:credconnect/core/errors/exception.dart';
import 'package:credconnect/core/shared/storage_preferences.dart';
import 'package:credconnect/feature/loan/data/datasource/loan_datasource.dart';
import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:credconnect/feature/loan/domain/repositories/loan_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';

@LazySingleton(as: ILoanRepository)
class LoanRepositoryImpl implements ILoanRepository {
  final ILoanDataSource dataSource;
  final StoragePreferences storage;

  LoanRepositoryImpl({required this.dataSource, required this.storage});


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
}
