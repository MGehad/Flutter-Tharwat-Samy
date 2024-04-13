import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/consts.dart';
import 'package:scholar_chat/views/sign_up_view.dart';
import '../widgets/build_show_snack_bar.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textformfield.dart';
import 'chat_view.dart';

class LoginView extends StatefulWidget {
  static String id = 'Login View';

  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return ModalProgressHUD(
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
                    Text("Login",
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
                    buttonText: "Login",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          UserCredential user = await userLogin();
                          Navigator.pushNamed(context, ChatView.id,
                              arguments: email);
                          buildShowSnackBar(
                              context, 'Welcome ${user.user!.email}');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            buildShowSnackBar(
                                context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            buildShowSnackBar(context,
                                'Wrong password provided for that user.');
                          } else if (e.code == 'invalid-credential') {
                            buildShowSnackBar(
                                context, 'The email or password is wrong');
                          }
                        } catch (e) {
                          print('Error: $e');
                          buildShowSnackBar(
                              context, 'An unexpected error occurred.');
                        }
                        setState(() {
                          isLoading = false;
                        });
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
    );
  }

  Future<UserCredential> userLogin() async {
    var user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
    return user;
  }
}
