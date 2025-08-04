import 'package:credconnect/core/errors/exception.dart';
import 'package:credconnect/core/shared/storage_preferences.dart';
import 'package:credconnect/feature/login/data/datasource/auth_datasource.dart';
import 'package:credconnect/feature/login/domain/entity/user_entity.dart';
import 'package:credconnect/feature/login/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDataSource dataSource;
  final IFlutterStorage storage;

  AuthRepositoryImpl({required this.dataSource, required this.storage});
  @override
  AsyncResult<UserEntity> login({required String phone,required String password}) async {
    try {
      final userMap = await dataSource.login(phone, password);

      if (userMap != null) {
        final user = UserEntity(
            id: userMap['id'], name: userMap['name'], phone: userMap['phone']);
        await storage.write(key: 'user.id', value: user.id.toString());
        await storage.write(key: 'user.name', value: user.name);
        return Success(user);
      }
      return Failure(ErroNotFound(message: 'Usuário não encontrado'));
    } catch (e) {
      return Failure(ServerFailure(message: 'Ocorreu um erro ao criar usuário'));
    }
  }

  @override
  AsyncResult<bool> register({required String name, required String phone, required String password}) async {
       try {     
      final userMap = await dataSource.register(name, phone, password);
      if (!userMap) {
        return Failure(ErroNotFound(message: 'Ocorreu um erro ao criar usuário'));
      }
      return Success(true);
    } on ErroNotFound catch (e) {
      return Failure(e);
    } on ServerFailure catch (e) {
      return Failure(e);
    }    
  }
}
