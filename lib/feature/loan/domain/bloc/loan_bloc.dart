import 'package:credconnect/feature/loan/domain/event/loan_event.dart';
import 'package:credconnect/feature/loan/domain/repositories/loan_repository.dart';
import 'package:credconnect/feature/loan/domain/state/loan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoanBloc extends Bloc<LoanEvent, LoanState> {
  final ILoanRepository repository;

  LoanBloc({
    required this.repository,
  }) : super(LoanStartState()) {
    on<CreateClientEvent>(_createClient);
  }
  _createClient(event, Emitter<LoanState> emit) async {
    emit(LoadingState());

    final response = await repository.createClient(client: event.client);

    response.fold(
      (success) async {
        emit(SucessState(message: success));
      },
      (failure) => emit(ErrorState(exception: failure)),
    );
  }
}
