import 'package:auth/Screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => LoginScreen());
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 183, 225),
      appBar: AppBar(
        title: Text(
          "Login Screen",
          style: TextStyle(
            color: const Color.fromARGB(255, 96, 18, 230),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(171, 209, 46, 227),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 100,
                color: const Color.fromARGB(255, 228, 57, 114),
              ),
              SizedBox(height: 30),
              Text(
                "Welcome Back!!!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "It's been a pleasure your'e here!!!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 177, 51, 93),
                ),
              ),
              SizedBox(height: 20),

              // Email Text Field
              Padding(
                padding: EdgeInsets.all(14),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 152, 23, 66),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      borderSide: BorderSide(color: Colors.pinkAccent),
                    ),
                    fillColor: const Color.fromARGB(255, 197, 181, 186),
                    filled: true,
                  ),
                ),
              ),

              // Password TextField
              Padding(
                padding: EdgeInsets.all(14),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 152, 23, 66),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      borderSide: BorderSide(color: Colors.pinkAccent),
                    ),
                    fillColor: const Color.fromARGB(255, 197, 181, 186),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 239, 92, 217),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 67, 17, 205),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a Member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, SignUpScreen.route());
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 177, 51, 93),
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
