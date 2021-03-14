import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app/json.dart';
import 'package:intl/intl.dart';
import 'package:klook2/components/home.dart';
import 'package:klook2/components/userInfoEmaill.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  DateTime now = DateTime.now();
  SignIn();

  final auth = FirebaseAuth.instance;

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

  // Future<void> getUser(emails, passwords) {
  //   // Call the user's CollectionReference to add a new user
  //   return users
  //       .where('Email', isEqualTo: emails)
  //       .get()
  //       .then((value) => {print("get user"), print(value)})
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                              Text('sdfg'),
                              Padding(padding: EdgeInsets.only(bottom: 20)),
                              TextField(
                                controller: widget.emailController,
                                cursorColor: Colors.orange[900],
                                decoration:
                                    InputDecoration(hintText: 'Email Address'),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20)),
                              TextField(
                                controller: widget.passwordController,

                                cursorColor: Colors.orange[900],
                                // obscureText: true,
                                decoration: InputDecoration(

                                    // focusedBorder: OutlineInputBorder(
                                    //   borderSide: const BorderSide(
                                    //       color: Colors.orange,
                                    //       width: 2.0),
                                    // ),
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
                                      .signInWithEmailAndPassword(
                                          email: widget.emailController.text,
                                          password:
                                              widget.passwordController.text)
                                      .then((value) => {
                                            UserInfoEmaill.userEmaill =
                                                widget.emailController.text,
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (context) => Home(
                                                        // userName: widget
                                                        //     .emailController.text,
                                                        )))
                                          });
                                },
                                padding: EdgeInsets.all(10.0),
                                color: Colors.orange[900],
                                textColor: Colors.white,
                                child: Text("Sign in",
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
