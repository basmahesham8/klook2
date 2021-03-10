import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app/services/database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool userlogin = false;
  var login = [];

  @override
  void initState() {
    super.initState();
    // fetchDatabaseList();
  }

  // fetchDatabaseList() {
  // dynamic resultant = SignService().getUserLogin();
  //   login = SignService().getUserLogin('hagar@elgarh998.com', '123123');

  // if (resultant == null) {
  //   print('Unable to retrieve');
  // } else {
  //   print('dhhh');
  //   setState(() {
  //     login = resultant;
  //   });
  // }
  // }
  // @override
  // void initState() {
  //   super.initState();

  //   login = SignService().getUserLogin('hagar@elgarh998.com', '123123');
  // }

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
