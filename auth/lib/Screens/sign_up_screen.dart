import 'package:auth/Screens/home_screen.dart';
import 'package:auth/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignUpScreen());
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 100,
                  color: const Color.fromARGB(255, 228, 57, 114),
                ),

                SizedBox(height: 15),

                Text(
                  'Welcome ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.deepPurpleAccent,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Let's Build Your Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 177, 51, 93),
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
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
                    hintText: 'Enter Email',
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
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
                    hintText: 'Enter Password',
                  ),
                  obscureText: true,
                ),

                SizedBox(height: 15),

                ElevatedButton(
                  onPressed: () {
                    createUserWithEmailAndPassword();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 239, 92, 217),
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 67, 17, 205),
                    ),
                    minimumSize: WidgetStateProperty.all(
                      Size(150, 50), // width & height
                    ),
                  ),

                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),

                    SizedBox(width: 5),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, LoginScreen.route());
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 177, 51, 93),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
