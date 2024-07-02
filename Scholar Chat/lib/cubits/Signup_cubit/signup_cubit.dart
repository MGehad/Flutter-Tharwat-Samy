import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  userRegister({required String email, required String password}) async {
    emit(SignUpLoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(errorMsg: 'The password is weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(errorMsg: 'The email is already used'));
      }
    } catch (e) {
      emit(SignUpFailureState(errorMsg: 'An unexpected error occurred.'));
    }
  }
}
