import 'package:flutter/material.dart';
import 'package:frontend/screens/login.dart';
//import 'package:frontend/screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VentasApp ',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 17, 177)),
      ),
      home: const LoginScreen(),
      //home: const SigninScreen(),
    );
  }
}
