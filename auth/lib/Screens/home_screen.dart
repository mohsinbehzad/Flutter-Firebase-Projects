import 'package:auth/Screens/add_user_screen.dart';
import 'package:auth/Screens/user_list_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserScreen()),
                );
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
              child: Text('Add User'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserListScreen()),
                );
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
              child: Text("View Users"),
            ),
            SizedBox(height: 20),
            Text(
              "Signed in as: ${user.email!}",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepPurpleAccent,
              child: Text("Sign Out", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
