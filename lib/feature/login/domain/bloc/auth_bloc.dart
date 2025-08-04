

import 'package:credconnect/feature/login/domain/repositories/auth_repository.dart';
import 'package:credconnect/feature/login/domain/event/auth_event.dart';
import 'package:credconnect/feature/login/domain/states/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<LoginEvent, AuthState> {
  final IAuthRepository repository;
  

  AuthBloc({
    required this.repository,
  }) : super(AuthStartState()) {
    on<LoginWithPhonePasswordEvent>(_loginWithEmailAndPassword);
    on<RegisterEvent>(_register);
  }
  _loginWithEmailAndPassword(event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    final response = await repository.login( phone: event.phone, password: event.password);

    response.fold(
      (success) async {
       
        emit(SucessState(message: success));
      },
      (failure) => emit(ErrorState(exception: failure)),
    );
  }

   _register(event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    final response = await repository.register(name: event.name, phone: event.phone, password: event.password);

    response.fold(
      (success) async {
        emit(SucessState(message: success));
      },
      (failure) => emit(ErrorState(exception: failure)),
    );
  }
  
  
}
