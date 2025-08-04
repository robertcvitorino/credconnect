import 'package:credconnect/core/database/local_database.dart';
import 'package:credconnect/core/errors/exception.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

abstract class IAuthDataSource {
  Future<Map<String, dynamic>?> login(String phone, String password);
  Future<bool> register(String name, String phone, String password);
}

@LazySingleton(as: IAuthDataSource)
class AuthDataSourceImpl implements IAuthDataSource {
  final LocalDataSource localDataSource;

  AuthDataSourceImpl({required this.localDataSource});
  @override
  Future<Map<String, dynamic>?> login(String phone, String password) async {
    try {
      final database = await localDataSource.database;
      final List<Map<String, dynamic>> result = await database.query(
        'users',
        where: 'phone = ? AND password = ?',
        whereArgs: [phone, password],
        limit: 1,
      );
      if (result.isNotEmpty) {
        return result.first;
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> register(String name, String phone, String password) async {
    try {
      final database = await localDataSource.database;
      final List<Map<String, dynamic>> result = await database.query(
        'users',
        where: 'phone = ? AND password = ?',
        whereArgs: [phone, password],
        limit: 1,
      );
      if (result.isNotEmpty) {
        throw ServerFailure(message: 'Usuário já cadastrado');
      }
      final user = await database.insert(
        'users', 
        {'name': name, 'phone': phone, 'password': password},
        conflictAlgorithm: ConflictAlgorithm.abort,
      );

      return user > 0;
    } catch (e) {
      throw ServerFailure(message: 'Usuário já cadastrado');
    }
  }
}
