import 'package:credconnect/core/errors/exception.dart';
import 'package:credconnect/feature/loan/data/datasource/loan_datasource.dart';
import 'package:credconnect/feature/loan/data/repositories/loan_repository_impl.dart';
import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';
import 'package:credconnect/feature/loan/domain/entity/loan_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import 'loan_repository_impl_test.mocks.dart';

@GenerateMocks([ILoanDataSource])
void main() {
  late MockILoanDataSource mockDataSource;
  late LoanRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockILoanDataSource();
    repository = LoanRepositoryImpl(dataSource: mockDataSource);
  });

  const clientEntity = ClientEntity(
    id: 0,
    name: 'Cliente Teste',
    nid: '123456789',
    address: 'Rua Teste, 123',
    gender: 'Outro',
    birthDate: '2000-01-01',
  );

  final loanEntity = LoanEntity(
    id: 0,
    clientId: 1,
    loanAmount: '5000.0',
    tax: '10%',
    term: '12 meses',
    requestDate: DateTime.now().toString(),
  );

  group('createClient', () {
    test(
        'deve retornar Success quando o datasource criar o cliente com sucesso',
        () async {
      when(mockDataSource.createClient(client: anyNamed('client')))
          .thenAnswer((_) async => clientEntity);

      final result = await repository.createClient(client: clientEntity);

      expect(result, isA<Success>());
      verify(mockDataSource.createClient(client: clientEntity));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('deve retornar Failure quando o datasource lançar uma ServerFailure',
        () async {
      when(mockDataSource.createClient(client: anyNamed('client')))
          .thenThrow(ServerFailure(message: 'Erro no DB'));

      final result = await repository.createClient(client: clientEntity);

      expect(result, isA<Failure>());
      result.fold(
        (success) => fail('O teste deveria ter falhado, mas obteve sucesso.'),
        (failure) => expect(failure, isA<ServerFailure>()),
      );
      verify(mockDataSource.createClient(client: clientEntity));
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('createLoan', () {
    test(
        'deve retornar Success(true) quando o datasource criar o empréstimo com sucesso',
        () async {
      when(mockDataSource.createLoan(loan: anyNamed('loan')))
          .thenAnswer((_) async => true);

      final result = await repository.createLoan(loan: loanEntity);

      expect(result.getOrNull(), isTrue);
      verify(mockDataSource.createLoan(loan: loanEntity));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('deve retornar Failure quando o datasource lançar uma ServerFailure',
        () async {
      final serverFailure = ServerFailure(message: 'Erro ao salvar empréstimo');
      when(mockDataSource.createLoan(loan: anyNamed('loan')))
          .thenThrow(serverFailure);

      final result = await repository.createLoan(loan: loanEntity);

      expect(result, isA<Failure>());
      result.fold(
        (success) => fail('Esperado Failure, mas obteve Success'),
        (failure) => expect(failure, serverFailure),
      );
      verify(mockDataSource.createLoan(loan: loanEntity));
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
