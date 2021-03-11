import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  final TextEditingController emailController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  SignUp();

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
                        child: TabBar(
                          labelColor: Colors.orange[900],
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'Email'),
                            Tab(text: 'Phone Number'),
                          ],
                        ),
                      ),
                      Container(
                          height: 400, //height of TabBarView
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            Container(
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('sdfg'),
                                  Padding(padding: EdgeInsets.only(bottom: 20)),
                                  TextField(
                                    controller: widget.emailController,

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
                                      side:
                                          BorderSide(color: Colors.orange[900]),
                                    ),
                                    onPressed: () => widget.addUser(
                                        widget.emailController.text,
                                        widget.passwordController.text),
                                    padding: EdgeInsets.all(10.0),
                                    color: Colors.orange[900],
                                    textColor: Colors.white,
                                    child: Text("Sign in",
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(padding: EdgeInsets.only(bottom: 20)),
                                  // InternationalPhoneNumberInput(
                                  //   InputDecoration(
                                  //     labelText: 'Phone Number',
                                  //     border: OutlineInputBorder(
                                  //       borderSide: BorderSide(),
                                  //     ),
                                  //   ),
                                  //   // initialCountryCode: 'IN',
                                  //   // onChanged: (phone) {
                                  //   // print(phone.completeNumber);
                                  //   // },
                                  //   onInputChanged: (phone) {
                                  //     print('phone.completeNumber');
                                  //   },
                                  //   hintText: 'UA',
                                  // ),
                                  TextField(
                                    cursorColor: Colors.orange[900],
                                    // obscureText: true,
                                    decoration:
                                        InputDecoration(hintText: 'Phone'),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 20)),
                                  MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    shape: RoundedRectangleBorder(
                                      side:
                                          BorderSide(color: Colors.orange[900]),
                                    ),
                                    onPressed: () {},
                                    padding: EdgeInsets.all(10.0),
                                    color: Colors.orange[900],
                                    textColor: Colors.white,
                                    child: Text("SNext",
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                          ]))
                    ])),
          ]),
        ),
      ),
    );
  }
}
