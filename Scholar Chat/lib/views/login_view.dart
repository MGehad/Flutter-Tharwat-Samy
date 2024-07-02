import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/cubits/login_cubit/login_cubit.dart';
import '../consts.dart';
import '../cubits/login_cubit/login_state.dart';
import '../widgets/build_show_snack_bar.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textformfield.dart';
import 'chat_view.dart';
import 'sign_up_view.dart';

class LoginView extends StatefulWidget {
  static String id = 'Login View';

  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  String? password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          UserCredential user = state.user;
          Navigator.pushNamed(context, ChatView.id, arguments: email);
          buildShowSnackBar(context, 'Welcome ${user.user!.email}');
          isLoading = false;
        } else if (state is LoginFailureState) {
          buildShowSnackBar(context, state.errorMsg);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 90),
                  Image.asset(logoPath, height: 100),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Scholar Chat",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pacifico",
                            fontSize: 40),
                      ),
                    ],
                  ),
                  const SizedBox(height: 110),
                  const Row(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  MyTextFormField(
                    labelText: "Email",
                    icon: Icons.email,
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(height: 15),
                  MyPasswordFormField(
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: MyButton(
                      buttonText: "Login",
                      onTap: () async {
                        autovalidateMode = AutovalidateMode.always;
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context)
                              .userLogin(email!, password!);
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "dont't have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(SignUpView.id);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Color(0xffC7EDE6)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
