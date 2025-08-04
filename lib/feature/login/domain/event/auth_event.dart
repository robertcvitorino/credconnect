sealed class LoginEvent {}

class LoginWithPhonePasswordEvent implements LoginEvent {
  final String phone;
  final String password;
  LoginWithPhonePasswordEvent({required this.phone,required this.password});
}

class RegisterEvent implements LoginEvent {
  final String name;
  final String phone;
  final String password;
  RegisterEvent({required this.name,required this.phone, required this.password});
}


class ValidatingAcessEvent implements LoginEvent {
  ValidatingAcessEvent();
}