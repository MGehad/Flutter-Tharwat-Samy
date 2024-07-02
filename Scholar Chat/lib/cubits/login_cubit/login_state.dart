class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {
  var user;

  LoginSuccessState({required this.user});
}

class LoginLoadingState extends LoginState {}

class LoginFailureState extends LoginState {
  final String errorMsg;

  LoginFailureState({required this.errorMsg});
}
