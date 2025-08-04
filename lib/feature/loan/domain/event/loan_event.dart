import 'package:credconnect/feature/loan/domain/entity/client_entity.dart';

sealed class LoanEvent {}


class CreateClientEvent implements LoanEvent {
  final ClientEntity client;
  CreateClientEvent({required this.client});
}

