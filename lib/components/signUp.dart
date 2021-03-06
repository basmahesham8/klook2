import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app/json.dart';
import 'package:intl/intl.dart';
import 'package:klook2/components/bookings.dart';
import 'package:klook2/components/home.dart';
import 'package:klook2/components/userInfoEmaill.dart';
// import 'package:klook2/components/user.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  DateTime now = DateTime.now();
  SignUp();

  final auth = FirebaseAuth.instance;

  String userEmail = 'dd';

  // static String userEmaill;
  getemail(String em) {
    userEmail = em;
  }

  final CollectionReference users =
  FirebaseFirestore.instance.collection('users');
  // String iduser = '52563';
  Future<void> addUser(emails, name, passwords) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'Email': emails, // John Doe
      'Password': passwords, // Stokes and Sons
      'Name': name,
      'Date': now // Stokes and Sons
      // 'age': age // 42
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> getUser(emails, passwords) {
    // Call the user's CollectionReference to add a new user
    return users
        .where('Email', isEqualTo: emails)
        .get()
        .then((value) => {print("get user"), print(value)})
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text(''),
      ),
      body: Container(
        margin: const EdgeInsets.all(40),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20.0),
            DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Container(
                          child: Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(padding: EdgeInsets.only(bottom: 20)),
                              TextField(
                                controller: widget.emailController,
                                cursorColor: Colors.orange[900],
                                decoration:
                                InputDecoration(hintText: 'Email Address'),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20)),
                              TextField(
                                controller: widget.nameController,
                                cursorColor: Colors.orange[900],
                                decoration:
                                InputDecoration(hintText: 'User Name'),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20)),
                              TextField(
                                controller: widget.passwordController,

                                cursorColor: Colors.orange[900],
                                obscureText: true,
                                decoration: InputDecoration(


                                    hintText: 'Password'),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20)),
                              MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.orange[900]),
                                ),
                                onPressed: () {
                                  widget.auth
                                      .createUserWithEmailAndPassword(
                                      email: widget.emailController.text,
                                      password:
                                      widget.passwordController.text)
                                      .then((_) {
                                    widget.addUser(
                                        widget.emailController.text,
                                        widget.nameController.text,
                                        widget.passwordController.text);
                                    UserInfoEmaill.userEmaill =
                                        widget.emailController.text;
                                    widget.emailController.text;
                                    UserInfoEmaill.userEmaill =
                                        widget.emailController.text;
                                    Navigator.pop(context);
                                    // Navigator.of(context)
                                    //     .pushReplacement(MaterialPageRoute(
                                    //         builder: (context) => Booking(
                                    //               userName:
                                    //                   'widget.emailController.text',
                                    //             ))
                                    //             );
                                  });
                                },
                                padding: EdgeInsets.all(10.0),
                                color: Colors.orange[900],
                                textColor: Colors.white,
                                child: Text("Sign Up",
                                    style: TextStyle(fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                      )
                      // )
                    ])),
          ]),
        ),
      ),
    );
  }
}