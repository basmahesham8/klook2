import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klook2/components/signIn.dart';
import 'package:klook2/components/signUp.dart';
import 'package:klook2/components/userInfoEmaill.dart';
// import 'package:flutter_app/signup.dart';
// import 'package:flutter_app/json.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  // String text;
  // if(UserInfoEmaill.userEmaill)
  bool dataHas = true;

  final auth = FirebaseAuth.instance;

  LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/kllok.jpg',
                fit: BoxFit.fitWidth,
                // width: 420,
                // height: 220,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: UserInfoEmaill.userEmaill.length < 2
            // child: UserInfoEmaill.userEmaillbBool == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Container(
                    width: 5000,
                    margin: EdgeInsets.only(top: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 300,
                          child: MaterialButton(
                            // shape: RoundedRectangleBorder(
                            // side:
                            // BorderSide(color: Colors.orangeAccent, width: 2)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                            },
                            padding: EdgeInsets.all(10.0),
                            color: Colors.deepOrange,
                            textColor: Colors.white,
                            child: Text("Email / Password",
                                style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            'OR',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.deepOrange, width: 2)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            padding: EdgeInsets.all(10.0),
                            color: Colors.white,
                            textColor: Colors.deepOrange,
                            child:
                                Text("Sign UP", style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 50)),
                  Container(
                    child: Text(
                      UserInfoEmaill.userEmaill,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 160)),
                  MaterialButton(
                    // child: Text('Logout'),
                    onPressed: () {
                      // UserInfoEmaill.userEmaill = '1';
                      _doSomething();
                      widget.auth.signOut();
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                    child: Text("Logout", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
      ),
    );
  }

  void _doSomething() {
    // Using the callback State.setState() is the only way to get the build
    // method to rerun with the updated state value.
    setState(() {
      UserInfoEmaill.userEmaill = '1';
    });
  }
}
