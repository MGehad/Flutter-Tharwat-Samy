import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../consts.dart';
import '../cubits/Signup_cubit/signup_cubit.dart';
import '../cubits/Signup_cubit/signup_state.dart';
import '../widgets/build_show_snack_bar.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textformfield.dart';

class SignUpView extends StatefulWidget {
  static String id = 'SignUpView';

  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          isLoading = true;
        } else if (state is SignUpSuccessState) {
          buildShowSnackBar(context, 'The email created successfully');
          Navigator.pop(context);
          isLoading = false;
        } else if (state is SignUpFailureState) {
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
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 90),
                  Image.asset(logoPath, height: 110),
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
                  const SizedBox(height: 100),
                  const Row(
                    children: [
                      Text("Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
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
                      buttonText: "Sign Up",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SignUpCubit>(context)
                              .userRegister(email: email!, password: password!);
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "already have an account ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
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
