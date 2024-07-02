import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  userLogin(String email, String password) async {
    try {
      emit(LoginLoadingState());
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
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
}
