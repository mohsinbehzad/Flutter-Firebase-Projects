import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();

  final dbRef = FirebaseDatabase.instance.ref("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 183, 225),
      appBar: AppBar(
        title: Text(
          'Add User',
          style: TextStyle(
            color: const Color.fromARGB(255, 96, 18, 230),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(171, 209, 46, 227),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
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
                labelText: "Name",
              ),
            ),
            SizedBox(height: 15),

            TextField(
              controller: emailController,
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
                labelText: "Email",
              ),
            ),
            SizedBox(height: 15),

            TextField(
              controller: ageController,
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
                labelText: "Age",
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                dbRef.push().set({
                  "name": nameController.text,
                  "email": emailController.text,
                });

                Navigator.pop(context); // Go back to Home
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
              child: Text("Add User"),
            ),
          ],
        ),
      ),
    );
  }
}
