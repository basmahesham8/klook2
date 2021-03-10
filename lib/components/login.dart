import 'package:flutter/material.dart';
import 'package:klook2/components/signUp.dart';
// import 'package:flutter_app/signup.dart';
// import 'package:flutter_app/json.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  // String text;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              width: 5000,
              margin: EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 300,
                        height: 45,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              // Colors.black,
                              primary: Colors.white,
                              side: BorderSide(color: Colors.grey))
                          // (color: Colors.orangeAccent, width: 2)),
                          ,
                          onPressed: () {
                            // Respond to button press
                          },
                          icon: Image.asset('assets/gmail.png', width: 20),
                          label: Text(
                            "Log In With Google",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 300,
                        height: 45,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              // Colors.black,
                              primary: Colors.blue[900],
                              side: BorderSide(color: Colors.grey))
                          // (color: Colors.orangeAccent, width: 2)),
                          ,
                          onPressed: () {
                            // Respond to button press
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => GetUserName()),
                            // );
                          },
                          icon: Image.asset('assets/face.jpg', width: 25),
                          label: Text(
                            "Log In With Facbook",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    child: MaterialButton(
                      // shape: RoundedRectangleBorder(
                      // side:
                      // BorderSide(color: Colors.orangeAccent, width: 2)),
                      onPressed: () {},
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.deepOrange, width: 2)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Colors.white,
                      textColor: Colors.deepOrange,
                      child: Text("Sign UP", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}