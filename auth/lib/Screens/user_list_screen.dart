import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final dbRef = FirebaseDatabase.instance.ref("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 183, 225),
      appBar: AppBar(
        title: Text(
          'All Users',
          style: TextStyle(
            color: const Color.fromARGB(255, 96, 18, 230),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(171, 209, 46, 227),
      ),
      body: StreamBuilder(
        stream: dbRef.onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
            return Center(child: Text("No Users Found"));
          }

          final data = Map<dynamic, dynamic>.from(
            snapshot.data!.snapshot.value as Map,
          );

          final keys = data.keys.toList();

          return ListView.builder(
            itemCount: keys.length,
            itemBuilder: (context, index) {
              String userId = keys[index];
              Map user = Map<String, dynamic>.from(data[userId]);

              return ListTile(
                title: Text(
                  user["name"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                subtitle: Text(
                  "${user["email"]}\nAge: ${user["age"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 177, 51, 93),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        final nameEdit = TextEditingController(
                          text: user["name"],
                        );
                        final emailEdit = TextEditingController(
                          text: user["email"],
                        );
                        final ageEdit = TextEditingController(
                          text: user["age"],
                        );

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: const Color.fromARGB(
                              255,
                              104,
                              225,
                              234,
                            ),

                            title: Text(
                              "Update User",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: const Color.fromARGB(255, 65, 5, 227),
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: nameEdit,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                                TextField(
                                  controller: emailEdit,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 177, 51, 93),
                                  ),
                                ),
                                TextField(
                                  controller: ageEdit,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 177, 51, 93),
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  dbRef.child(userId).update({
                                    "name": nameEdit.text,
                                    "email": emailEdit.text,
                                    "age": ageEdit.text,
                                  });

                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                    const Color.fromARGB(255, 239, 92, 217),
                                  ),
                                  foregroundColor: WidgetStateProperty.all(
                                    const Color.fromARGB(255, 67, 17, 205),
                                  ),
                                  minimumSize: WidgetStateProperty.all(
                                    Size(150, 50),
                                  ),
                                ),
                                child: Text("Update"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        dbRef.child(userId).remove();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
