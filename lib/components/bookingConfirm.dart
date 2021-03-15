import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:klook2/components/userInfoEmaill.dart';

class BookingCalender extends StatefulWidget {
  BookingCalender({Key key, this.title, this.image, this.date, this.price})
      : super(key: key);

  final String title;
  final String image;
  final String date;
  final String price;
  // final String title;

  @override
  _BookingCalenderState createState() => _BookingCalenderState();
}

class _BookingCalenderState extends State<BookingCalender> {
  DateTime selectedDate = DateTime.now();

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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021, 3),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  int _n = 0;
  int _m = 0;
  int _v = 0;
  String _noperson = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirm'),
      ),
      body: Container(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // crossAxisSize: cr
          children: <Widget>[
            Row(
              children: [
                SizedBox(
                  height: 80,
                ),
                Padding(padding: EdgeInsets.only(left: 20)),
                Icon(
                  Icons.bus_alert,
                  color: Colors.deepOrange,
                  size: 20,
                ),
                Padding(padding: EdgeInsets.only(right: 8)),
                Container(
                  width: 300,
                  child: Text(widget.title,
                      maxLines: 2,
                      // softWrap: s,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
              ],
            ),
            // Container(
            //   width: 300,
            //   child: Text(widget.image.toString(),
            //       maxLines: 2,
            //       // softWrap: s,
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //       )),
            // ),
            MaterialButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
              color: Colors.deepOrange,
              textColor: Colors.white,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              margin: EdgeInsets.all(20),
              child: Container(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Text('Adult',
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.black)),
                        Text('US',
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    new Text('$_n',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.deepOrange)),
                    Container(
                      width: 50,
                      child: new FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Colors.deepOrange, width: 1)),
                        onPressed: add,
                        child: new Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.deepOrange,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Container(
                      width: 50,
                      // height: 40,
                      // color: ,
                      // padding: EdgeInsets.only(top: 10),
                      child: new FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Colors.deepOrange, width: 1)),
                        focusColor: Colors.deepOrange,
                        hoverColor: Colors.deepOrange,
                        onPressed: minus,
                        child: new Icon(Icons.minimize_sharp,
                            // const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                            color: Colors.deepOrange),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //     // height: 2,
            //     ),
            Card(
              margin: EdgeInsets.all(20),
              child: Container(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Text('Child(6-11)',
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.black)),
                        Text('US',
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    new Text('$_m',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.deepOrange)),
                    Container(
                      width: 50,
                      child: new FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Colors.deepOrange, width: 1)),
                        onPressed: addm,
                        child: new Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.deepOrange,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Container(
                      width: 50,
                      // height: 40,
                      // color: ,
                      // padding: EdgeInsets.only(top: 10),
                      child: new FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Colors.deepOrange, width: 1)),
                        focusColor: Colors.deepOrange,
                        hoverColor: Colors.deepOrange,
                        onPressed: minusm,
                        child: new Icon(Icons.minimize_sharp,
                            // const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                            color: Colors.deepOrange),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              child: Container(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Text('Older',
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.black)),
                        Text('US',
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    new Text('$_v',
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.deepOrange)),
                    Container(
                      width: 50,
                      child: new FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Colors.deepOrange, width: 1)),
                        onPressed: addv,
                        child: new Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.deepOrange,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Container(
                      width: 50,
                      // height: 40,
                      // color: ,
                      // padding: EdgeInsets.only(top: 10),
                      child: new FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Colors.deepOrange, width: 1)),
                        focusColor: Colors.deepOrange,
                        hoverColor: Colors.deepOrange,
                        onPressed: minusv,
                        child: new Icon(Icons.minimize_sharp,
                            // const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                            color: Colors.deepOrange),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: 200,
              height: 50,
              child: MaterialButton(
                onPressed: () {
                  noperson();
                  addBooking(
                      UserInfoEmaill.userEmaill,
                      widget.title,
                      _n,
                      _m,
                      "${selectedDate.toLocal()}".split(' ')[0],
                      widget.image,
                      _v,
                      widget.price,
                      'SIM',
                      _noperson,
                      'section');
                  Navigator.pop(context);
                  Navigator.pop(context);
                  // Navigator.pop(context);
                  // Navigator.pop(context);
                },
                child: Text(
                  'Book Now',
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.deepOrange,
                textColor: Colors.white,
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
      else
        _n = 0;
    });
  }

  void addv() {
    setState(() {
      _v++;
    });
  }

  void minusv() {
    setState(() {
      if (_v != 0)
        _v--;
      else
        _v = 0;
    });
  }

  void addm() {
    setState(() {
      _m++;
    });
  }

  void minusm() {
    setState(() {
      if (_m != 0)
        _m--;
      else
        _m = 0;
    });
  }

  int _noperson2;
  void noperson() {
    _noperson2 = _n + _m + _v;
    setState(() {
      _noperson = _noperson2.toString();
    });
  }
}
