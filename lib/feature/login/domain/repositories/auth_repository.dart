
import 'package:credconnect/feature/login/domain/entity/user_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class IAuthRepository {
  AsyncResult<UserEntity> login({required String phone,required String password});
  AsyncResult<bool> register({required String name, required String phone, required String password});
}