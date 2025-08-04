import 'package:credconnect/feature/loan/data/repositories/loan_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';
import 'package:credconnect/feature/loan/data/datasource/loan_datasource.dart';
import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:credconnect/core/shared/storage_preferences.dart';
import 'package:credconnect/core/errors/exception.dart';

import 'loan_repository_impl_test.mocks.dart';

@GenerateMocks([ILoanDataSource, StoragePreferences])
void main() {
  late MockILoanDataSource mockDataSource;
  late MockStoragePreferences mockStorage; 
  late LoanRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockILoanDataSource();
    mockStorage = MockStoragePreferences();
    repository = LoanRepositoryImpl(dataSource: mockDataSource, storage: mockStorage);
  });

  group('createClient', () {
    // Dados de teste
    const clientEntity = ClientEntity(
      id: 0,
      name: 'Cliente Teste',
      nid: '123456789',
      address: 'Rua Teste, 123',
      gender: 'Outro',
      birthDate: '2000-01-01',
    );

    test('deve retornar Success(true) quando o datasource criar o cliente com sucesso', () async {

      when(mockDataSource.createClient(client: anyNamed('client')))
          .thenAnswer((_) async => clientEntity);

      final result = await repository.createClient(client: clientEntity);

      expect(result, isA<Success>());
      verify(mockDataSource.createClient(client: clientEntity));
      verifyNoMoreInteractions(mockDataSource);
      verifyNoMoreInteractions(mockStorage);
    });

    test('deve retornar Failure quando o datasource lançar uma ServerFailure', () async {
      when(mockDataSource.createClient(client: anyNamed('client')))
          .thenThrow(ServerFailure(message: 'Erro no DB'));
      final result = await repository.createClient(client: clientEntity);
      expect(result, isA<Failure>());
    });

  });
}