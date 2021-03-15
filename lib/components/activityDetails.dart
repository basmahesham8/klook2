import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klook2/components/login.dart';
import 'package:klook2/components/userInfoEmaill.dart';
import './carousel.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'dart:math';

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import './carousel.dart';
import 'package:klook2/components/circularLoading.dart';

import 'bookingConfirm.dart';

class ActivityDetails extends StatefulWidget {
  final String id;
  ActivityDetails({this.id});

  final CollectionReference users =
      FirebaseFirestore.instance.collection('Booking');
  Future<void> addBooking(emails, title, adults, children, date, image, olders,
      price, sIM, noPerson, sectionName) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'Email': emails, // John Doe
          'Title': title,
          'Adults': adults,
          'Children': children,
          'Date': date,
          'Image': image,
          'Olders': olders,
          'Price': price,
          'SIM': sIM,
          'noPerson': noPerson,
          'sectionName': sectionName // Stokes and Sons
          // 'age': age // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  _ActivityDetailsState createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  String title;
  String city;
  String section;
  String image;
  String booked;
  String categories;
  String date;
  String distance;
  String oldPrice;
  String price;
  String rate;
  String review;
  Map<String, dynamic> data;

  final _nbItems = 6;
  final _itemHeight = 200.0;
  final _itemPositionsListener = ItemPositionsListener.create();

  var sectionsName = ["Package options", "review"];
  int _topItem = 0;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('ToursCollection')
        .doc(widget.id)
        .get()
        .then((value) => {
              if (value.exists)
                {
                  setState(() {
                    data = value.data();
                    title = value.data()["Title"];
                    city = value.data()["City"];
                    section = value.data()["Section"];
                    image = value.data()["Image"];
                    booked = value.data()["Booked"];
                    categories = value.data()["Categories"];
                    date = value.data()["Date"];
                    distance = value.data()["Distance"];
                    oldPrice = value.data()["OldPrice"];
                    price = value.data()["Price"];
                    rate = value.data()["Rate"];
                    review = value.data()["Review"];
                  })
                }
            });

    if (data == null) {
      return CircularLoading();
    } else {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Row(children: [
                Expanded(child: SizedBox(width: 10), flex: 8),
                Expanded(
                    child:
                        Icon(Icons.favorite_border, color: Colors.deepOrange),
                    flex: 2)
              ]),
              leading: Icon(
                Icons.arrow_back,
                color: Colors.deepOrange,
              ),
              backgroundColor: Colors.white,
              pinned: this._pinned,
              snap: this._snap,
              floating: this._floating,
              expandedHeight: 160.0,
              flexibleSpace: FlexibleSpaceBar(
                  // title: Row(
                  //   // mainAxisAlignment: MainAxisAlignment.end,
                  //   children: List.generate(
                  //     sectionsName.length,
                  //     (index) => Padding(
                  //       padding: const EdgeInsets.all(2.0),
                  //       child: Container(
                  //         padding: EdgeInsets.all(4.0),

                  //         child: Text(
                  //           /////// edit
                  //           sectionsName[index],
                  //           style: TextStyle(
                  //             fontSize: 12,
                  //             fontWeight: _topItem == index
                  //                 ? FontWeight.bold
                  //                 : FontWeight.normal,
                  //             color: _topItem == index
                  //                 ? Colors.deepOrange
                  //                 : Colors.black,
                  //             //  decoration: _topItem == index ? TextDecoration.underline :TextDecoration.none ,
                  //           ),
                  //         ),
                  //         //////
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // background: Carousel(),
                  background: Image.network(image)),
            ),
            SliverToBoxAdapter(
              // child: Expanded(
              //   child: ScrollablePositionedList.builder(
              //     itemCount: sectionsName.length,
              //     itemBuilder: (context, index) => SizedBox(
              //       height: _itemHeight,
              //       child: Card(
              //         child: Text('Item $index'),
              //       ),
              //     ),
              //     itemPositionsListener: _itemPositionsListener,
              //     itemScrollController: itemScrollController,
              //   ),
              // ),
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      color: Colors.white,
                      // boxShadow: [
                      //   BoxShadow(color: Colors.green, spreadRadius: 3),
                      // ],
                    ),
                    height: 2000,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                            child: Row(children: [
                              Icon(
                                Icons.star_rate,
                                color: Colors.orange[300],
                                size: 14.0,
                              ),
                              Text.rich(
                                TextSpan(
                                  // text: '4.8', // default text style

                                  children: <TextSpan>[
                                    TextSpan(
                                      text: rate,
                                      style:
                                          TextStyle(color: Colors.orange[300]),
                                    ),
                                    TextSpan(
                                        text: ' (${review} reviews) ',
                                        style:
                                            TextStyle(color: Colors.blue[300])),
                                  ],
                                ),
                              ),
                              Text(
                                ' | ',
                                style: TextStyle(
                                    color: Colors.grey[200], fontSize: 20),
                              ),
                              Icon(
                                Icons.supervisor_account,
                                color: Colors.grey[300],
                                size: 20.0,
                              ),
                              Text(
                                ' ${booked} Booked ',
                                style: TextStyle(
                                    color: Colors.grey[350], fontSize: 14),
                              ),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Divider(
                              height: 1.0,
                              thickness: 1.0,
                              indent: 20.0,
                              endIndent: 20.0,
                            ),
                          ),
                          Row(children: [
                            Transform.rotate(
                              angle: 90 * pi / 180,
                              child: IconButton(
                                icon: Icon(
                                  Icons.maximize,
                                  color: Colors.deepOrange,
                                  size: 20.0,
                                ),
                                onPressed: null,
                              ),
                            ),
                            Text('Package options',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 0, 10),
                                child: Row(children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      child: Icon(
                                        Icons.alarm,
                                        color: Colors.black54,
                                        size: 20.0,
                                      )),
                                  Text(
                                    'Book now for ${date}',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                  )
                                ])),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 0, 10),
                                child: Row(children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      child: Icon(
                                        Icons.bolt,
                                        color: Colors.deepOrange,
                                        size: 20.0,
                                      )),
                                  Text(
                                    'Instance confirmation',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                  )
                                ])),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 0, 10),
                                child: Row(children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      child: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.black54,
                                        size: 20.0,
                                      )),
                                  Text(
                                    'No cancellation',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                  )
                                ])),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 0, 10),
                                child: Row(children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      child: Icon(
                                        Icons.print,
                                        color: Colors.black54,
                                        size: 20.0,
                                      )),
                                  Text(
                                    'Show mobile or printed voucher',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                  )
                                ])),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 0, 10),
                                child: Row(children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Colors.black54,
                                        size: 20.0,
                                      )),
                                  Text(
                                    'Open date ticket',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                  )
                                ])),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 0, 10),
                                child: Row(children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      child: Icon(
                                        Icons.supervisor_account,
                                        color: Colors.black54,
                                        size: 20.0,
                                      )),
                                  Text(
                                    'Skip the ticket line & enter with voucher',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                  )
                                ])),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 0, 10),
                                child: Row(children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      child: Icon(
                                        Icons.access_time,
                                        color: Colors.black54,
                                        size: 20.0,
                                      )),
                                  Text(
                                    '1 day(s) Duration',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                  )
                                ])),
                          ]),
                          Divider(
                            height: 1.0,
                            thickness: 1.0,
                            indent: 20.0,
                            endIndent: 20.0,
                          ),
                          Row(children: [
                            Transform.rotate(
                              angle: 90 * pi / 180,
                              child: IconButton(
                                icon: Icon(
                                  Icons.maximize,
                                  color: Colors.deepOrange,
                                  size: 20.0,
                                ),
                                onPressed: null,
                              ),
                            ),
                            Text('Reviews',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ])
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: null,
          child: Container(
              height: 70.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Row(children: [
                  Expanded(
                      child: Text.rich(
                        TextSpan(
                          // text: '4.8', // default text style

                          children: <TextSpan>[
                            TextSpan(
                              text: 'us\$ ${price} ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                            TextSpan(
                                text: " us\$  ${oldPrice} ",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                      ),
                      flex: 6),
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          UserInfoEmaill.userEmaill.length > 2
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookingCalender(
                                            title: title,
                                            date: date,
                                            price: price,
                                            image: image,
                                          )))
                              // widget.addBooking(
                              //     UserInfoEmaill.userEmaill,
                              //     title,
                              //     2,
                              //     2,
                              //     date,
                              //     image,
                              //     2,
                              //     price,
                              //     12,
                              //     3,
                              //     'section')
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                          // if (_formKey.currentState.validate()) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => PostDetails(id : 3)),
                          //   );
                          // }
                        },
                        child: Text('Book now',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                        ),
                      ),
                      flex: 4),
                ]),
              )),
        ),
      );
    }
  }
}
