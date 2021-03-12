import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klook2/components/bookeingDB.dart';
// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:klook2/components/Card.dart';
import 'package:klook2/components/tourCard.dart';

class Booking2 extends StatefulWidget {
  bool dataHas = false;
  @override
  _Booking2State createState() => _Booking2State();
}

class _Booking2State extends State<Booking2> {
  String dropdownValue = 'Bookings';

  GetUserName objj;

  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<DocumentSnapshot> documentss = objj.getlist();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('ToursCollection')
                .where('Section', isEqualTo: 'BestSeller')
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // widget.dataHas = true;
                return Text("Loading");
              }

              if (snapshot.data.docs.isNotEmpty) {
                widget.dataHas = true;
              } else {
                widget.dataHas = false;
              }

              final List<DocumentSnapshot> documents = snapshot.data.docs;

              return SingleChildScrollView(
                  child: widget.dataHas == true
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
                                                    'My',
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
                            Container(
                              height: 300,
                              width: 400,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: documentss
                                      .map((doc) => MCard(
                                                title: doc['Title'],
                                                city: doc['City'],
                                                section: doc['Section'],
                                                image: doc['Image'],
                                                booked: doc['Booked'],
                                                categories: doc['Categories'],
                                                date: doc['Date'],
                                                price: doc['Price'],
                                                rate: doc['Rate'],
                                                review: doc['Review'],
                                                distance: doc['Distance'],
                                                imageheight: 60,
                                              )
                                          // Card(
                                          //       child: ListTile(
                                          //         title: Text(doc['City']),
                                          //         subtitle: Text(doc['Title']),
                                          //       ),
                                          //     )
                                          )
                                      .toList()),
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
                                                      'My ',
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
                              Container(
                                height: 300,
                                width: 400,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: documents
                                        .map((doc) => MCard(
                                                  title: doc['Title'],
                                                  city: doc['City'],
                                                  section: doc['Section'],
                                                  image: doc['Image'],
                                                  booked: doc['Booked'],
                                                  categories: doc['Categories'],
                                                  date: doc['Date'],
                                                  price: doc['Price'],
                                                  rate: doc['Rate'],
                                                  review: doc['Review'],
                                                  distance: doc['Distance'],
                                                  imageheight: 60,
                                                )
                                            // Card(
                                            //       child: ListTile(
                                            //         title: Text(doc['City']),
                                            //         subtitle: Text(doc['Title']),
                                            //       ),
                                            //     )
                                            )
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