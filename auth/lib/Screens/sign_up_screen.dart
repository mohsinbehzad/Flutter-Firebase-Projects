import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 183, 225),
      appBar: AppBar(
        title: Text(
          'SignUp Screen',
          style: TextStyle(
            color: const Color.fromARGB(255, 96, 18, 230),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(171, 209, 46, 227),
      ),
    );
  }
}
