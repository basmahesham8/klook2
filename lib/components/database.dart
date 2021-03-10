import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  // static String iduser = '52563';

  // final int age;
  final TextEditingController emailController = new TextEditingController();

  String emailtext;
  TextEditingController passwordController = new TextEditingController();

  AddUser(this.fullName, this.company, this.emailtext);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // String iduser = '52563';
    Future<void> addUser(emails, passwords) {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'Email': emails, // John Doe
            'Password': passwords, // Stokes and Sons
            // 'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Column(
      children: [
        TextField(
          controller: emailController,

          cursorColor: Colors.orange[900],
          // obscureText: true,
          decoration: InputDecoration(

              // focusedBorder: OutlineInputBorder(
              //   borderSide: const BorderSide(
              //       color: Colors.orange,
              //       width: 2.0),
              // ),
              hintText: 'Email Address'),
        ),
        TextField(
          controller: passwordController,
          cursorColor: Colors.orange[900],
          decoration: InputDecoration(hintText: 'Password'),
        ),
        MaterialButton(
          onPressed: () => addUser(emailController.text, 'sh'),
          child: Text(
            "Add User",
          ),
        ),
        Text(emailtext)
      ],
    );
  }
}
