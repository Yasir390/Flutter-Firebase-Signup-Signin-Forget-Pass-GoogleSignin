import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_rsfg/screens/forgot_pass_screen.dart';
import 'package:flutter_firebase_rsfg/screens/home_screen.dart';
import 'package:flutter_firebase_rsfg/screens/signin_screen.dart';
import 'package:flutter_firebase_rsfg/screens/signup_screen.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SignupScreen.route,
      routes: {
        SignupScreen.route:(context)=> SignupScreen(),
        HomeScreen.route:(context)=> HomeScreen(),
        SignInScreen.route:(context)=> SignInScreen(),
        ForgotPasswordScreen.route:(context)=> ForgotPasswordScreen(),

      },
    );
  }
}
