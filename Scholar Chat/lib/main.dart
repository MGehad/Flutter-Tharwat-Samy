import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/Signup_cubit/signup_cubit.dart';
import 'cubits/login_cubit/login_cubit.dart';
import 'firebase_options.dart';
import 'views/chat_view.dart';
import 'views/login_view.dart';
import 'views/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          LoginView.id: (context) => const LoginView(),
          SignUpView.id: (context) => const SignUpView(),
          ChatView.id: (context) => ChatView()
        },
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginView.id,
      ),
    );
  }
}
