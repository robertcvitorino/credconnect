// test/data/datasources/auth_data_source_impl_test.dart

import 'package:credconnect/feature/login/data/datasource/auth_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:credconnect/core/database/local_database.dart';

import 'auth_datasource_test.mocks.dart';

@GenerateMocks([LocalDataSource, Database])
void main() {
  late MockLocalDataSource mockLocalDataSource;
  late MockDatabase mockDatabase;
  late AuthDataSourceImpl dataSource;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockDatabase = MockDatabase();
    dataSource = AuthDataSourceImpl(localDataSource: mockLocalDataSource);

    when(mockLocalDataSource.database).thenAnswer((_) async => mockDatabase);
  });

  group('login', () {
    const testPhone = '123456';
    const testPassword = 'password';
    final testUserMap = {'id': 1, 'name': 'Teste', 'phone': testPhone};

    test('deve retornar um  usuário quando o login for encontrado', () async {
      when(mockDatabase.query(
        'users',
        where: anyNamed('where'),
        whereArgs: anyNamed('whereArgs'),
        limit: anyNamed('limit'),
      )).thenAnswer((_) async => [testUserMap]);

      final result = await dataSource.login(testPhone, testPassword);

      expect(result, equals(testUserMap));
      verify(mockDatabase.query('users',
          where: 'phone = ? AND password = ?',
          whereArgs: [testPhone, testPassword],
          limit: 1));
    });

    test('deve retornar null quando as credenciais estiverem incorretas',
        () async {
      when(mockDatabase.query(any,
              where: anyNamed('where'),
              whereArgs: anyNamed('whereArgs'),
              limit: anyNamed('limit')))
          .thenAnswer((_) async => []);

      final result = await dataSource.login(testPhone, testPassword);

      expect(result, isNull);
    });
  });

  group('register', () {
    const testName = 'Novo Usuário';
    const testPhone = '654321';
    const testPassword = 'new_password';

    test('deve retornar true quando o registro for salvo com sucesso',
        () async {
      when(mockDatabase.insert(any, any,
              conflictAlgorithm: anyNamed('conflictAlgorithm')))
          .thenAnswer((_) async => 1);

      final result =
          await dataSource.register(testName, testPhone, testPassword);

      expect(result, isTrue);
      verify(mockDatabase.insert(
        'users',
        {'name': testName, 'phone': testPhone, 'password': testPassword},
        conflictAlgorithm: ConflictAlgorithm.abort,
      ));
    });

    test('deve relançar uma exceção quando o banco de dados falhar', () async {
      final exception = Exception('DB Error');
      when(mockDatabase.insert(any, any,
              conflictAlgorithm: anyNamed('conflictAlgorithm')))
          .thenThrow(exception);
      final call = dataSource.register(testName, testPhone, testPassword);

      expect(() => call, throwsA(isA<Exception>()));
    });
  });
}
