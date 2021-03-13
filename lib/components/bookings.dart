import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klook2/components/BookedCard.dart';
import 'package:klook2/components/signUp.dart';
import 'package:klook2/components/userInfoEmaill.dart';
// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:klook2/components/Card.dart';
// import 'package:klook2/components/tourCard.dart';

class Booking extends StatefulWidget {
  bool dataHas = false;
  final String userName;

  // SignUp sign;
  // var usernamee = SignUp.userEmail;

  String userIS;
  Booking({Key key, this.userName = ''}) : super(key: key);

  check() {
    if (userName.length < 1) {
      userIS = 'usernamee';
      // usernamee = '';
    } else {
      userIS = userName;
    }
  }

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String dropdownValue = 'Bookings';

  // int _currentIndex = 0;

// if(widget.)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('Booking')
                .where('Email', isEqualTo: UserInfoEmaill.userEmaill)
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // widget.dataHas = true;
                return Text("Loading");
              }
              widget.check();
              if (snapshot.data.docs.isNotEmpty) {
                widget.dataHas = true;
              } else {
                widget.dataHas = false;
              }

              final List<DocumentSnapshot> documents = snapshot.data.docs;

              return SingleChildScrollView(
                  child: widget.dataHas == false
                      ? Column(
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SafeArea(
                                                  left: false,
                                                  top: true,
                                                  bottom: true,
                                                  right: false,
                                                  child: Text(
                                                    'My Bookings',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                              SafeArea(
                                                  left: false,
                                                  top: true,
                                                  bottom: true,
                                                  right: false,
                                                  child: Icon(
                                                      Icons.add_shopping_cart)),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        DropdownButton<String>(
                                          value: dropdownValue,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          autofocus: true,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                          underline: Container(
                                            height: 0,
                                            // color: Colors.deepPurpleAccent,
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                            });
                                          },
                                          items: <String>[
                                            'Bookings',
                                            'Invaild Bookings',
                                            'Archived Bookings'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                        Center(
                                          child: Container(
                                              child: Image.asset(
                                            'assets/book.jpg',
                                            width: 300,
                                          )
                                              // ),
                                              ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 30, bottom: 10),
                                          child: Text(
                                            'Popular activities',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ])
                                  // ]),
                                  ),
                            ),
                          ],
                        )
                      : Container(
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SafeArea(
                                                    left: false,
                                                    top: true,
                                                    bottom: true,
                                                    right: false,
                                                    child: Text(
                                                      'My Bookings',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                                SafeArea(
                                                    left: false,
                                                    top: true,
                                                    bottom: true,
                                                    right: false,
                                                    child: Icon(Icons
                                                        .add_shopping_cart)),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                          ),
                                          DropdownButton<String>(
                                            value: dropdownValue,
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconSize: 24,
                                            elevation: 16,
                                            autofocus: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                            underline: Container(
                                              height: 0,
                                              // color: Colors.deepPurpleAccent,
                                            ),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                dropdownValue = newValue;
                                              });
                                            },
                                            items: <String>[
                                              'Bookings',
                                              'Invaild Bookings',
                                              'Archived Bookings'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ])
                                    // ]),
                                    ),
                              ),
                              Container(
                                margin: EdgeInsets.all(15),
                                height: 480,
                                width: 400,
                                child: ListView(
                                    scrollDirection: Axis.vertical,
                                    children: documents
                                        .map((doc) => BookedCard(
                                              noPerson: doc['noPerson'],
                                              userName:
                                                  UserInfoEmaill.userEmaill,
                                              title: doc['Title'],
                                              // city: doc['City'],
                                              // section: doc['Section'],
                                              image: doc['Image'],
                                              // booked: doc['Booked'],
                                              // categories: doc['Categories'],
                                              date: doc['Date'],
                                              price: doc['Price'],
                                              // rate: doc['Rate'],
                                              // review: doc['Review'],
                                              // distance: doc['Distance'],
                                              // imageheight: 60,
                                            ))
                                        .toList()),
                              ),
                            ],
                          ),
                        ));
            }),
      ),
    );
  }
}
