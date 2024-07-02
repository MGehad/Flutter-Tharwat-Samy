class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpFailureState extends SignUpState {
  final String errorMsg;

  SignUpFailureState({required this.errorMsg});
}
