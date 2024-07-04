import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/blocs/login_bloc/login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState());
        try {
          var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(LoginSuccessState(user: user));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailureState(errorMsg: 'No user found for that email.'));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailureState(
                errorMsg: 'Wrong password provided for that user.'));
          } else if (e.code == 'invalid-credential') {
            emit(LoginFailureState(errorMsg: 'The email or password is wrong'));
          }
        } catch (e) {
          emit(LoginFailureState(errorMsg: 'An unexpected error occurred.'));
        }
      }
    });
  }
}
