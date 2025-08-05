

import 'package:credconnect/core/shared/storage_preferences.dart';
import 'package:credconnect/feature/login/data/datasource/auth_datasource.dart';
import 'package:credconnect/feature/login/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import 'auth_repository_impl_test.mocks.dart';



@GenerateMocks([IAuthDataSource, IFlutterStorage])

void main() {
  late MockIAuthDataSource mockDataSource;
  late MockIFlutterStorage mockStorage;
  late AuthRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockIAuthDataSource();
    mockStorage = MockIFlutterStorage();
    repository = AuthRepositoryImpl(dataSource: mockDataSource, storage: mockStorage);
  });

  group('login', () {
    const tPhone = '123456';
    const tPassword = 'password';
    final tUserMap = {'id': 1, 'name': 'Usuário Teste', 'phone': tPhone};

    test('deve retornar Success(UserEntity)', () async {
      when(mockDataSource.login(any, any)).thenAnswer((_) async => tUserMap);
      when(mockStorage.write(key: anyNamed('key'), value: anyNamed('value')))
          .thenAnswer((_) async {});

      final result = await repository.login( phone:  tPhone, password: tPassword);

      expect(result, isA<Success>());
    });

    test('deve retornar Failure(ErroNotFound) quando o usuário não for encontrado', () async {
      when(mockDataSource.login(any, any)).thenAnswer((_) async => null);

      final result = await repository.login( phone: tPhone, password: tPassword);

      expect(result, isA<Failure>());
    });

    test('deve retornar Failure(ServerFailure) quando ocorrer um erro no datasource', () async {
      when(mockDataSource.login(any, any)).thenThrow(Exception('Erro no DB'));

      final result = await repository.login(  phone: tPhone, password: tPassword);

      expect(result, isA<Failure>());
    });
  });

  group('register', () {
    const tName = 'Novo Usuário';
    const tPhone = '654321';
    const tPassword = 'new_password';

    test('deve retornar Success(true)', () async {
      when(mockDataSource.register(any, any, any)).thenAnswer((_) async => true);

      final result = await repository.register( name:   tName, phone: tPhone, password: tPassword);

      expect(result, isA<Success>());
    });

    test('deve retornar Failure(ErroNotFound) quando o registro não salvar', () async {
      when(mockDataSource.register(any, any, any)).thenAnswer((_) async => false);

      final result = await repository.register( name:   tName, phone: tPhone, password: tPassword);

      expect(result, isA<Failure>());
    });

  });
}