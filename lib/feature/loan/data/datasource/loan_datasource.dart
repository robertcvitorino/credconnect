import 'package:credconnect/core/database/local_database.dart';
import 'package:credconnect/core/errors/exception.dart';
import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

abstract class ILoanDataSource {
  Future<ClientEntity> createClient({required ClientEntity client});
}

@LazySingleton(as: ILoanDataSource)
class LoanDataSourceImpl implements ILoanDataSource {
  final LocalDataSource localDataSource;

  LoanDataSourceImpl({required this.localDataSource});
 

  @override
  Future<ClientEntity> createClient({required ClientEntity client}) async {
    try {
      final database = await localDataSource.database;
     
      final create = await database.insert(
        'clients',
        {'name': client.name,'nid': client.nid,'address': client.address,'gender': client.gender,'birth_date': client.birthDate },
        conflictAlgorithm: ConflictAlgorithm.abort,
      );

      if (create == 0) {
        throw ServerFailure(message: 'Erro ao cadastrar cliente');
      }

      final clientMap = await database.query(
        'clients',
        where: 'id = ?',
        whereArgs: [create],
      );

      if (clientMap.isEmpty) {
        throw ServerFailure(message: 'Erro ao cadastrar cliente');
      }

      final clientEntity = ClientEntity(
        id: int.tryParse(clientMap.first['id'].toString()) ?? 0,
        name: clientMap.first['name'].toString(),
        nid: clientMap[0]['nid'].toString(),
        address: clientMap[0]['address'].toString(),
        gender: clientMap[0]['gender'].toString(),
        birthDate: clientMap[0]['birth_date'].toString(),
      );

      return clientEntity;
    } catch (e) {
      throw ServerFailure(message: 'Erro ao cadastrar cliente');
    }
  }
}
