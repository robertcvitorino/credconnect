import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:credconnect/core/database/local_database.dart';
import 'package:credconnect/feature/loan/data/datasource/loan_datasource.dart';
import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:credconnect/core/errors/exception.dart';

import '../../../login/data/datasource/auth_datasource_test.mocks.dart';

@GenerateMocks([LocalDataSource, Database])
void main() {
  late MockLocalDataSource mockLocalDataSource;
  late MockDatabase mockDatabase;
  late LoanDataSourceImpl dataSource;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockDatabase = MockDatabase();
    dataSource = LoanDataSourceImpl(localDataSource: mockLocalDataSource);

    when(mockLocalDataSource.database).thenAnswer((_) async => mockDatabase);
  });

  group('createClient', () {
    const clientEntity = ClientEntity(
      id: 0,
      name: 'Cliente Teste',
      nid: '123456789',
      address: 'Rua Teste, 123',
      gender: 'Outro',
      birthDate: '2000-01-01',
    );

    final clientMap = {
      'name': 'Cliente Teste',
      'nid': '123456789',
      'address': 'Rua Teste, 123',
      'gender': 'Outro',
      'birth_date': '2000-01-01',
    };

    test(
        'deve retornar true quando o cliente for inserido com sucesso no banco',
        () async {
      when(mockDatabase.insert(
        any,
        any,
        conflictAlgorithm: anyNamed('conflictAlgorithm'),
      )).thenAnswer((_) async => 1);

      final result = await dataSource.createClient(client: clientEntity);

      expect(result, isTrue);
      verify(mockDatabase.insert(
        'clients',
        clientMap,
        conflictAlgorithm: ConflictAlgorithm.abort,
      ));
      verifyNoMoreInteractions(mockDatabase);
    });

    test(
        'deve lançar um ServerFailure quando o banco de dados falhar ao inserir',
        () async {
      when(mockDatabase.insert(
        any,
        any,
        conflictAlgorithm: anyNamed('conflictAlgorithm'),
      )).thenThrow(new ServerFailure(message: 'NID duplicado'));

      final call = dataSource.createClient(client: clientEntity);

      expect(() => call, throwsA(isA<ServerFailure>()));
    });
  });
}
